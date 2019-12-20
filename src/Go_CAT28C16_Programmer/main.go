package main

/*
This programmer uses two UART channels:
 1) One USB-to-UART channel to send/receive data to a Mega2560.
 2) A second channel to control the programmer via a console gui.

Because all the files are in the same directory you need to run "main.go" as
follows:
> go run .
or
> go run *

*/

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/jacobsa/go-serial/serial"
)

var quit = false

func main() {
	// Read json file for runtime parameters
	// Open our jsonFile
	jsonFile, err := os.Open("config.json")
	// if we os.Open returns an error then handle it
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Successfully Opened config file.")

	// defer the closing of our jsonFile so that we can parse it later on
	defer jsonFile.Close()

	byteValue, _ := ioutil.ReadAll(jsonFile)

	var config map[string]interface{}
	json.Unmarshal([]byte(byteValue), &config)

	portName := "/dev/ttyUSB0"
	options := serial.OpenOptions{
		PortName:        portName,
		BaudRate:        1000000,
		DataBits:        8,
		StopBits:        1,
		ParityMode:      serial.PARITY_NONE,
		MinimumReadSize: 4,
	}

	// Open the port.
	port, err := serial.Open(options)
	if err != nil {
		log.Println(err)
		fmt.Print("Couldn't open ", portName)

		portName = "/dev/ttyUSB1"
		fmt.Println(" trying ", portName)
		options.PortName = portName

		// Open the port.
		port, err = serial.Open(options)
		if err != nil {
			log.Fatalf("serial.Open: %v", err)
		}
	}

	fmt.Println("Opened port to: ", portName)

	// Make sure to close it later.
	defer port.Close()

	programmer(config, port)
}
