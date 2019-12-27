package main

import (
	"fmt"
	"io"
	"log"
)

func eraseData(config map[string]interface{}, port io.ReadWriteCloser) {
	fmt.Println("Erase starting...")

	// Begin erase protocol with Mega
	data := []byte("erase")
	_, err := port.Write(data)
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
		fmt.Println("Mega is ready to erase.")

		for {
			resp := []byte{0}
			_, errR := port.Read(resp)
			if errR != nil {
				log.Fatal(errR)
			}

			if resp[0] == 1 {
				fmt.Println("")
				fmt.Println("Successfully erased ROM")
				break
			} else if resp[0] == 0 {
				fmt.Println("")
				fmt.Println("Failed to erase ROM")
				break
			}
		}
	}
}
