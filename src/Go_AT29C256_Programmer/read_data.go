package main

import (
	"encoding/binary"
	"fmt"
	"io"
	"log"
	"os"
)

func readData(config map[string]interface{}, port io.ReadWriteCloser) {
	ramFile := config["ReadOutput"].(string)

	fmt.Println("Writing to: ", ramFile)

	dataFile, err := os.Create(ramFile)
	// if we os.Open returns an error then handle it
	if err != nil {
		log.Fatal(err)
	}

	defer dataFile.Close()

	fmt.Println("Read starting...")

	// Begin read protocol with Mega
	data := []byte("read")
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
		fmt.Println("Mega ready for reading")
		// Mega is ready for reading
		startAddress := uint16(config["StartAddress"].(float64))
		size := uint16(config["Size"].(float64))

		processReadBlocks(dataFile, startAddress, size, port)
	}
}

func processReadBlocks(outFile *os.File, startAddress uint16, size uint16, port io.ReadWriteCloser) {
	// Send:
	//  -- a start address to begin reading from
	//  -- and how many bytes to read
	fmt.Println("Starting address: ", startAddress)
	fmt.Println("Size: ", size)

	address := make([]byte, 2)
	binary.LittleEndian.PutUint16(address, startAddress)

	// Send start address: low/high = little endian
	_, err := port.Write(address)
	if err != nil {
		log.Fatal(err)
	}

	length := make([]byte, 2)
	binary.LittleEndian.PutUint16(length, size)

	// Send start address: low/high = little endian
	_, err = port.Write(length)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("Reading block at: <0x%d>\n", startAddress)

	max_col := 16
	col := 0
	dv := []byte{0}
	chrs := []string{"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""}
	carIdx := 0

	activityIdicator := 0

	// Mega will now start sending back bytes read from Chip.
	for i := uint16(0); i < size; i++ {
		_, errR := port.Read(dv)
		if errR != nil {
			log.Fatal(errR)
		}

		// Ascii = 32->126
		// 0xB0 = Degree symbol = not valid ascill
		if col == max_col {
			outFile.WriteString("  |")
			for c := 0; c < max_col; c++ {
				outFile.WriteString(chrs[c])
			}
			_, err = outFile.WriteString("|\n")
			if err != nil {
				log.Fatal(err)
			}
			col = 0
			carIdx = 0
		}

		if (dv[0] > 0x1f) && (dv[0] < 0x7f) {
			chrs[carIdx] = fmt.Sprintf("%c", dv[0])
		} else {
			chrs[carIdx] = "•" //fmt.Sprintf("%c", 0x95) //"¬" //0xAC
		}
		carIdx++

		sv := fmt.Sprintf("%02X ", dv[0])
		_, err = outFile.WriteString(sv)
		if err != nil {
			log.Fatal(err)
		}

		col++

		if activityIdicator%1024 == 0 {
			fmt.Print(".")
		}
		activityIdicator++
	}

	outFile.WriteString("  |")
	for c := 0; c < max_col; c++ {
		outFile.WriteString(chrs[c])
	}
	_, err = outFile.WriteString("|\n")

	fmt.Println("")
}
