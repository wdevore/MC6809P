EESchema Schematic File Version 4
LIBS:MC6809P-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS595 U?
U 1 1 5DAF5DF6
P 5400 3600
F 0 "U?" H 5200 4150 50  0000 C CNN
F 1 "74LS595" H 5600 4150 50  0000 C CNN
F 2 "" H 5400 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls595" H 5400 3600 50  0001 C CNN
	1    5400 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS595 U?
U 1 1 5DAF6325
P 5400 6100
F 0 "U?" H 5200 6650 50  0000 C CNN
F 1 "74LS595" H 5600 6650 50  0000 C CNN
F 2 "" H 5400 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls595" H 5400 6100 50  0001 C CNN
	1    5400 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3800 4850 3800
Wire Wire Line
	4850 3800 4850 4450
Wire Wire Line
	4850 4450 5400 4450
Wire Wire Line
	5400 4450 5400 4300
$Comp
L power:GND #PWR?
U 1 1 5DAF9666
P 5400 4450
F 0 "#PWR?" H 5400 4200 50  0001 C CNN
F 1 "GND" H 5405 4277 50  0000 C CNN
F 2 "" H 5400 4450 50  0001 C CNN
F 3 "" H 5400 4450 50  0001 C CNN
	1    5400 4450
	1    0    0    -1  
$EndComp
Connection ~ 5400 4450
Text GLabel 4150 3700 0    50   Input ~ 0
CS
$Comp
L power:VCC #PWR?
U 1 1 5DAF9B6F
P 5400 2650
F 0 "#PWR?" H 5400 2500 50  0001 C CNN
F 1 "VCC" H 5417 2823 50  0000 C CNN
F 2 "" H 5400 2650 50  0001 C CNN
F 3 "" H 5400 2650 50  0001 C CNN
	1    5400 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3000 5400 2800
Wire Wire Line
	5000 3500 4850 3500
Wire Wire Line
	4850 3500 4850 2800
Wire Wire Line
	4850 2800 5400 2800
Connection ~ 5400 2800
Wire Wire Line
	5400 2800 5400 2650
Wire Wire Line
	5000 3200 4150 3200
Text GLabel 4150 3200 0    50   Input ~ 0
MOSI
Text GLabel 4150 3400 0    50   Input ~ 0
SCK
Wire Wire Line
	5800 4100 5950 4100
Wire Wire Line
	5950 4100 5950 4800
Wire Wire Line
	5950 4800 4750 4800
Wire Wire Line
	4750 5700 5000 5700
Wire Wire Line
	5000 5900 4650 5900
Wire Wire Line
	5000 6200 4500 6200
$Comp
L power:GND #PWR?
U 1 1 5DAFB2B9
P 5400 6900
F 0 "#PWR?" H 5400 6650 50  0001 C CNN
F 1 "GND" H 5405 6727 50  0000 C CNN
F 2 "" H 5400 6900 50  0001 C CNN
F 3 "" H 5400 6900 50  0001 C CNN
	1    5400 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6300 4850 6300
Wire Wire Line
	4850 6300 4850 6900
Wire Wire Line
	4850 6900 5400 6900
Wire Wire Line
	5400 6800 5400 6900
Connection ~ 5400 6900
Wire Wire Line
	4150 3400 4650 3400
Wire Wire Line
	4500 3700 4500 6200
Wire Wire Line
	4150 3700 4500 3700
Connection ~ 4500 3700
Wire Wire Line
	4500 3700 5000 3700
Wire Wire Line
	4650 3400 4650 5900
Connection ~ 4650 3400
Wire Wire Line
	4650 3400 5000 3400
Wire Wire Line
	4750 4800 4750 5700
$Comp
L power:VCC #PWR?
U 1 1 5DAFE902
P 5400 5350
F 0 "#PWR?" H 5400 5200 50  0001 C CNN
F 1 "VCC" H 5417 5523 50  0000 C CNN
F 2 "" H 5400 5350 50  0001 C CNN
F 3 "" H 5400 5350 50  0001 C CNN
	1    5400 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5350 5400 5400
