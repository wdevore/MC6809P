package main

import (
	"fmt"
)

type RomPage struct {
	index int64
	data  []byte // length of page-size
	dirty bool
}

func NewPage(index int64, pageSize int64) *RomPage {
	o := new(RomPage)
	o.data = make([]byte, pageSize)
	o.index = index
	o.dirty = false
	return o
}

func (rp *RomPage) storeByAddress(address int64, pageSize int64, data byte) {
	index := address % pageSize
	rp.storeByIndex(index, data)
}

func (rp *RomPage) storeByIndex(index int64, data byte) {
	rp.data[index] = data
}

func (rp *RomPage) updateByAddress(address int64, pageSize int64, data byte) {
	index := address % pageSize
	rp.updateByIndex(index, data)
}

func (rp *RomPage) updateByIndex(index int64, data byte) {
	if rp.data[index] != data {
		fmt.Printf("Chg: %02X to %02X\n", rp.data[index], data)
		rp.data[index] = data
		rp.dirty = true
	}
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
