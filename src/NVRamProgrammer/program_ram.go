package main

import (
	"bufio"
	"fmt"
	"log"
	"os"

	"github.com/wdevore/hardware/spi"
)

// D0 = SCK/Clk
// D1 = MOSI
// D2 = MISO <-- Unused
// D3 = /CS

func programmer(config map[string]interface{}) {
	reader := bufio.NewReader(os.Stdin)

	quit := false

	for !quit {
		fmt.Println("-------------------------------")
		fmt.Println("### FM1808 NVRam programmer ###")
		fmt.Println("Enter one of the following:")
		fmt.Println("'q' to quit/exit")
		fmt.Println("'w' to write data to Ram")
		fmt.Println("'r' to read data from ram to file")
		fmt.Println("'v' to verify data from file against ram")
		fmt.Println("-------------------------------")
		fmt.Print(">")

		cmd, _ := reader.ReadString('\n')

		if cmd == "q\n" {
			quit = true
			continue
		}

		if cmd == "w\n" {
			writeData(config)
			continue
		}

		if cmd == "v\n" {
			verifyData(config)
			continue
		}

		fmt.Println("____ UNKNOWN COMMAND _____")
	}

	fmt.Println("Goodbye.")
}

func setAddress(address uint16, spid *spi.FtdiSPI) {
	//                         High                   Low
	spiOutAddress := []byte{byte(address >> 8), byte(address & 0x00FF)}
	// fmt.Println("Address: ", address, " : ", spiOutAddress)

	err := spid.Write(spiOutAddress)
	if err != nil {
		log.Fatal(err)
	}

	// The 595 is positive-edge triggered thus we need CS
	// to toggle from Low->High
	spid.AssertChipSelect()
	// Latch data by raising CS high.
	spid.DeAssertChipSelect()
	spid.AssertChipSelect()
}
