EESchema Schematic File Version 4
LIBS:MC6809P-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 6 7
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
P 3000 2250
F 0 "U?" H 2800 2800 50  0000 C CNN
F 1 "74LS595" H 3200 2800 50  0000 C CNN
F 2 "" H 3000 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls595" H 3000 2250 50  0001 C CNN
	1    3000 2250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS595 U?
U 1 1 5DAF6325
P 3000 4750
F 0 "U?" H 2800 5300 50  0000 C CNN
F 1 "74LS595" H 3200 5300 50  0000 C CNN
F 2 "" H 3000 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls595" H 3000 4750 50  0001 C CNN
	1    3000 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2450 2450 2450
Wire Wire Line
	2450 2450 2450 3100
Wire Wire Line
	2450 3100 3000 3100
Wire Wire Line
	3000 3100 3000 2950
$Comp
L power:GND #PWR?
U 1 1 5DAF9666
P 3000 3100
F 0 "#PWR?" H 3000 2850 50  0001 C CNN
F 1 "GND" H 3005 2927 50  0000 C CNN
F 2 "" H 3000 3100 50  0001 C CNN
F 3 "" H 3000 3100 50  0001 C CNN
	1    3000 3100
	1    0    0    -1  
$EndComp
Connection ~ 3000 3100
Text GLabel 1750 2350 0    50   Input ~ 0
CS
$Comp
L power:VCC #PWR?
U 1 1 5DAF9B6F
P 3000 1300
F 0 "#PWR?" H 3000 1150 50  0001 C CNN
F 1 "VCC" H 3017 1473 50  0000 C CNN
F 2 "" H 3000 1300 50  0001 C CNN
F 3 "" H 3000 1300 50  0001 C CNN
	1    3000 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1650 3000 1450
Wire Wire Line
	2600 2150 2450 2150
Wire Wire Line
	2450 2150 2450 1450
Wire Wire Line
	2450 1450 3000 1450
Connection ~ 3000 1450
Wire Wire Line
	3000 1450 3000 1300
Wire Wire Line
	2600 1850 1750 1850
Text GLabel 1750 1850 0    50   Input ~ 0
MOSI
Text GLabel 1750 2050 0    50   Input ~ 0
SCK
Wire Wire Line
	3400 2750 3550 2750
Wire Wire Line
	3550 2750 3550 3450
Wire Wire Line
	3550 3450 2350 3450
Wire Wire Line
	2350 4350 2600 4350
Wire Wire Line
	2600 4550 2250 4550
Wire Wire Line
	2600 4850 2100 4850
$Comp
L power:GND #PWR?
U 1 1 5DAFB2B9
P 3000 5550
F 0 "#PWR?" H 3000 5300 50  0001 C CNN
F 1 "GND" H 3005 5377 50  0000 C CNN
F 2 "" H 3000 5550 50  0001 C CNN
F 3 "" H 3000 5550 50  0001 C CNN
	1    3000 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4950 2450 4950
Wire Wire Line
	2450 4950 2450 5550
Wire Wire Line
	2450 5550 3000 5550
Wire Wire Line
	3000 5450 3000 5550
Connection ~ 3000 5550
Wire Wire Line
	1750 2050 2250 2050
Wire Wire Line
	2100 2350 2100 4850
Wire Wire Line
	1750 2350 2100 2350
Connection ~ 2100 2350
Wire Wire Line
	2100 2350 2600 2350
Wire Wire Line
	2250 2050 2250 4550
Connection ~ 2250 2050
Wire Wire Line
	2250 2050 2600 2050
Wire Wire Line
	2350 3450 2350 4350
$Comp
L power:VCC #PWR?
U 1 1 5DAFE902
P 3000 4000
F 0 "#PWR?" H 3000 3850 50  0001 C CNN
F 1 "VCC" H 3017 4173 50  0000 C CNN
F 2 "" H 3000 4000 50  0001 C CNN
F 3 "" H 3000 4000 50  0001 C CNN
	1    3000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4000 3000 4050
$Comp
L Memory_NVRAM:FM18W08-SG U?
U 1 1 5DB00013
P 5800 3200
F 0 "U?" H 5550 4000 50  0000 C CNN
F 1 "FM18W08-SG" H 6050 4000 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x17.9mm_P1.27mm" H 5800 3200 50  0001 C CNN
F 3 "http://www.cypress.com/file/136521/download" H 5800 3200 50  0001 C CNN
	1    5800 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2500 6550 2500
Wire Wire Line
	6300 2600 6550 2600
Wire Wire Line
	6300 2700 6550 2700
Wire Wire Line
	6300 2800 6550 2800
Wire Wire Line
	6300 2900 6550 2900