$Comp
L Memory_NVRAM:FM18W08-SG U?
U 1 1 5DB00013
P 8200 4550
F 0 "U?" H 7950 5350 50  0000 C CNN
F 1 "FM18W08-SG" H 8450 5350 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x17.9mm_P1.27mm" H 8200 4550 50  0001 C CNN
F 3 "http://www.cypress.com/file/136521/download" H 8200 4550 50  0001 C CNN
	1    8200 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3850 8950 3850
Wire Wire Line
	8700 3950 8950 3950
Wire Wire Line
	8700 4050 8950 4050
Wire Wire Line
	8700 4150 8950 4150
Wire Wire Line
	8700 4250 8950 4250
Wire Wire Line
	8700 4350 8950 4350
Wire Wire Line
	8700 4450 8950 4450
Wire Wire Line
	8700 4550 8950 4550
Text GLabel 8950 3850 2    50   BiDi ~ 0
C0
Text GLabel 8950 3950 2    50   BiDi ~ 0
C1
Text GLabel 8950 4050 2    50   BiDi ~ 0
C2
Text GLabel 8950 4150 2    50   BiDi ~ 0
C3
Text GLabel 8950 4250 2    50   BiDi ~ 0
C4
Text GLabel 8950 4350 2    50   BiDi ~ 0
C5
Text GLabel 8950 4450 2    50   BiDi ~ 0
C6
Text GLabel 8950 4550 2    50   BiDi ~ 0
C7
Wire Wire Line
	5800 3200 6100 3200
Wire Wire Line
	5800 3300 6100 3300
Wire Wire Line
	5800 3400 6100 3400
Wire Wire Line
	5800 3500 6100 3500
Wire Wire Line
	5800 3600 6100 3600
Wire Wire Line
	5800 3700 6100 3700
Wire Wire Line
	5800 3800 6100 3800
Wire Wire Line
	5800 3900 6100 3900
Wire Wire Line
	5800 5700 6100 5700
Wire Wire Line
	5800 5800 6100 5800
Wire Wire Line
	5800 5900 6100 5900
Wire Wire Line
	5800 6000 6100 6000
Wire Wire Line
	5800 6100 6100 6100
Wire Wire Line
	5800 6200 6100 6200
Wire Wire Line
	5800 6300 6100 6300
Text Label 5850 3200 0    50   ~ 0
A0
Text Label 5850 3300 0    50   ~ 0
A1
Text Label 5850 3400 0    50   ~ 0
A2
Text Label 5850 3500 0    50   ~ 0
A3
Text Label 5850 3600 0    50   ~ 0
A4
Text Label 5850 3700 0    50   ~ 0
A5
Text Label 5850 3800 0    50   ~ 0
A6
Text Label 5850 3900 0    50   ~ 0
A7
Text Label 5850 5700 0    50   ~ 0
A8
Text Label 5850 5800 0    50   ~ 0
A9
Text Label 5850 5900 0    50   ~ 0
A10
Text Label 5850 6000 0    50   ~ 0
A11
Text Label 5850 6100 0    50   ~ 0
A12
Text Label 5850 6200 0    50   ~ 0
A13
Text Label 5850 6300 0    50   ~ 0
A14
Entry Wire Line
	6100 3200 6200 3300
Entry Wire Line
	6100 3300 6200 3400
Entry Wire Line
	6100 3400 6200 3500
Entry Wire Line
	6100 3500 6200 3600
Entry Wire Line
	6100 3600 6200 3700
Entry Wire Line
	6100 3700 6200 3800
Entry Wire Line
	6100 3800 6200 3900
Entry Wire Line
	6100 3900 6200 4000
Entry Wire Line
	6100 6300 6200 6200
Entry Wire Line
	6100 6200 6200 6100
Entry Wire Line
	6100 6100 6200 6000
Entry Wire Line
	6100 6000 6200 5900
Entry Wire Line
	6100 5900 6200 5800
Entry Wire Line
	6100 5800 6200 5700
Entry Wire Line
	6100 5700 6200 5600
NoConn ~ 5800 6400
Entry Wire Line
	7600 3750 7700 3850
Entry Wire Line
	7600 3850 7700 3950
Entry Wire Line
	7600 3950 7700 4050
