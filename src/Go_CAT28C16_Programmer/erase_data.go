package main

import (
	"fmt"
	"io"
	"log"
	"os"
)

func eraseData(config map[string]interface{}, port io.ReadWriteCloser) {
	ramFile := config["RAM"].(string)

	fmt.Println("Writing to: ", ramFile)

	dataFile, err := os.Create(ramFile)
	// if we os.Open returns an error then handle it
	if err != nil {
		log.Fatal(err)
	}

	defer dataFile.Close()

	fmt.Println("Read starting...")

	// Begin erase protocol with Mega
	data := []byte("erase")
	_, err = port.Write(data)
	if err != nil {
		log.Fatal(err)
	}

	// Wait for "ack" from Mega
	ack := []byte{0, 0, 0}
	_, errR := port.Read(ack)
	if errR != nil {
		log.Fatal(errR)
	}

	ack_rep := string(ack)
	if ack_rep == "ack" {
		fmt.Println("Mega is erasing...")

		for {
			resp := []byte{0}
			_, errR := port.Read(resp)
			if errR != nil {
				log.Fatal(errR)
			}

			if resp[0] == 2 {
				fmt.Println("")
				fmt.Println("Successfully erased NV Ram")
				break
			} else if resp[0] == 0 {
				fmt.Println("")
				fmt.Println("Failed to erase NV Ram")
				break
			} else if resp[0] == 1 {
				fmt.Print(".")
			}
		}
	}
}
