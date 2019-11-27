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
		fmt.Println("### FM1808 NVRam programmer ###")
		fmt.Println("Enter one of the following:")
		fmt.Println("'q' to quit/exit")
		fmt.Println("'w' to write data to Ram")
		fmt.Println("'r' to read data from ram to file")
		fmt.Println("'f' to verify data from file against ram")
		fmt.Println("'v' to list Mega2560 sketch version")
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

			continue
		}
		if cmd == "f\n" {
			verifyData(config, port)

			fmt.Println("____ Verification complete ____")

			continue
		}

		if cmd == "r\n" {
			readData(config, port)

			fmt.Println("____ Reading complete ____")

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
