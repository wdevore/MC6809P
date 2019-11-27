package main

/*
Reference:
https://learn.adafruit.com/adafruit-ft232h-breakout/more-info

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

	options := serial.OpenOptions{
		PortName:        "/dev/ttyUSB1",
		BaudRate:        1000000,
		DataBits:        8,
		StopBits:        1,
		ParityMode:      serial.PARITY_NONE,
		MinimumReadSize: 4,
	}

	// Open the port.
	portName := "/dev/ttyUSB1"

	port, err := serial.Open(options)
	if err != nil {
		fmt.Println("Couldn't open ttyUSB1 trying USB2")
		portName = "/dev/ttyUSB2"
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
