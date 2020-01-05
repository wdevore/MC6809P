package main

import (
	"encoding/binary"
	"fmt"
	"io"
	"log"
)

func readPageByIndex(config map[string]interface{}, port io.ReadWriteCloser, index int64) {
	pageSize := int64(config["PageSize"].(float64))

	page := NewPage(index, pageSize)
	readPageFromRom(port, page, pageSize)

	fmt.Println("ROM page contents:")
	page.dump()
}

func readPageByAddress(config map[string]interface{}, port io.ReadWriteCloser, addr int64) {
	pageSize := int64(config["PageSize"].(float64))

	pIndex := addr / pageSize
	page := NewPage(pIndex, pageSize)
	readPageFromRom(port, page, pageSize)

	fmt.Println("ROM page contents:")
	page.dump()
}

func readPageFromRom(port io.ReadWriteCloser, page *RomPage, pageSize int64) {
	// Begin read protocol with Mega
	data := []byte("read_page")
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
	fmt.Println("Reading page: ", page.index)

	if ack_rep == "ack" {
		da := make([]byte, 2)

		// Send address first. This address should be on page boundaries
		address := page.address(pageSize)
		fmt.Printf("At address: %d <%0x>\n", address, address)
		binary.LittleEndian.PutUint16(da, uint16(address))
		port.Write(da)

		// Send page size next
		da[0] = 0
		da[1] = 0
		binary.LittleEndian.PutUint16(da, uint16(pageSize))
		port.Write(da)

		rd := []byte{0}

		for i := int64(0); i < pageSize; i++ {
			// Now fetch byte
			port.Read(rd)
			page.storeByIndex(i, rd[0])
		}
	}
}
