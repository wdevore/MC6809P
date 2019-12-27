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
	index int64
	data  []byte // length of page-size
}

func NewPage(index int64, pageSize int64) *RomPage {
	o := new(RomPage)
	o.data = make([]byte, pageSize)
	o.index = index
	return o
}

func (rp *RomPage) storeByAddress(address int64, pageSize int64, data byte) {
	index := address % pageSize
	rp.storeByIndex(index, data)
}

func (rp *RomPage) storeByIndex(index int64, data byte) {
	rp.data[index] = data
}

func (rp *RomPage) address(pageSize int64) int64 {
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
//                           Page     64K       32K
//      0      ->   63     = 0
//      64     ->   127    = 1
//      128    ->   191    = 2
// 2000 8192   ->   8256   = 128
// 7FF0 32752  ->   32816
// ...
// A000 40960  ->   41024  = 640      40960     8192 (0x2000)
// ...
// FFFF        ->   65536    1024

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

	pageSize := int64(config["PageSize"].(float64))
	pages := make(map[int]*RomPage)

	scanner := bufio.NewScanner(dataFile)

	// Read rom file data
	fmt.Println("Reading data...")

	for scanner.Scan() {
		line := scanner.Text()

		index := strings.Index(line, "//")
		if index == 0 {
			continue
		} else if line == "" {
			continue
		} else if line == "Stop" {
			break
		} else if strings.Contains(line, "Block") {
			stopped := processBlock(port, scanner, pages, pageSize)
			if stopped {
				break
			}
		}
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	// fmt.Println("Dumps")

	// Finally write pages to Mega controller.
	for _, v := range pages {
		fmt.Printf("Writing page: (%d) %d <%04x>\n", v.index, v.index*pageSize, v.index*pageSize)
		v.dump()

		success := writePage(port, v, pageSize)
		if !success {
			fmt.Println("FAILED writing")
			break
		}

		fmt.Println("SUCCESS writing")
	}

	// for page := 0; page < 65536/2; page += 64 {
	// 	fmt.Printf("(%05d) %04X %04X %04X %04X\n", page, page, page+16, page+32, page+48)
	// }

	// page := 0x2000
	// fmt.Printf("(%05d) %04X %04X %04X %04X\n", page, page, page+16, page+32, page+48)

	// for page := 0; page < 65536; page += 64 {
	// 	fmt.Printf("(%d) 64K: %04X 32K: ")
	// }
}

func processBlock(port io.ReadWriteCloser, scanner *bufio.Scanner, pages map[int]*RomPage, pageSize int64) (stopped bool) {
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

		if strings.Contains(line, "//") {
			// Strip trailing comment.
			line = line[0:strings.LastIndex(line, "//")]
			line = strings.TrimRight(line, " ")
		}

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
			page, _ := getPage(port, blockAddress, pageSize, pages)
			page.storeByAddress(blockAddress, pageSize, byto)

			blockAddress++
		}
	}

	return (stopped)
}

func getPage(port io.ReadWriteCloser, address int64, pageSize int64, pages map[int]*RomPage) (page *RomPage, index int64) {
	// Calc the page index
	index = int64(address / pageSize)
	page = pages[int(index)]

	if page == nil {
		page = NewPage(index, pageSize)

		// Read ROM Chip to get current page contents.
		readPage(port, page, pageSize)

		// page.dump()

		pages[int(index)] = page
	}

	return page, index
}

func readPage(port io.ReadWriteCloser, page *RomPage, pageSize int64) {
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
		fmt.Printf("Address: %d <%0x>\n", address, address)
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
		fmt.Println("Page pre-read")
		page.dump()
	}
}

func writePage(port io.ReadWriteCloser, page *RomPage, pageSize int64) bool {
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
		da := make([]byte, 2)

		address := page.address(pageSize)
		binary.LittleEndian.PutUint16(da, uint16(address))
		port.Write(da)

		// Send page size next
		binary.LittleEndian.PutUint16(da, uint16(pageSize))
		port.Write(da)

		// Now send data.
		da = []byte{0}
		for i := int64(0); i < pageSize; i++ {
			da[0] = page.data[i]
			// fmt.Printf("(%02d) %0x,", i, da[0])
			port.Write(da)
		}

		// Finally wait for success response.
		resp := []byte{0}
		port.Read(resp)
		return resp[0] == 1
	}

	return false
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
