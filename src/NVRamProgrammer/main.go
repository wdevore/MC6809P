package main

/*
Reference:
https://learn.adafruit.com/adafruit-ft232h-breakout/more-info

Because all the files are in the same directory you need to run "main.go" as
follows:
> go run .
or
> go run *

*/

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
)

var quit = false

func main() {
	// Read json file for runtime parameters
	// Open our jsonFile
	jsonFile, err := os.Open("config.json")
	// if we os.Open returns an error then handle it
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("Successfully Opened config file.")

	// defer the closing of our jsonFile so that we can parse it later on
	defer jsonFile.Close()

	byteValue, _ := ioutil.ReadAll(jsonFile)

	var config map[string]interface{}
	json.Unmarshal([]byte(byteValue), &config)

	programmer(config)
}