Wire Wire Line
	6300 3000 6550 3000
Wire Wire Line
	6300 3100 6550 3100
Wire Wire Line
	6300 3200 6550 3200
Text GLabel 6550 2500 2    50   BiDi ~ 0
C0
Text GLabel 6550 2600 2    50   BiDi ~ 0
C1
Text GLabel 6550 2700 2    50   BiDi ~ 0
C2
Text GLabel 6550 2800 2    50   BiDi ~ 0
C3
Text GLabel 6550 2900 2    50   BiDi ~ 0
C4
Text GLabel 6550 3000 2    50   BiDi ~ 0
C5
Text GLabel 6550 3100 2    50   BiDi ~ 0
C6
Text GLabel 6550 3200 2    50   BiDi ~ 0
C7
Wire Wire Line
	3400 1850 3700 1850
Wire Wire Line
	3400 1950 3700 1950
Wire Wire Line
	3400 2050 3700 2050
Wire Wire Line
	3400 2150 3700 2150
Wire Wire Line
	3400 2250 3700 2250
Wire Wire Line
	3400 2350 3700 2350
Wire Wire Line
	3400 2450 3700 2450
Wire Wire Line
	3400 2550 3700 2550
Wire Wire Line
	3400 4350 3700 4350
Wire Wire Line
	3400 4450 3700 4450
Wire Wire Line
	3400 4550 3700 4550
Wire Wire Line
	3400 4650 3700 4650
Wire Wire Line
	3400 4750 3700 4750
Wire Wire Line
	3400 4850 3700 4850
Wire Wire Line
	3400 4950 3700 4950
Text Label 3450 1850 0    50   ~ 0
A0
Text Label 3450 1950 0    50   ~ 0
A1
Text Label 3450 2050 0    50   ~ 0
A2
Text Label 3450 2150 0    50   ~ 0
A3
Text Label 3450 2250 0    50   ~ 0
A4
Text Label 3450 2350 0    50   ~ 0
A5
Text Label 3450 2450 0    50   ~ 0
A6
Text Label 3450 2550 0    50   ~ 0
A7
Text Label 3450 4350 0    50   ~ 0
A8
Text Label 3450 4450 0    50   ~ 0
A9
Text Label 3450 4550 0    50   ~ 0
A10
Text Label 3450 4650 0    50   ~ 0
A11
Text Label 3450 4750 0    50   ~ 0
A12
Text Label 3450 4850 0    50   ~ 0
A13
Text Label 3450 4950 0    50   ~ 0
A14
Entry Wire Line
	3700 1850 3800 1950
Entry Wire Line
	3700 1950 3800 2050
Entry Wire Line
	3700 2050 3800 2150
Entry Wire Line
	3700 2150 3800 2250
Entry Wire Line
	3700 2250 3800 2350
Entry Wire Line
	3700 2350 3800 2450
Entry Wire Line
	3700 2450 3800 2550
Entry Wire Line
	3700 2550 3800 2650
Entry Wire Line
	3700 4950 3800 4850
Entry Wire Line
	3700 4850 3800 4750
Entry Wire Line
	3700 4750 3800 4650
Entry Wire Line
	3700 4650 3800 4550
Entry Wire Line
	3700 4550 3800 4450
Entry Wire Line
	3700 4450 3800 4350
Entry Wire Line
	3700 4350 3800 4250
NoConn ~ 3400 5050
Entry Wire Line
	5200 2400 5300 2500
Entry Wire Line
	5200 2500 5300 2600
Entry Wire Line
	5200 2600 5300 2700
Entry Wire Line
	5200 2700 5300 2800
Entry Wire Line
	5200 2800 5300 2900
Entry Wire Line
	5200 2900 5300 3000
Entry Wire Line
	5200 3000 5300 3100
Entry Wire Line
	5200 3100 5300 3200
Entry Wire Line
	5200 3200 5300 3300
Entry Wire Line
	5200 3300 5300 3400
Entry Wire Line
	5200 3400 5300 3500
Entry Wire Line
	5200 3500 5300 3600
Entry Wire Line
	5200 3600 5300 3700
Entry Wire Line
	5200 3700 5300 3800
Entry Wire Line
	5200 3800 5300 3900
Wire Bus Line
	3800 1950 5200 1950
Wire Wire Line
	6300 3600 6550 3600
Wire Wire Line
	6300 3700 6550 3700
Wire Wire Line
	6300 3900 6550 3900
Text GLabel 6550 3600 2    50   Input ~ 0
D4
Text GLabel 6550 3700 2    50   Input ~ 0
D5
Text GLabel 6550 3900 2    50   Input ~ 0
D6
Text Notes 6750 3650 0    50   ~ 0
Read
Text Notes 6750 3750 0    50   ~ 0
Write
Wire Wire Line
	2600 4650 2450 4650
