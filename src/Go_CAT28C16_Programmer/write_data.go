package main

import (
	"bufio"
	"encoding/binary"
	"encoding/hex"
	"fmt"
	"io"
	"log"
	"os"
	"strconv"
	"strings"
)

// The EEPROMs uses "Page"s for writing data. Hence, in order to write a single byte
// you must write the Page that contains that byte.
// PageSize is typically 64 bytes in size but varies by device.
// Pages would be:
// 0   -> 63   = 0
// 64  -> 127  = 1
// 128 -> 191  = 2
// ...

// Create an a List of pages that have been loaded from the
// data file.
// To store a byte in the pages we determine which page it
// belongs to and store it there.

const DATA = 0
const EOD = 1
const SUCCESS = 1

func writeData(config map[string]interface{}, port io.ReadWriteCloser) {
	romFile := config["InputROM"].(string)

	dataFile, err := os.Open(romFile)
	if err != nil {
		log.Fatal(err)
	}

	defer dataFile.Close()

	scanner := bufio.NewScanner(dataFile)

	// Read rom file data
	fmt.Println("Reading data file...")

	for scanner.Scan() {
		line := scanner.Text()

		if !strings.Contains(line, "//") && line != "" {
			if line == "Stop" {
				break
			}

			if strings.Contains(line, "Block") {
				data := []byte("write")
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
					stopped := processBlock(port, scanner)
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

func processBlock(port io.ReadWriteCloser, scanner *bufio.Scanner) (stopped bool) {
	stopped = false

	block := scanner.Text()

	// Parse Block to get starting address for this block
	fields := strings.Split(block, " ")

	blockAddress, err := strconv.ParseInt(fields[1], 16, 16)
	if err != nil {
		log.Fatal(err)
	}

	addr := []byte{0, 0}
	binary.LittleEndian.PutUint16(addr, uint16(blockAddress))
	port.Write(addr)

	// Store bytes into buffer beginning at Address
	for scanner.Scan() {
		line := scanner.Text()

		if !strings.Contains(line, "//") && line != "" {
			if line == "Stop" {
				stopped = true
				break
			}

			if line == "End" {
				// Signal Mega that there is no more data for this block.
				data := []byte{0, EOD}
				// fmt.Println("End: ", data)
				port.Write(data)
				break
			}

			bytes, err2 := hex.DecodeString(line)
			if err2 != nil {
				log.Fatal(err2)
			}
			// fmt.Println(bytes)

			for _, byto := range bytes {
				// fmt.Println(byto)
				// data[0] = byto
				data := []byte{byto, DATA}
				// data := []byte{0, DATA}
				port.Write(data)

				success := []byte{0}
				port.Read(success)
				// fmt.Println("Success: ", success)

				if success[0] != SUCCESS {
					stopped = true
					fmt.Println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
					fmt.Print("Failed to write byte:")
					fmt.Println(fmt.Sprintf("%c", byto))
					fmt.Println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
					break
				}

				blockAddress++
			}

			if stopped {
				break
			}
		}
	}

	return (stopped)
}
