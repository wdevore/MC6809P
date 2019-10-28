package main

import (
	"log"
	"time"

	"github.com/wdevore/hardware/spi"
)

//   H       A H       A
// 0b0000_0000_0000_0000
func testWord(high byte, low byte, spi *spi.FtdiSPI) {
	hard74LS595WriteWord(high, low, spi)
}

func testLowerByte(value byte, spi *spi.FtdiSPI) {
	hard74LS595Write(value, spi)
}

func testLowerBlink(spi *spi.FtdiSPI) {
	for !quit {
		//                 HGFEDCBA
		hard74LS595Write(0b11111111, spi)
		time.Sleep(time.Millisecond * 50)
		hard74LS595Write(0b00000000, spi)
		time.Sleep(time.Millisecond * 50)

		hard74LS595Write(0b11111111, spi)
		time.Sleep(time.Millisecond * 200)
		hard74LS595Write(0b00000000, spi)
		time.Sleep(time.Millisecond * 200)
	}
}

func hard74LS595Write(value byte, spi *spi.FtdiSPI) {
	data := []byte{value}

	// Perpare edge
	spi.AssertChipSelect()

	err := spi.Write(data)
	if err != nil {
		log.Printf("Write failed: %v\n", err)
		// break
	}

	time.Sleep(time.Microsecond)

	// Data latched on rising edge.
	spi.DeAssertChipSelect()
}

func hard74LS595WriteWord(high byte, low byte, spi *spi.FtdiSPI) {
	// High byte first.
	data := []byte{high, low}

	// Perpare edge
	spi.AssertChipSelect()

	err := spi.Write(data)
	if err != nil {
		log.Printf("Write failed: %v\n", err)
		// break
	}

	time.Sleep(time.Microsecond)

	// Data latched on rising edge.
	spi.DeAssertChipSelect()
}
