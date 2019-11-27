package main

import (
	"bufio"
	"encoding/hex"
	"fmt"
	"io"
	"log"
	"os"
	"strings"
)

const DATA = 0
const EOD = 1

func writeData(config map[string]interface{}, port io.ReadWriteCloser) {
	romFile := config["ROM"].(string)

	dataFile, err := os.Open(romFile)
	// if we os.Open returns an error then handle it
	if err != nil {
		log.Fatal(err)
	}

	defer dataFile.Close()

	scanner := bufio.NewScanner(dataFile)

	// ----------------------------------------------------------------
	// Begin scanning data
	// ----------------------------------------------------------------
	fmt.Println("Block write starting...")
	for scanner.Scan() {
		line := scanner.Text()

		if !strings.Contains(line, "//") && line != "" {
			if line == "Stop" {
				break
			}

			if strings.Contains(line, "Block") {
				// Begin write protocol with Mega
				data := []byte("write")
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
					// Mega is ready for writing a block
					stopped := processWriteBlock(scanner, port)
					if stopped {
						break
					}
				}
			}
		}
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
}

func processWriteBlock(scanner *bufio.Scanner, port io.ReadWriteCloser) (stopped bool) {
	stopped = false

	block := scanner.Text()

	// Parse Block to get starting address for this block
	// fmt.Println("line: ", block)
	fields := strings.Split(block, " ")

	hexes, err := hex.DecodeString(fields[1])
	if err != nil {
		log.Fatal(err)
	}

	// Send start address: low/high = little endian
	data := []byte{hexes[1], hexes[0]}
	_, err = port.Write(data)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("Writing block to: <0x%s>\n", fields[1])

	for scanner.Scan() {
		line := scanner.Text()

		if !strings.Contains(line, "//") && line != "" {
			if line == "Stop" {
				stopped = true
				break
			}

			if line == "End" {
				break
			}

			bytes, err2 := hex.DecodeString(line)
			if err2 != nil {
				log.Fatal(err2)
			}

			data[1] = DATA

			for _, byto := range bytes {
				// Send byte to Mega.
				data[0] = byto
				// fmt.Println("Sending: ", data)
				_, err = port.Write(data)
				if err != nil {
					log.Fatal(err)
				}
			}
		}
	}

	// Signal end of block
	data[1] = EOD
	_, err = port.Write(data)
	if err != nil {
		log.Fatal(err)
	}

	return stopped
}