Entry Wire Line
	7600 4050 7700 4150
Entry Wire Line
	7600 4150 7700 4250
Entry Wire Line
	7600 4250 7700 4350
Entry Wire Line
	7600 4350 7700 4450
Entry Wire Line
	7600 4450 7700 4550
Entry Wire Line
	7600 4550 7700 4650
Entry Wire Line
	7600 4650 7700 4750
Entry Wire Line
	7600 4750 7700 4850
Entry Wire Line
	7600 4850 7700 4950
Entry Wire Line
	7600 4950 7700 5050
Entry Wire Line
	7600 5050 7700 5150
Entry Wire Line
	7600 5150 7700 5250
Wire Bus Line
	6200 3300 7600 3300
Wire Wire Line
	8700 4950 8950 4950
Wire Wire Line
	8700 5050 8950 5050
Wire Wire Line
	8700 5250 8950 5250
Text GLabel 8950 4950 2    50   Input ~ 0
D4
Text GLabel 8950 5050 2    50   Input ~ 0
D5
Text GLabel 8950 5250 2    50   Input ~ 0
D6
Text Notes 9150 5000 0    50   ~ 0
Read
Text Notes 9150 5100 0    50   ~ 0
Write
Wire Wire Line
	5000 6000 4850 6000
Wire Wire Line
	4850 6000 4850 5400
Wire Wire Line
	4850 5400 5400 5400
Connection ~ 5400 5400
Wire Wire Line
	5400 5400 5400 5500
$Comp
L power:GND #PWR?
U 1 1 5DB1ED55
P 8200 5550
F 0 "#PWR?" H 8200 5300 50  0001 C CNN
F 1 "GND" H 8205 5377 50  0000 C CNN
F 2 "" H 8200 5550 50  0001 C CNN
F 3 "" H 8200 5550 50  0001 C CNN
	1    8200 5550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB1F004
P 8200 3350
F 0 "#PWR?" H 8200 3200 50  0001 C CNN
F 1 "VCC" H 8217 3523 50  0000 C CNN
F 2 "" H 8200 3350 50  0001 C CNN
F 3 "" H 8200 3350 50  0001 C CNN
	1    8200 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 3350 8200 3650
Wire Wire Line
	8200 5450 8200 5550
$Comp
L Connector_Generic:Conn_01x15 J?
U 1 1 5DADCB67
P 11300 4700
F 0 "J?" H 11218 5617 50  0000 C CNN
F 1 "USB to GPIO" H 11218 5526 50  0000 C CNN
F 2 "" H 11300 4700 50  0001 C CNN
F 3 "~" H 11300 4700 50  0001 C CNN
	1    11300 4700
	-1   0    0    -1  
$EndComp
Text GLabel 11500 4000 2    50   BiDi ~ 0
C0
Text GLabel 11500 4100 2    50   BiDi ~ 0
C1
Text GLabel 11500 4200 2    50   BiDi ~ 0
C2
Text GLabel 11500 4300 2    50   BiDi ~ 0
C3
Text GLabel 11500 4400 2    50   BiDi ~ 0
C4
Text GLabel 11500 4500 2    50   BiDi ~ 0
C5
Text GLabel 11500 4600 2    50   BiDi ~ 0
C6
Text GLabel 11500 4700 2    50   BiDi ~ 0
C7
Text GLabel 11500 4800 2    50   Input ~ 0
D4
Text GLabel 11500 4900 2    50   Input ~ 0
D5
Text GLabel 11500 5000 2    50   Input ~ 0
D6
Text GLabel 11500 5300 2    50   Input ~ 0
CS
Text GLabel 11500 5100 2    50   Input ~ 0
MOSI
Text GLabel 11500 5200 2    50   Input ~ 0
SCK
Wire Bus Line
	6200 3300 6200 6200
Wire Bus Line
	7600 3300 7600 5150
Text Notes 12150 5150 0    50   ~ 0
Mode 0, MSB First
Text Notes 11750 5150 0    50   ~ 0
D1
Text Notes 11750 5250 0    50   ~ 0
D0
Text Notes 11750 5350 0    50   ~ 0
D3
$EndSCHEMATC
