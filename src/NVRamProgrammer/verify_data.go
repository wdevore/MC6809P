package main

import (
	"bufio"
	"encoding/hex"
	"fmt"
	"log"
	"os"
	"os/signal"
	"strings"
	"syscall"

	"github.com/wdevore/hardware/ftdi"
	"github.com/wdevore/hardware/gpio"
	"github.com/wdevore/hardware/spi"
)

func verifyData(config map[string]interface{}) {
	romFile := config["ROM"].(string)

	dataFile, err := os.Open(romFile)
	// if we os.Open returns an error then handle it
	if err != nil {
		log.Fatal(err)
	}

	defer dataFile.Close()

	scanner := bufio.NewScanner(dataFile)

	// ----------------------------------------------------------------
	// Create SPI device for setting address pins on 74LS595
	// D0 = SCK/Clk
	// D1 = MOSI
	// D2 = MISO <-- Unused. We only write using SPI
	// D3 = /CS
	// ----------------------------------------------------------------
	fmt.Println("Creating SPI device.")
	// Note: the default mode for this SPI device is MPSSE
	spid := spi.NewSPI(0x0403, 0x06014, false)

	// Create a SPI interface from the FT232H using default chip select.
	// Use a clock speed of 1MHz, SPI mode 0, and most significant bit first.

	fmt.Println("Configuring SPI device.")
	err = spid.Configure(ftdi.D3, 100000, spi.Mode0, spi.MSBFirst)
	if err != nil {
		log.Fatal("### Make sure you have the device connected to USB. ###")
	}

	spid.ConstantCSAssert = true // We want control of CS

	fmt.Println("Creating channel to capture ctrl-c.")
	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt, syscall.SIGTERM)
	go func(ft *spi.FtdiSPI) {
		<-c
		println("\nReceived ctrl-C, Shutting down...")
		quit = true
	}(spid)

	if spid == nil {
		log.Fatal("Failed to create FTDI interface")
	}

	defer spid.Close()

	// ----------------------------------------------------------------
	// Configure IO pins.
	// ----------------------------------------------------------------
	// We need access to the ftdi device to manipulate the GPIO
	// pins while using MPSSE mode.
	f := spid.GetFTDI()

	// Pins C0-C7 are "bi-directional". However, for verifying they are
	// used as input only.
	f.ConfigPinNoWrite(ftdi.C0, gpio.Input)
	f.ConfigPinNoWrite(ftdi.C1, gpio.Input)
	f.ConfigPinNoWrite(ftdi.C2, gpio.Input)
	f.ConfigPinNoWrite(ftdi.C3, gpio.Input)
	f.ConfigPinNoWrite(ftdi.C4, gpio.Input)
	f.ConfigPinNoWrite(ftdi.C5, gpio.Input)
	f.ConfigPinNoWrite(ftdi.C6, gpio.Input)
	f.ConfigPinNoWrite(ftdi.C7, gpio.Input)

	// Default all to LOW
	f.SetPortCPins(0x00)

	// FM1808 NVRam control pins
	f.ConfigPinNoWrite(ftdi.D4, gpio.Output) // ~OE = Read
	f.ConfigPinNoWrite(ftdi.D5, gpio.Output) // ~WE = Write
	f.ConfigPinNoWrite(ftdi.D6, gpio.Output) // ~CE = Select

	// Default states to inactive.
	f.SetPortDPins(0xFF)

	f.WriteGPIO()

	// Assert SPI CS (aka pin D4) for the initial condition.
	// 74LS595 is rising-edge triggered which means we set the
	// CS low at the start.
	spid.AssertChipSelect()

	// ----------------------------------------------------------------
	// Begin scanning data
	// ----------------------------------------------------------------
	fmt.Println("Block verify starting...")
	for scanner.Scan() {
		line := scanner.Text()

		if !strings.Contains(line, "//") && line != "" {
			if line == "Stop" {
				break
			}

			if strings.Contains(line, "Block") {
				stopped := processReadBlock(scanner, spid, f)
				if stopped {
					break
				}
			}
		}
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	fmt.Println("___ Writing complete ____")
}

func readData(f *ftdi.FTDI232H) (data byte) {
	d := f.ReadInputs()
	fmt.Println("d: ", d)
	return byte((d & 0xFF00) >> 8)
}

func processReadBlock(scanner *bufio.Scanner, spid *spi.FtdiSPI, f *ftdi.FTDI232H) (stopped bool) {
	stopped = false

	block := scanner.Text()

	// Parse Block to get starting address for this block
	// fmt.Println("line: ", block)
	fields := strings.Split(block, " ")

	hexes, err := hex.DecodeString(fields[1])
	if err != nil {
		log.Fatal(err)
	}

	// We always send 2bytes to the 74LS595s.
	//                High             Low
	address := uint16(hexes[0])<<8 | uint16(hexes[1])

	fmt.Printf("Reading block at: %d <0x%s>\n", address, fields[1])

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

			for _, byto := range bytes {
				// De-Assert Ram Select = ~CE
				f.OutputHigh(ftdi.D6)
				// De-Assert Ram Read = ~OE
				f.OutputHigh(ftdi.D4)

				setAddress(address, spid)

				// Assert Select = ~CE, latches address
				f.OutputLow(ftdi.D6)

				// And finally read data by asserting the Read
				// (aka pin 22 on FM1808 chip). = ~OE
				f.OutputLow(ftdi.D5)

				data := readData(f)

				if data != byto {
					fmt.Printf("Verify failed at: %d, Expected: %d, got: %d\n", address, byto, data)
				}

				address++
			}

			// De-Assert Select
			f.OutputHigh(ftdi.D6)
			// De-Assert Write
			f.OutputHigh(ftdi.D5)
		}
	}

	return stopped
}