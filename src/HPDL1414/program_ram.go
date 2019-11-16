package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"os/signal"
	"strconv"
	"strings"
	"syscall"
	"time"

	"github.com/wdevore/hardware/ftdi"
	"github.com/wdevore/hardware/gpio"
	"github.com/wdevore/hardware/spi"
)

/*
	This program drives an HP-1414 4 character display that dates back to
	1980s through the 1990s. It has all the logic to drive the digits
	including a font table.

	I was lazy and instanciated my SPI object which automagically sets up
	the mpsse mode for me.
	I don't actually use the SPI feature so all the config parameters are
	useless.
	I'm just bit-banging the pins which is way fast enough.
*/
func drive_display() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Println("Creating SPI device.")
	// Note: the default mode for this SPI device is MPSSE
	spid := spi.NewSPI(0x0403, 0x06014, false)

	// Create a SPI interface from the FT232H using default chip select.
	// Use a clock speed of 1MHz, SPI mode 0, and most significant bit first.

	fmt.Println("Configuring SPI device.")
	err := spid.Configure(ftdi.D3, 100000, spi.Mode0, spi.MSBFirst)
	if err != nil {
		log.Fatal("### Make sure you have the device connected to USB. ###")
	}

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

	// We need access to the ftdi device to manipulate the GPIO
	// pins while using MPSSE mode.
	f := spid.GetFTDI()

	// ----------------------------------------------------------------
	// Configure IO pins.
	// ----------------------------------------------------------------
	f.ConfigPinNoWrite(ftdi.C0, gpio.Output) // D0 = Pin 8 on Display
	f.ConfigPinNoWrite(ftdi.C1, gpio.Output) // D1 = Pin 9
	f.ConfigPinNoWrite(ftdi.C2, gpio.Output) // D2 = Pin 10
	f.ConfigPinNoWrite(ftdi.C3, gpio.Output) // D3 = Pin 11
	f.ConfigPinNoWrite(ftdi.C4, gpio.Output) // D4 = Pin 2
	f.ConfigPinNoWrite(ftdi.C5, gpio.Output) // D5 = Pin 1
	f.ConfigPinNoWrite(ftdi.C6, gpio.Output) // D6 = Pin 12
	// f.ConfigPinNoWrite(ftdi.C7, gpio.Output) // Used

	f.ConfigPinNoWrite(ftdi.D5, gpio.Output) // /WR = Pin 3 on Display
	f.ConfigPinNoWrite(ftdi.D6, gpio.Output) // A1  = Pin 4
	f.ConfigPinNoWrite(ftdi.D7, gpio.Output) // A0  = Pin 5

	// Default WR as in-active
	f.OutputHigh(ftdi.D5) // /WR

	quit := false

	for !quit {
		fmt.Println("-------------------------------")
		fmt.Println("### HPDL1414 test program ###")
		fmt.Println("Enter the following format:")
		fmt.Println("position string")
		fmt.Println("Examples:")
		fmt.Println(">3 h")
		fmt.Println(">0 tron")
		fmt.Println("  OR")
		fmt.Println("'c' to count up")
		fmt.Println("'q' to quit/exit")
		fmt.Println("-------------------------------")
		fmt.Print(">")

		cmd, _ := reader.ReadString('\n')

		if cmd == "q\n" {
			quit = true
			continue
		}

		if cmd == "c\n" {
			count(999, f)
			continue
		}

		// Parse line
		cmd = cmd[:len(cmd)-1]
		d := strings.Split(cmd, " ")
		pos, _ := strconv.Atoi(d[0])

		if len(d[1]) > 1 {
			showMsg(d[1], f)
		} else {
			show(pos, d[1], f)
		}
	}

	fmt.Println("Goodbye.")
}

func count(count int, f *ftdi.FTDI232H) {
	for i := 0; i <= count; i++ {
		msg := fmt.Sprintf("%04d", i)
		// fmt.Println("Count: ", msg)
		showMsg(msg, f)
		time.Sleep(time.Millisecond * 50)
	}
}

func showMsg(msg string, f *ftdi.FTDI232H) {
	pos := 3
	for _, char := range msg {
		show(pos, string(char), f)
		pos--
		if pos < 0 {
			break
		}
	}

	if pos >= 0 {
		for i := pos; i > -1; i-- {
			show(i, " ", f)
		}
	}
}

func show(pos int, msg string, f *ftdi.FTDI232H) {
	setData(msg, f)

	// Set address 0->4
	switch pos {
	case 0:
		f.SetPin(ftdi.D7, gpio.Low)
		f.SetPin(ftdi.D6, gpio.Low)
		break
	case 1:
		f.SetPin(ftdi.D7, gpio.Low)
		f.SetPin(ftdi.D6, gpio.High)
		break
	case 2:
		f.SetPin(ftdi.D7, gpio.High)
		f.SetPin(ftdi.D6, gpio.Low)
		break
	case 3:
		f.SetPin(ftdi.D7, gpio.High)
		f.SetPin(ftdi.D6, gpio.High)
		break
	}

	// Present data and address prior to memory cycle.
	f.WriteGPIO()

	// Perform write cycle. Data is latched on the rising edge of WR
	f.OutputLow(ftdi.D5)
	f.OutputHigh(ftdi.D5)
}

