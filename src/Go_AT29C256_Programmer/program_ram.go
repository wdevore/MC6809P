package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"os"
)

func programmer(config map[string]interface{}, port io.ReadWriteCloser) {
	reader := bufio.NewReader(os.Stdin)

	quit := false

	for !quit {
		fmt.Println("-------------------------------")
		fmt.Println("### ROM programmer ###")
		fmt.Println("Enter one of the following:")
		fmt.Println("'q' to quit/exit")
		fmt.Println("'w' to write data to ROM")
		fmt.Println("'r' to read data from ROM to file")
		// fmt.Println("'f' to verify data from file against ROM")
		fmt.Println("'e' to erase data from ROM")
		fmt.Println("'d' to disable Software Data Protect Mode")
		fmt.Println("'v' to list Mega2560 sketch version and type")
		fmt.Println("-------------------------------")
		fmt.Print(">")

		cmd, _ := reader.ReadString('\n')

		if cmd == "q\n" {
			quit = true
			continue
		}

		if cmd == "w\n" {
			writeData(config, port)

			fmt.Println("____ Writing complete ____")
			quit = true
			continue
		}
		if cmd == "f\n" {
			verifyData(config, port)

			fmt.Println("____ Verification complete ____")

			quit = true
			continue
		}

		if cmd == "r\n" {
			readData(config, port)

			fmt.Println("____ Reading complete ____")

			quit = true
			continue
		}

		if cmd == "e\n" {
			eraseData(config, port)

			fmt.Println("____ Erasing complete ____")

			quit = true
			continue
		}

		if cmd == "d\n" {
			data := []byte("sdpd")
			_, err := port.Write(data)
			if err != nil {
				log.Fatal(err)
			}

			fmt.Println("____ SDPD complete ____")

			quit = true
			continue
		}

		if cmd == "v\n" {
			data := []byte("version")
			_, err := port.Write(data)
			if err != nil {
				log.Fatal(err)
			}

			// Wait for response
			ack := []byte{0, 0, 0}
			_, errR := port.Read(ack)
			if errR != nil {
				log.Fatal(errR)
			}
			fmt.Printf("Mega version: [%d.%d.%d]\n", ack[0], ack[1], ack[2])

			// The Mega will send back upto 256 characters
			prog := []byte{0}
			port.Read(prog)

			fmt.Print("Programmer type: [")
			pln := int(prog[0])
			for i := 0; i < pln; i++ {
				port.Read(prog)
				fmt.Printf("%c", prog[0])
			}
			fmt.Println("]")

			quit = true
			continue
		}

		fmt.Println("____ UNKNOWN COMMAND _____")
	}

	fmt.Println("Goodbye.")
}

/*
	// Send length
	block_len := make([]byte, 2)
	binary.LittleEndian.PutUint16(block_len, 123)
	_, err = port.Write(block_len)

*/
