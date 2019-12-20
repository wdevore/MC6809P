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

type RomPage struct {
	index int
	data  []byte // length of page-size
}

func NewPage(index int, pageSize int) *RomPage {
	o := new(RomPage)
	o.data = make([]byte, pageSize)
	o.index = index
	return o
}

func (rp *RomPage) storeByAddress(address int, pageSize int, data byte) {
	pgAddr := address % pageSize
	rp.storeByIndex(pgAddr, data)
}

func (rp *RomPage) storeByIndex(index int, data byte) {
	rp.data[index] = data
}

func (rp *RomPage) address(pageSize int) int {
	return rp.index * pageSize
}

func (rp *RomPage) dump() {
	maxCol := 16
	col := 0

	for i := 0; i < len(rp.data); i++ {
		sv := fmt.Sprintf("%02X ", rp.data[i])
		if col == maxCol-1 {
			fmt.Println(sv)
			col = 0
		} else {
			fmt.Print(sv)
			col++
		}
	}
	fmt.Println("")
}

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

func writeData(config map[string]interface{}, port io.ReadWriteCloser) {
	romFile := config["InputROM"].(string)

	dataFile, err := os.Open(romFile)
	if err != nil {
		log.Fatal(err)
	}

	defer dataFile.Close()

	pageSize := int(config["PageSize"].(float64))
	pages := make(map[int]*RomPage)

	scanner := bufio.NewScanner(dataFile)

	// Read rom file data
	fmt.Println("Reading data...")

	for scanner.Scan() {
		line := scanner.Text()

		if !strings.Contains(line, "//") && line != "" {
			if line == "Stop" {
				break
			}

			if strings.Contains(line, "Block") {
				stopped := processBlock(port, scanner, pages, pageSize)
				if stopped {
					break
				}
			}
		}
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	// fmt.Println("Dumps")

	// Finally write pages to Mega controller.
	for k, v := range pages {
		fmt.Println("Writing Page: ", k)
		// v.dump()
		writePage(port, v, pageSize)
	}

}

func processBlock(port io.ReadWriteCloser, scanner *bufio.Scanner, pages map[int]*RomPage, pageSize int) (stopped bool) {
	stopped = false

	block := scanner.Text()

	// Parse Block to get starting address for this block
	fields := strings.Split(block, " ")

	blockAddress, err := strconv.ParseInt(fields[1], 16, 16)
	if err != nil {
		log.Fatal(err)
	}

	// Store bytes into buffer beginning at Address
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
				// Calc the page index
				page, _ := getPage(port, int(blockAddress), pageSize, pages)

				page.storeByAddress(int(blockAddress), pageSize, byto)

				blockAddress++
			}
		}
	}

	return (stopped)
}

func getPage(port io.ReadWriteCloser, address int, pageSize int, pages map[int]*RomPage) (page *RomPage, index int) {
	// Calc the page index
	index = int(address / pageSize)
	page = pages[index]

	if page == nil {
		fmt.Println("Dirty page at: ", index)
		page = NewPage(index, pageSize)

		// Read ROM Chip to get current page contents.
		readPage(port, page, pageSize)

		page.dump()

		pages[index] = page
	}

	return page, index
}

func readPage(port io.ReadWriteCloser, page *RomPage, pageSize int) {
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

	if ack_rep == "ack" {
		da := make([]byte, 2)

		// Send address first. This address should be on page boundaries
		address := page.address(pageSize)
		binary.LittleEndian.PutUint16(da, uint16(address))
		port.Write(da)

		// Send page size next
		binary.LittleEndian.PutUint16(da, uint16(pageSize))
		port.Write(da)

		// Now fetch page
		rd := []byte{0}

		for i := 0; i < pageSize; i++ {
			port.Read(rd)

			page.storeByIndex(i, rd[0])
		}
	}
}

func writePage(port io.ReadWriteCloser, page *RomPage, pageSize int) {
	// Begin write protocol with Mega
	data := []byte("write_page")
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
		da := make([]byte, 2)

		address := page.address(pageSize)
		binary.LittleEndian.PutUint16(da, uint16(address))
		port.Write(da)

		// Send page size next
		binary.LittleEndian.PutUint16(da, uint16(pageSize))
		port.Write(da)

		wd := []byte{0}

		// Now send data
		for i := 0; i < pageSize; i++ {
			wd[0] = page.data[i]
			port.Write(wd)
		}
	}
}

// func contains(l *list.List, item int64) bool {
// 	for e := l.Front(); e != nil; e = e.Next() {
// 		if item == e.Value {
// 			return true
// 		}
// 	}

// 	return false
// }

// func find(l *list.List, index int64) *RomPage {
// 	for e := l.Front(); e != nil; e = e.Next() {
// 		p := e.(*RomPage)
// 		if index == p.index {
// 			return e
// 		}
// 	}

// 	return nil
// }