func setData(char string, f *ftdi.FTDI232H) {
	switch char {
	case " ":
		f.SetPortCPins(0b00100000)
		break
	case "0":
		f.SetPortCPins(0b00110000)
		break
	case "@":
		f.SetPortCPins(0b01000000)
		break
	case "p":
		f.SetPortCPins(0b01010000)
		break

	case "!":
		f.SetPortCPins(0b00100001)
		break
	case "1":
		f.SetPortCPins(0b00110001)
		break
	case "a":
		f.SetPortCPins(0b01000001)
		break
	case "q":
		f.SetPortCPins(0b01010001)
		break

	case "\"":
		f.SetPortCPins(0b00100010)
		break
	case "2":
		f.SetPortCPins(0b00110010)
		break
	case "b":
		f.SetPortCPins(0b01000010)
		break
	case "r":
		f.SetPortCPins(0b01010010)
		break

	case "#":
		f.SetPortCPins(0b00100011)
		break
	case "3":
		f.SetPortCPins(0b00110011)
		break
	case "c":
		f.SetPortCPins(0b01000011)
		break
	case "s":
		f.SetPortCPins(0b01010011)
		break

	case "$":
		f.SetPortCPins(0b00100100)
		break
	case "4":
		f.SetPortCPins(0b00110100)
		break
	case "d":
		f.SetPortCPins(0b01000100)
		break
	case "t":
		f.SetPortCPins(0b01010100)
		break

	case "%":
		f.SetPortCPins(0b00100101)
		break
	case "5":
		f.SetPortCPins(0b00110101)
		break
	case "e":
		f.SetPortCPins(0b01000101)
		break
	case "u":
		f.SetPortCPins(0b01010101)
		break

	case "&":
		f.SetPortCPins(0b00100110)
		break
	case "6":
		f.SetPortCPins(0b00110110)
		break
	case "f":
		f.SetPortCPins(0b01000110)
		break
	case "v":
		f.SetPortCPins(0b01010110)
		break

	case "'":
		f.SetPortCPins(0b00100111)
		break
	case "7":
		f.SetPortCPins(0b00110111)
		break
	case "g":
		f.SetPortCPins(0b01000111)
		break
	case "w":
		f.SetPortCPins(0b01010111)
		break

	case "(":
		f.SetPortCPins(0b00101000)
		break
	case "8":
		f.SetPortCPins(0b00111000)
		break
	case "h":
		f.SetPortCPins(0b01001000)
		break
	case "x":
		f.SetPortCPins(0b01011000)
		break

	case ")":
		f.SetPortCPins(0b00101001)
		break
	case "9":
		f.SetPortCPins(0b00111001)
		break
	case "i":
		f.SetPortCPins(0b01001001)
		break
	case "y":
		f.SetPortCPins(0b01011001)
		break

	case "*":
		f.SetPortCPins(0b00101010)
		break
	case ":":
		f.SetPortCPins(0b00111010)
		break
	case "j":
		f.SetPortCPins(0b01001010)
		break
	case "z":
		f.SetPortCPins(0b01011010)
		break

	case "+":
		f.SetPortCPins(0b00101011)
		break
	case ";":
		f.SetPortCPins(0b00111011)
		break
	case "k":
		f.SetPortCPins(0b01001011)
		break
	case "[":
		f.SetPortCPins(0b01011011)
		break

	case ",":
		f.SetPortCPins(0b00101100)
		break
	case "<":
		f.SetPortCPins(0b00111100)
		break
	case "l":
		f.SetPortCPins(0b01001100)
		break
	case "\\":
		f.SetPortCPins(0b01011100)
		break

	case "-":
		f.SetPortCPins(0b00101101)
		break
	case "=":
		f.SetPortCPins(0b00111101)
		break
	case "m":
		f.SetPortCPins(0b01001101)
		break
	case "]":
		f.SetPortCPins(0b01011101)
		break

	case ".":
		f.SetPortCPins(0b00101110)
		break
	case ">":
		f.SetPortCPins(0b00111110)
		break
	case "n":
		f.SetPortCPins(0b01001110)
		break
	case "^":
		f.SetPortCPins(0b01011110)
		break

	case "/":
		f.SetPortCPins(0b00101111)
		break
	case "?":
		f.SetPortCPins(0b00111111)
		break
	case "o":
		f.SetPortCPins(0b01001111)
		break
	case "_":
		f.SetPortCPins(0b01011111)
		break
	}
}