Wire Wire Line
	2450 4650 2450 4050
Wire Wire Line
	2450 4050 3000 4050
Connection ~ 3000 4050
Wire Wire Line
	3000 4050 3000 4150
$Comp
L power:GND #PWR?
U 1 1 5DB1ED55
P 3300 7700
F 0 "#PWR?" H 3300 7450 50  0001 C CNN
F 1 "GND" H 3305 7527 50  0000 C CNN
F 2 "" H 3300 7700 50  0001 C CNN
F 3 "" H 3300 7700 50  0001 C CNN
	1    3300 7700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB1F004
P 5800 2000
F 0 "#PWR?" H 5800 1850 50  0001 C CNN
F 1 "VCC" H 5817 2173 50  0000 C CNN
F 2 "" H 5800 2000 50  0001 C CNN
F 3 "" H 5800 2000 50  0001 C CNN
	1    5800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2000 5800 2300
Wire Wire Line
	5800 4100 5800 4200
$Comp
L Connector_Generic:Conn_01x15 J?
U 1 1 5DADCB67
P 8450 2950
F 0 "J?" H 8368 3867 50  0000 C CNN
F 1 "USB to GPIO" H 8368 3776 50  0000 C CNN
F 2 "" H 8450 2950 50  0001 C CNN
F 3 "~" H 8450 2950 50  0001 C CNN
	1    8450 2950
	-1   0    0    -1  
$EndComp
Text GLabel 8650 2250 2    50   BiDi ~ 0
C0
Text GLabel 8650 2350 2    50   BiDi ~ 0
C1
Text GLabel 8650 2450 2    50   BiDi ~ 0
C2
Text GLabel 8650 2550 2    50   BiDi ~ 0
C3
Text GLabel 8650 2650 2    50   BiDi ~ 0
C4
Text GLabel 8650 2750 2    50   BiDi ~ 0
C5
Text GLabel 8650 2850 2    50   BiDi ~ 0
C6
Text GLabel 8650 2950 2    50   BiDi ~ 0
C7
Text GLabel 8650 3050 2    50   Input ~ 0
D4
Text GLabel 8650 3150 2    50   Input ~ 0
D5
Text GLabel 8650 3250 2    50   Input ~ 0
D6
Text GLabel 8650 3550 2    50   Input ~ 0
CS
Text GLabel 8650 3350 2    50   Input ~ 0
MOSI
Text GLabel 8650 3450 2    50   Input ~ 0
SCK
Text Notes 9300 3400 0    50   ~ 0
Mode 0, MSB First
Text Notes 8900 3400 0    50   ~ 0
D1
Text Notes 8900 3500 0    50   ~ 0
D0
Text Notes 8900 3600 0    50   ~ 0
D3
Text Notes 6750 3950 0    50   ~ 0
Select
$Comp
L Device:R R?
U 1 1 5DB5F98C
P 3300 7450
F 0 "R?" H 3370 7496 50  0000 L CNN
F 1 "1K" H 3370 7405 50  0000 L CNN
F 2 "" V 3230 7450 50  0001 C CNN
F 3 "~" H 3300 7450 50  0001 C CNN
	1    3300 7450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB5FBAE
P 3300 6900
F 0 "#PWR?" H 3300 6750 50  0001 C CNN
F 1 "VCC" H 3317 7073 50  0000 C CNN
F 2 "" H 3300 6900 50  0001 C CNN
F 3 "" H 3300 6900 50  0001 C CNN
	1    3300 6900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5DB60215
P 2800 7200
F 0 "SW?" H 2800 7485 50  0000 C CNN
F 1 "SW_Push" H 2800 7394 50  0000 C CNN
F 2 "" H 2800 7400 50  0001 C CNN
F 3 "~" H 2800 7400 50  0001 C CNN
	1    2800 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 7300 3300 7200
Wire Wire Line
	3000 7200 3300 7200
Connection ~ 3300 7200
Wire Wire Line
	3300 7200 3300 6900
Wire Wire Line
	3300 7600 3300 7650
Wire Wire Line
	2350 7200 2600 7200
Wire Wire Line
	2350 7200 2350 7650
Wire Wire Line
	2350 7650 3300 7650
Connection ~ 3300 7650
Wire Wire Line
	3300 7650 3300 7700
Wire Wire Line
	3300 7200 3700 7200
Text GLabel 3700 7200 2    50   Output ~ 0
Out
Wire Bus Line
	3800 1950 3800 4850
Wire Bus Line
	5200 1950 5200 3800
$EndSCHEMATC
