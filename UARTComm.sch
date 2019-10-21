EESchema Schematic File Version 4
LIBS:MC6809P-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 2 6
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
L CPU_NXP_6800:MC6809 U?
U 1 1 5DA99B11
P 2750 6500
F 0 "U?" H 3050 7850 50  0000 C CNN
F 1 "MC6809" H 2500 7850 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 2750 5000 50  0001 C CNN
F 3 "http://pdf.datasheetcatalog.com/datasheet/motorola/MC68B09S.pdf" H 2750 6500 50  0001 C CNN
	1    2750 6500
	-1   0    0    -1  
$EndComp
$Comp
L Interface_UART:MC6850 U?
U 1 1 5DA99B17
P 2750 2900
F 0 "U?" H 2450 4150 50  0000 C CNN
F 1 "MC6850" H 2950 4150 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 2800 1750 50  0001 L CNN
F 3 "http://pdf.datasheetcatalog.com/datasheet/motorola/MC6850.pdf" H 2750 2900 50  0001 C CNN
	1    2750 2900
	1    0    0    -1  
$EndComp
$Comp
L Memory_NVRAM:FM1808B-SG U?
U 1 1 5DA99B1D
P 5550 2500
F 0 "U?" H 5300 3300 50  0000 C CNN
F 1 "FM1808 RAM 0000-7FFF" V 5550 2450 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x17.9mm_P1.27mm" H 5550 2500 50  0001 C CNN
F 3 "http://www.cypress.com/file/136521/download" H 5550 2500 50  0001 C CNN
	1    5550 2500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 1 1 5DA99B23
P 8800 3800
F 0 "U?" H 8800 4125 50  0000 C CNN
F 1 "74LS00" H 8800 4034 50  0000 C CNN
F 2 "" H 8800 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8800 3800 50  0001 C CNN
	1    8800 3800
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5DA99B29
P 6200 6700
F 0 "SW?" V 6246 6848 50  0000 L CNN
F 1 "Reset" V 6155 6848 50  0000 L CNN
F 2 "" H 6200 6900 50  0001 C CNN
F 3 "~" H 6200 6900 50  0001 C CNN
	1    6200 6700
	0    1    -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5DA99B2F
P 3400 9000
F 0 "C?" H 3515 9046 50  0000 L CNN
F 1 "18pF" H 3515 8955 50  0000 L CNN
F 2 "" H 3438 8850 50  0001 C CNN
F 3 "~" H 3400 9000 50  0001 C CNN
	1    3400 9000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DA99B35
P 4000 9000
F 0 "C?" H 4115 9046 50  0000 L CNN
F 1 "18pF" H 4115 8955 50  0000 L CNN
F 2 "" H 4038 8850 50  0001 C CNN
F 3 "~" H 4000 9000 50  0001 C CNN
	1    4000 9000
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5DA99B3B
P 3700 8600
F 0 "Y?" H 3700 8868 50  0000 C CNN
F 1 "XTAL 7.3728 MHz" H 4400 8600 50  0000 C CNN
F 2 "" H 3700 8600 50  0001 C CNN
F 3 "~" H 3700 8600 50  0001 C CNN
	1    3700 8600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DA99B41
P 1100 9600
F 0 "R?" H 1170 9646 50  0000 L CNN
F 1 "1K" H 1170 9555 50  0000 L CNN
F 2 "" V 1030 9600 50  0001 C CNN
F 3 "~" H 1100 9600 50  0001 C CNN
	1    1100 9600
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5DA99B47
P 1100 10100
F 0 "D?" V 1139 9982 50  0000 R CNN
F 1 "Power LED" V 1048 9982 50  0000 R CNN
F 2 "" H 1100 10100 50  0001 C CNN
F 3 "~" H 1100 10100 50  0001 C CNN
	1    1100 10100
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5DA99B4D
P 13300 7250
F 0 "J?" H 13380 7242 50  0000 L CNN
F 1 "Conn_01x06" H 13380 7151 50  0000 L CNN
F 2 "" H 13300 7250 50  0001 C CNN
F 3 "~" H 13300 7250 50  0001 C CNN
	1    13300 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5DA99B53
P 13350 8550
F 0 "J?" H 13430 8542 50  0000 L CNN
F 1 "Conn_01x02" H 13430 8451 50  0000 L CNN
F 2 "" H 13350 8550 50  0001 C CNN
F 3 "~" H 13350 8550 50  0001 C CNN
	1    13350 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 7600 3400 7600
Wire Wire Line
	3400 8600 3550 8600
Wire Wire Line
	3250 7500 3550 7500
Wire Wire Line
	4000 8600 3850 8600
Wire Wire Line
	3400 8600 3400 8850
Connection ~ 3400 8600
Wire Wire Line
	4000 8600 4000 8850
Connection ~ 4000 8600
Wire Wire Line
	3400 9150 3400 9400
Wire Wire Line
	4000 9150 3400 9150
Connection ~ 3400 9150
$Comp
L power:GND #PWR?
U 1 1 5DA99B64
P 3400 9400
F 0 "#PWR?" H 3400 9150 50  0001 C CNN
F 1 "GND" H 3405 9227 50  0000 C CNN
F 2 "" H 3400 9400 50  0001 C CNN
F 3 "" H 3400 9400 50  0001 C CNN
	1    3400 9400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA99B6A
P 2750 4850
F 0 "#PWR?" H 2750 4700 50  0001 C CNN
F 1 "VCC" H 2767 5023 50  0000 C CNN
F 2 "" H 2750 4850 50  0001 C CNN
F 3 "" H 2750 4850 50  0001 C CNN
	1    2750 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA99B70
P 2750 8050
F 0 "#PWR?" H 2750 7800 50  0001 C CNN
F 1 "GND" H 2755 7877 50  0000 C CNN
F 2 "" H 2750 8050 50  0001 C CNN
F 3 "" H 2750 8050 50  0001 C CNN
	1    2750 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 7900 2750 8050
$Comp
L power:VCC #PWR?
U 1 1 5DA99B77
P 1100 9350
F 0 "#PWR?" H 1100 9200 50  0001 C CNN
F 1 "VCC" H 1117 9523 50  0000 C CNN
F 2 "" H 1100 9350 50  0001 C CNN
F 3 "" H 1100 9350 50  0001 C CNN
	1    1100 9350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA99B7D
P 1100 10450
F 0 "#PWR?" H 1100 10200 50  0001 C CNN
F 1 "GND" H 1105 10277 50  0000 C CNN
F 2 "" H 1100 10450 50  0001 C CNN
F 3 "" H 1100 10450 50  0001 C CNN
	1    1100 10450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 9350 1100 9450
Wire Wire Line
	1100 9750 1100 9950
Wire Wire Line
	1100 10250 1100 10450
NoConn ~ 2250 7100
NoConn ~ 2250 7200
NoConn ~ 2250 7500
Wire Wire Line
	6200 6200 6200 6500
Connection ~ 6200 6500
Wire Wire Line
	6200 6900 6200 6950
Wire Wire Line
	3400 7600 3400 8600
Wire Wire Line
	4000 8050 3550 8050
Wire Wire Line
	3550 8050 3550 7500
Wire Wire Line
	4000 8050 4000 8600
$Comp
L power:VCC #PWR?
U 1 1 5DA99B90
P 5150 7050
F 0 "#PWR?" H 5150 6900 50  0001 C CNN
F 1 "VCC" H 5167 7223 50  0000 C CNN
F 2 "" H 5150 7050 50  0001 C CNN
F 3 "" H 5150 7050 50  0001 C CNN
	1    5150 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 5DA99B96
P 4650 6850
F 0 "RN?" V 5175 6850 50  0000 C CNN
F 1 "2.2K" V 5084 6850 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5125 6850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4650 6850 50  0001 C CNN
	1    4650 6850
	0    1    -1   0   
$EndComp
Wire Wire Line
	4850 7250 5150 7250
Wire Wire Line
	5150 7250 5150 7050
Wire Wire Line
	3250 6200 6200 6200
Wire Wire Line
	3250 7400 3350 7400
Wire Wire Line
	3350 7400 3350 7250
Wire Wire Line
	3350 7250 4450 7250
Wire Wire Line
	3250 7100 3400 7100
Wire Wire Line
	3400 7100 3400 7150
Wire Wire Line
	3400 7150 4450 7150
Wire Wire Line
	3250 7000 3500 7000
Wire Wire Line
	3500 7000 3500 7050
Wire Wire Line
	3500 7050 4450 7050
Wire Wire Line
	3250 6500 3600 6500
Wire Wire Line
	3600 6500 3600 6950
Wire Wire Line
	3600 6950 4450 6950
Wire Wire Line
	3250 6400 3700 6400
Wire Wire Line
	3700 6400 3700 6850
Wire Wire Line
	3700 6850 4450 6850
Wire Wire Line
	3250 6300 3800 6300
Wire Wire Line
	3800 6300 3800 6750
Wire Wire Line
	3800 6750 4450 6750
Wire Wire Line
	1350 3200 1350 3400
Connection ~ 1350 3400
Wire Wire Line
	1350 3400 1350 3500
Wire Wire Line
	1350 3500 1350 7400
Connection ~ 1350 3500
Text Notes 10250 10500 0    50   ~ 0
Memory Map:\n0000-7FFF <= 32K RAM\n8000-9FFF <= IO\nA000-BFFF <= Serial interface\nC000-FFFF <= Top 16K ROM
Wire Notes Line style solid
	10100 9950 11700 9950
Wire Notes Line style solid
	11700 9950 11700 10750
Wire Notes Line style solid
	11700 10750 10100 10750
Wire Notes Line style solid
	10100 10750 10100 9950
$Comp
L Device:C C?
U 1 1 5DA99BBB
P 2950 4900
F 0 "C?" H 3065 4946 50  0000 L CNN
F 1 "0.1uF" H 3065 4855 50  0000 L CNN
F 2 "" H 2988 4750 50  0001 C CNN
F 3 "~" H 2950 4900 50  0001 C CNN
	1    2950 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA99BC1
P 3200 4900
F 0 "#PWR?" H 3200 4650 50  0001 C CNN
F 1 "GND" H 3205 4727 50  0000 C CNN
F 2 "" H 3200 4900 50  0001 C CNN
F 3 "" H 3200 4900 50  0001 C CNN
	1    3200 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4900 3200 4900
$Comp
L power:VCC #PWR?
U 1 1 5DA99BC8
P 2750 1350
F 0 "#PWR?" H 2750 1200 50  0001 C CNN
F 1 "VCC" H 2767 1523 50  0000 C CNN
F 2 "" H 2750 1350 50  0001 C CNN
F 3 "" H 2750 1350 50  0001 C CNN
	1    2750 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DA99BCE
P 2950 1400
F 0 "C?" H 3065 1446 50  0000 L CNN
F 1 "0.1uF" H 3065 1355 50  0000 L CNN
F 2 "" H 2988 1250 50  0001 C CNN
F 3 "~" H 2950 1400 50  0001 C CNN
	1    2950 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA99BD4
P 3200 1400
F 0 "#PWR?" H 3200 1150 50  0001 C CNN
F 1 "GND" H 3205 1227 50  0000 C CNN
F 2 "" H 3200 1400 50  0001 C CNN
F 3 "" H 3200 1400 50  0001 C CNN
	1    3200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1400 3200 1400
$Comp
L power:VCC #PWR?
U 1 1 5DA99BDB
P 5550 1350
F 0 "#PWR?" H 5550 1200 50  0001 C CNN
F 1 "VCC" H 5567 1523 50  0000 C CNN
F 2 "" H 5550 1350 50  0001 C CNN
F 3 "" H 5550 1350 50  0001 C CNN
	1    5550 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DA99BE1
P 5750 1350
F 0 "C?" H 5865 1396 50  0000 L CNN
F 1 "0.1uF" H 5865 1305 50  0000 L CNN
F 2 "" H 5788 1200 50  0001 C CNN
F 3 "~" H 5750 1350 50  0001 C CNN
	1    5750 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA99BE7
P 6000 1350
F 0 "#PWR?" H 6000 1100 50  0001 C CNN
F 1 "GND" H 6005 1177 50  0000 C CNN
F 2 "" H 6000 1350 50  0001 C CNN
F 3 "" H 6000 1350 50  0001 C CNN
	1    6000 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1350 6000 1350
$Comp
L power:VCC #PWR?
U 1 1 5DA99BEE
P 8000 1350
F 0 "#PWR?" H 8000 1200 50  0001 C CNN
F 1 "VCC" H 8017 1523 50  0000 C CNN
F 2 "" H 8000 1350 50  0001 C CNN
F 3 "" H 8000 1350 50  0001 C CNN
	1    8000 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DA99BF4
P 8200 1350
F 0 "C?" H 8315 1396 50  0000 L CNN
F 1 "0.1uF" H 8315 1305 50  0000 L CNN
F 2 "" H 8238 1200 50  0001 C CNN
F 3 "~" H 8200 1350 50  0001 C CNN
	1    8200 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA99BFA
P 8450 1350
F 0 "#PWR?" H 8450 1100 50  0001 C CNN
F 1 "GND" H 8455 1177 50  0000 C CNN
F 2 "" H 8450 1350 50  0001 C CNN
F 3 "" H 8450 1350 50  0001 C CNN
	1    8450 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1350 8450 1350
Entry Wire Line
	2000 1700 2100 1800
Entry Wire Line
	2000 1800 2100 1900
Entry Wire Line
	2000 1900 2100 2000
Entry Wire Line
	2000 2000 2100 2100
Entry Wire Line
	2000 2100 2100 2200
Entry Wire Line
	2000 2200 2100 2300
Entry Wire Line
	2000 2300 2100 2400
Entry Wire Line
	2000 2400 2100 2500
Entry Wire Line
	6250 2500 6350 2400
Entry Wire Line
	6250 2400 6350 2300
Entry Wire Line
	6250 2300 6350 2200
Entry Wire Line
	6250 2200 6350 2100
Entry Wire Line
	6250 2100 6350 2000
Entry Wire Line
	6250 2000 6350 1900
Entry Wire Line
	6250 1900 6350 1800
Entry Wire Line
	6250 1800 6350 1700
Entry Wire Line
	8700 2500 8800 2400
Entry Wire Line
	8700 2400 8800 2300
Entry Wire Line
	8700 2300 8800 2200
Entry Wire Line
	8700 2200 8800 2100
Entry Wire Line
	8700 2100 8800 2000
Entry Wire Line
	8700 2000 8800 1900
Entry Wire Line
	8700 1900 8800 1800
Entry Wire Line
	8700 1800 8800 1700
Entry Wire Line
	3400 6000 3500 5900
Entry Wire Line
	3400 5900 3500 5800
Entry Wire Line
	3400 5800 3500 5700
Entry Wire Line
	3400 5700 3500 5600
Entry Wire Line
	3400 5600 3500 5500
Entry Wire Line
	3400 5500 3500 5400
Entry Wire Line
	3400 5400 3500 5300
Entry Wire Line
	3400 5300 3500 5200
Wire Wire Line
	2100 1800 2250 1800
Wire Wire Line
	2100 1900 2250 1900
Wire Wire Line
	2100 2000 2250 2000
Wire Wire Line
	2100 2100 2250 2100
Wire Wire Line
	2100 2200 2250 2200
Wire Wire Line
	2100 2300 2250 2300
Wire Wire Line
	2100 2400 2250 2400
Wire Wire Line
	2100 2500 2250 2500
Wire Wire Line
	6050 1800 6250 1800
Wire Wire Line
	6050 1900 6250 1900
Wire Wire Line
	6050 2000 6250 2000
Wire Wire Line
	6050 2100 6250 2100
Wire Wire Line
	6050 2200 6250 2200
Wire Wire Line
	6050 2300 6250 2300
Wire Wire Line
	6050 2400 6250 2400
Wire Wire Line
	6050 2500 6250 2500
Wire Wire Line
	8500 1800 8700 1800
Wire Wire Line
	8500 1900 8700 1900
Wire Wire Line
	8500 2000 8700 2000
Wire Wire Line
	8500 2100 8700 2100
Wire Wire Line
	8500 2200 8700 2200
Wire Wire Line
	8500 2300 8700 2300
Wire Wire Line
	8500 2400 8700 2400
Wire Wire Line
	8500 2500 8700 2500
Wire Wire Line
	3250 5300 3400 5300
Wire Wire Line
	3250 5400 3400 5400
Wire Wire Line
	3250 5500 3400 5500
Wire Wire Line
	3250 5600 3400 5600
Wire Wire Line
	3250 5700 3400 5700
Wire Wire Line
	3250 5800 3400 5800
Wire Wire Line
	3250 5900 3400 5900
Wire Wire Line
	3250 6000 3400 6000
Wire Wire Line
	5550 1350 5550 1600
Wire Wire Line
	8000 1350 8000 1600
Wire Bus Line
	2000 850  3500 850 
Wire Bus Line
	6350 850  8800 850 
Connection ~ 6350 850 
Connection ~ 3500 850 
Wire Bus Line
	3500 850  6350 850 
Wire Wire Line
	1350 3200 2250 3200
Wire Wire Line
	1350 3400 2250 3400
Wire Wire Line
	1350 3500 2250 3500
Wire Wire Line
	1350 7400 1850 7400
Entry Wire Line
	1950 5200 2050 5300
Entry Wire Line
	1950 5300 2050 5400
Entry Wire Line
	1950 5400 2050 5500
Entry Wire Line
	1950 5500 2050 5600
Entry Wire Line
	1950 5600 2050 5700
Entry Wire Line
	1950 5700 2050 5800
Entry Wire Line
	1950 5800 2050 5900
Entry Wire Line
	1950 5900 2050 6000
Entry Wire Line
	1950 6000 2050 6100
Entry Wire Line
	1950 6100 2050 6200
Entry Wire Line
	1950 6200 2050 6300
Entry Wire Line
	1950 6300 2050 6400
Entry Wire Line
	1950 6400 2050 6500
Entry Wire Line
	1950 6500 2050 6600
Entry Wire Line
	1950 6600 2050 6700
Entry Wire Line
	1950 6700 2050 6800
Wire Wire Line
	2050 5300 2250 5300
Wire Wire Line
	2050 5400 2250 5400
Wire Wire Line
	2050 5500 2250 5500
Wire Wire Line
	2050 5600 2250 5600
Wire Wire Line
	2050 5700 2250 5700
Wire Wire Line
	2050 5800 2250 5800
Wire Wire Line
	2050 5900 2250 5900
Wire Wire Line
	2050 6000 2250 6000
Wire Wire Line
	2050 6100 2250 6100
Wire Wire Line
	2050 6200 2250 6200
Wire Wire Line
	2050 6300 2250 6300
Wire Wire Line
	2050 6400 2250 6400
Wire Wire Line
	2050 6500 2250 6500
Wire Wire Line
	2050 6600 2250 6600
Wire Wire Line
	2050 6700 2250 6700
Wire Wire Line
	2050 6800 2250 6800
Entry Wire Line
	4700 1700 4800 1800
Entry Wire Line
	4700 1800 4800 1900
Entry Wire Line
	4700 1900 4800 2000
Entry Wire Line
	4700 2000 4800 2100
Entry Wire Line
	4700 2100 4800 2200
Entry Wire Line
	4700 2200 4800 2300
Entry Wire Line
	4700 2300 4800 2400
Entry Wire Line
	4700 2400 4800 2500
Entry Wire Line
	4700 2500 4800 2600
Entry Wire Line
	4700 2600 4800 2700
Entry Wire Line
	4700 2700 4800 2800
Entry Wire Line
	4700 2800 4800 2900
Entry Wire Line
	4700 2900 4800 3000
Entry Wire Line
	4700 3000 4800 3100
Entry Wire Line
	4700 3100 4800 3200
Wire Wire Line
	4800 1800 5050 1800
Wire Wire Line
	4800 1900 5050 1900
Wire Wire Line
	4800 2000 5050 2000
Wire Wire Line
	4800 2100 5050 2100
Wire Wire Line
	4800 2200 5050 2200
Wire Wire Line
	4800 2300 5050 2300
Wire Wire Line
	4800 2400 5050 2400
Wire Wire Line
	4800 2500 5050 2500
Wire Wire Line
	4800 2600 5050 2600
Wire Wire Line
	4800 2700 5050 2700
Wire Wire Line
	4800 2800 5050 2800
Wire Wire Line
	4800 2900 5050 2900
Wire Wire Line
	4800 3000 5050 3000
Wire Wire Line
	4800 3100 5050 3100
Wire Wire Line
	4800 3200 5050 3200
Entry Wire Line
	7150 1700 7250 1800
Entry Wire Line
	7150 1800 7250 1900
Entry Wire Line
	7150 1900 7250 2000
Entry Wire Line
	7150 2000 7250 2100
Entry Wire Line
	7150 2100 7250 2200
Entry Wire Line
	7150 2200 7250 2300
Entry Wire Line
	7150 2300 7250 2400
Entry Wire Line
	7150 2400 7250 2500
Entry Wire Line
	7150 2500 7250 2600
Entry Wire Line
	7150 2600 7250 2700
Entry Wire Line
	7150 2700 7250 2800
Entry Wire Line
	7150 2800 7250 2900
Entry Wire Line
	7150 2900 7250 3000
Entry Wire Line
	7150 3000 7250 3100
Entry Wire Line
	7150 3100 7250 3200
Wire Wire Line
	7250 1800 7500 1800
Wire Wire Line
	7250 1900 7500 1900
Wire Wire Line
	7250 2000 7500 2000
Wire Wire Line
	7250 2100 7500 2100
Wire Wire Line
	7250 2200 7500 2200
Wire Wire Line
	7250 2300 7500 2300
Wire Wire Line
	7250 2400 7500 2400
Wire Wire Line
	7250 2500 7500 2500
Wire Wire Line
	7250 2600 7500 2600
Wire Wire Line
	7250 2700 7500 2700
Wire Wire Line
	7250 2800 7500 2800
Wire Wire Line
	7250 2900 7500 2900
Wire Wire Line
	7250 3000 7500 3000
Wire Wire Line
	7250 3100 7500 3100
Wire Wire Line
	7250 3200 7500 3200
Wire Wire Line
	5600 1350 5550 1350
Connection ~ 5550 1350
Wire Wire Line
	8050 1350 8000 1350
Connection ~ 8000 1350
Wire Wire Line
	2750 1350 2750 1400
Wire Wire Line
	2800 1400 2750 1400
Connection ~ 2750 1400
Wire Wire Line
	2750 1400 2750 1600
Wire Wire Line
	2750 4850 2750 4900
Wire Wire Line
	2800 4900 2750 4900
Connection ~ 2750 4900
Wire Wire Line
	2750 4900 2750 5100
Wire Bus Line
	1950 4450 4700 4450
Wire Bus Line
	4700 4450 6350 4450
Connection ~ 4700 4450
Entry Wire Line
	8900 4350 8800 4450
Entry Wire Line
	8700 4350 8600 4450
Wire Wire Line
	8700 4350 8700 4100
Wire Wire Line
	8900 4100 8900 4350
Text Label 8700 4300 1    50   ~ 0
A14
Text Label 8900 4300 1    50   ~ 0
A15
Text Notes 8850 3250 0    50   ~ 0
Top 16K
Entry Wire Line
	6250 3200 6350 3300
Wire Wire Line
	6050 3200 6250 3200
Text Label 6050 3200 0    50   ~ 0
A15
Wire Bus Line
	6350 3300 6350 4450
Connection ~ 6350 4450
Wire Bus Line
	6350 4450 7150 4450
Connection ~ 7150 4450
Wire Wire Line
	8800 3200 8800 3500
Wire Wire Line
	8800 3200 8500 3200
Wire Wire Line
	6950 6950 6950 7050
Connection ~ 6950 6950
Wire Wire Line
	6200 6950 6950 6950
Wire Wire Line
	6950 6900 6950 6950
Wire Wire Line
	6950 5900 6950 6050
$Comp
L power:GND #PWR?
U 1 1 5DA99CCC
P 6950 7050
F 0 "#PWR?" H 6950 6800 50  0001 C CNN
F 1 "GND" H 6955 6877 50  0000 C CNN
F 2 "" H 6950 7050 50  0001 C CNN
F 3 "" H 6950 7050 50  0001 C CNN
	1    6950 7050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA99CD2
P 6950 5900
F 0 "#PWR?" H 6950 5750 50  0001 C CNN
F 1 "VCC" H 6967 6073 50  0000 C CNN
F 2 "" H 6950 5900 50  0001 C CNN
F 3 "" H 6950 5900 50  0001 C CNN
	1    6950 5900
	1    0    0    -1  
$EndComp
Connection ~ 6950 6500
Wire Wire Line
	6950 6500 6950 6350
Wire Wire Line
	6950 6500 6950 6600
Wire Wire Line
	6200 6500 6950 6500
$Comp
L Device:CP1 C?
U 1 1 5DA99CDC
P 6950 6750
F 0 "C?" H 7065 6796 50  0000 L CNN
F 1 "10uF" H 7065 6705 50  0000 L CNN
F 2 "" H 6950 6750 50  0001 C CNN
F 3 "~" H 6950 6750 50  0001 C CNN
	1    6950 6750
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N914 D?
U 1 1 5DA99CE2
P 6950 6200
F 0 "D?" V 6904 6279 50  0000 L CNN
F 1 "1N914" V 6995 6279 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6950 6025 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85622/1n914.pdf" H 6950 6200 50  0001 C CNN
	1    6950 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 7000 1950 7000
Wire Wire Line
	1950 7000 1950 9700
Wire Wire Line
	1950 9700 9200 9700
Wire Wire Line
	9200 9700 9200 7450
Wire Wire Line
	9200 7150 9300 7150
Wire Wire Line
	9300 7150 9300 7000
Wire Wire Line
	9200 7150 9100 7150
Wire Wire Line
	9100 7150 9100 7000
Connection ~ 9200 7150
Wire Wire Line
	9200 7450 8250 7450
Wire Wire Line
	8250 7450 8250 6050
Connection ~ 9200 7450
Wire Wire Line
	9200 7450 9200 7150
Wire Wire Line
	1850 7400 1850 9800
Wire Wire Line
	1850 9800 8450 9800
Wire Wire Line
	8450 9800 8450 6250
Connection ~ 1850 7400
Wire Wire Line
	1850 7400 2250 7400
Wire Wire Line
	8450 6250 9000 6250
Wire Wire Line
	9000 6250 9000 6050
Connection ~ 8450 6250
Wire Wire Line
	8450 6250 8450 6050
Wire Wire Line
	9200 6400 9200 6050
Wire Wire Line
	8350 5450 8350 5100
Wire Wire Line
	6900 2900 6050 2900
Wire Wire Line
	9100 5450 9100 5250
Wire Wire Line
	9100 5250 6750 5250
Wire Wire Line
	6750 5250 6750 3000
Wire Wire Line
	6750 3000 6050 3000
Wire Wire Line
	8500 3000 9550 3000
Wire Wire Line
	9550 5250 9100 5250
Connection ~ 9100 5250
Wire Wire Line
	8350 5100 9650 5100
Wire Wire Line
	9650 5100 9650 2900
Wire Wire Line
	9650 2900 8500 2900
Wire Wire Line
	6900 5100 8350 5100
Wire Wire Line
	6900 2900 6900 5100
Connection ~ 8350 5100
Wire Wire Line
	1950 7000 1800 7000
Wire Wire Line
	1800 7000 1800 2700
Wire Wire Line
	1800 2700 2250 2700
Connection ~ 1950 7000
Text Notes 700  7500 0    50   ~ 0
E = XTAL / 4 = 1.8432 MHz
$Comp
L LED:HDSP-4830_2 BAR?
U 1 1 5DA99D13
P 12000 1650
F 0 "BAR?" H 12000 2317 50  0000 C CNN
F 1 "HDSP-4830_2" H 12000 2226 50  0000 C CNN
F 2 "Display:HDSP-4830" H 12000 850 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-1798EN" H 10000 1850 50  0001 C CNN
	1    12000 1650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Network08 RN?
U 1 1 5DA99D19
P 12700 1550
F 0 "RN?" V 13225 1550 50  0000 C CNN
F 1 "1K" V 13134 1550 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 13175 1550 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 12700 1550 50  0001 C CNN
	1    12700 1550
	0    1    -1   0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA99D1F
P 13150 1750
F 0 "#PWR?" H 13150 1600 50  0001 C CNN
F 1 "VCC" H 13167 1923 50  0000 C CNN
F 2 "" H 13150 1750 50  0001 C CNN
F 3 "" H 13150 1750 50  0001 C CNN
	1    13150 1750
	1    0    0    -1  
$EndComp
Entry Wire Line
	10250 1950 10150 1850
Entry Wire Line
	10250 1850 10150 1750
Entry Wire Line
	10250 1750 10150 1650
Entry Wire Line
	10250 1650 10150 1550
Entry Wire Line
	10250 1550 10150 1450
Entry Wire Line
	10250 1450 10150 1350
Entry Wire Line
	10250 1350 10150 1250
Entry Wire Line
	10250 1250 10150 1150
Wire Wire Line
	10450 1250 10250 1250
Wire Wire Line
	10450 1350 10250 1350
Wire Wire Line
	10450 1450 10250 1450
Wire Wire Line
	10450 1550 10250 1550
Wire Wire Line
	10450 1650 10250 1650
Wire Wire Line
	10450 1750 10250 1750
Wire Wire Line
	10450 1850 10250 1850
Wire Wire Line
	10450 1950 10250 1950
Wire Bus Line
	8800 850  10150 850 
Connection ~ 8800 850 
$Comp
L power:GND #PWR?
U 1 1 5DA99D37
P 8000 3500
F 0 "#PWR?" H 8000 3250 50  0001 C CNN
F 1 "GND" H 8005 3327 50  0000 C CNN
F 2 "" H 8000 3500 50  0001 C CNN
F 3 "" H 8000 3500 50  0001 C CNN
	1    8000 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA99D3D
P 10950 2650
F 0 "#PWR?" H 10950 2400 50  0001 C CNN
F 1 "GND" H 10955 2477 50  0000 C CNN
F 2 "" H 10950 2650 50  0001 C CNN
F 3 "" H 10950 2650 50  0001 C CNN
	1    10950 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3400 8000 3500
Wire Wire Line
	11450 1250 11800 1250
Wire Wire Line
	11450 1350 11800 1350
Wire Wire Line
	11450 1450 11800 1450
Wire Wire Line
	11450 1550 11800 1550
Wire Wire Line
	11450 1650 11800 1650
Wire Wire Line
	11450 1750 11800 1750
Wire Wire Line
	11450 1850 11800 1850
Wire Wire Line
	11450 1950 11800 1950
Wire Wire Line
	12200 1250 12500 1250
Wire Wire Line
	12200 1350 12500 1350
Wire Wire Line
	12200 1450 12500 1450
Wire Wire Line
	12200 1550 12500 1550
Wire Wire Line
	12200 1650 12500 1650
Wire Wire Line
	12200 1750 12500 1750
Wire Wire Line
	12200 1850 12500 1850
Wire Wire Line
	12200 1950 12500 1950
$Comp
L 74xx:74LS273 U?
U 1 1 5DA99D54
P 10950 1750
F 0 "U?" H 10700 2400 50  0000 C CNN
F 1 "74LS273 0x8000" V 10950 1750 50  0000 C CNN
F 2 "" H 10950 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS273" H 10950 1750 50  0001 C CNN
	1    10950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 2550 10950 2650
$Comp
L power:VCC #PWR?
U 1 1 5DA99D5B
P 10950 850
F 0 "#PWR?" H 10950 700 50  0001 C CNN
F 1 "VCC" H 10967 1023 50  0000 C CNN
F 2 "" H 10950 850 50  0001 C CNN
F 3 "" H 10950 850 50  0001 C CNN
	1    10950 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 850  10950 950 
$Comp
L power:VCC #PWR?
U 1 1 5DA99D62
P 9900 2050
F 0 "#PWR?" H 9900 1900 50  0001 C CNN
F 1 "VCC" H 9917 2223 50  0000 C CNN
F 2 "" H 9900 2050 50  0001 C CNN
F 3 "" H 9900 2050 50  0001 C CNN
	1    9900 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 2250 9900 2250
Wire Wire Line
	9900 2250 9900 2050
Text Notes 9000 7300 0    50   ~ 0
R/~W
Text Notes 8150 5450 0    50   ~ 0
Read
$Comp
L 74xx:74LS00 U?
U 2 1 5DA99D6C
P 8350 5750
F 0 "U?" V 8396 5570 50  0000 R CNN
F 1 "74LS00" V 8305 5570 50  0000 R CNN
F 2 "" H 8350 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 8350 5750 50  0001 C CNN
	2    8350 5750
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS00 U?
U 3 1 5DA99D72
P 9100 5750
F 0 "U?" V 9146 5570 50  0000 R CNN
F 1 "74LS00" V 9055 5570 50  0000 R CNN
F 2 "" H 9100 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9100 5750 50  0001 C CNN
	3    9100 5750
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS00 U?
U 4 1 5DA99D78
P 9200 6700
F 0 "U?" V 9246 6520 50  0000 R CNN
F 1 "74LS00" V 9155 6520 50  0000 R CNN
F 2 "" H 9200 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 9200 6700 50  0001 C CNN
	4    9200 6700
	0    -1   -1   0   
$EndComp
$Comp
L Memory_NVRAM:FM1808B-SG U?
U 1 1 5DA99D7E
P 8000 2500
F 0 "U?" H 7750 3300 50  0000 C CNN
F 1 "FM1808 ROM C000-FFFF" V 8000 2450 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x17.9mm_P1.27mm" H 8000 2500 50  0001 C CNN
F 3 "http://www.cypress.com/file/136521/download" H 8000 2500 50  0001 C CNN
	1    8000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 3000 10350 2150
Wire Wire Line
	10350 2150 10450 2150
Wire Bus Line
	9300 4450 9300 3450
Wire Wire Line
	12900 1950 13150 1950
Wire Wire Line
	13150 1950 13150 1750
$Comp
L 74xx:74LS04 U?
U 1 1 5DA99D89
P 10700 4000
F 0 "U?" H 10700 4317 50  0000 C CNN
F 1 "74LS04" H 10700 4226 50  0000 C CNN
F 2 "" H 10700 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10700 4000 50  0001 C CNN
	1    10700 4000
	1    0    0    -1  
$EndComp
Text Notes 13300 3850 0    50   ~ 0
0x8000
Text Notes 9150 5450 0    50   ~ 0
Write
$Comp
L 74xx:74LS04 U?
U 2 1 5DA99D91
P 10700 3650
F 0 "U?" H 10700 3967 50  0000 C CNN
F 1 "74LS04" H 10700 3876 50  0000 C CNN
F 2 "" H 10700 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10700 3650 50  0001 C CNN
	2    10700 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U?
U 1 1 5DA99D97
P 11700 4350
F 0 "U?" H 11700 4725 50  0000 C CNN
F 1 "74LS21" H 11700 4634 50  0000 C CNN
F 2 "" H 11700 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 11700 4350 50  0001 C CNN
	1    11700 4350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DA99D9D
P 12850 4150
F 0 "U?" H 12850 4931 50  0000 C CNN
F 1 "74LS138" H 12850 4840 50  0000 C CNN
F 2 "" H 12850 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 12850 4150 50  0001 C CNN
	1    12850 4150
	1    0    0    -1  
$EndComp
Entry Wire Line
	10200 4400 10100 4300
Entry Wire Line
	10200 4000 10100 3900
Entry Wire Line
	10200 3650 10100 3550
Wire Wire Line
	10400 3650 10200 3650
Wire Wire Line
	10400 4000 10200 4000
Wire Wire Line
	10400 4400 10200 4400
Text Label 10200 3650 0    50   ~ 0
A12
Text Label 10200 4000 0    50   ~ 0
A13
Text Label 10200 4400 0    50   ~ 0
A14
Text Label 10200 4700 0    50   ~ 0
A15
Wire Wire Line
	11400 4500 11200 4500
Entry Wire Line
	10200 4700 10100 4600
$Comp
L 74xx:74LS04 U?
U 3 1 5DA99DAF
P 10700 4400
F 0 "U?" H 10700 4717 50  0000 C CNN
F 1 "74LS04" H 10700 4626 50  0000 C CNN
F 2 "" H 10700 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10700 4400 50  0001 C CNN
	3    10700 4400
	1    0    0    -1  
$EndComp
Wire Bus Line
	9300 3450 10100 3450
Wire Wire Line
	11000 4400 11400 4400
Wire Wire Line
	11000 4000 11000 4300
Wire Wire Line
	11000 4300 11400 4300
Wire Wire Line
	11000 3650 11150 3650
Wire Wire Line
	11150 3650 11150 4200
Wire Wire Line
	11150 4200 11400 4200
Wire Wire Line
	12350 4450 12200 4450
Wire Wire Line
	12000 4350 12350 4350
$Comp
L power:GND #PWR?
U 1 1 5DA99DBE
P 12850 5000
F 0 "#PWR?" H 12850 4750 50  0001 C CNN
F 1 "GND" H 12855 4827 50  0000 C CNN
F 2 "" H 12850 5000 50  0001 C CNN
F 3 "" H 12850 5000 50  0001 C CNN
	1    12850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	12350 4550 12350 4900
Wire Wire Line
	12350 4900 12850 4900
Wire Wire Line
	12850 4900 12850 4850
Wire Wire Line
	12850 5000 12850 4900
Connection ~ 12850 4900
Entry Wire Line
	12050 3750 12150 3850
Entry Wire Line
	12050 3850 12150 3950
Entry Wire Line
	12050 3950 12150 4050
Wire Wire Line
	12150 3850 12350 3850
Wire Wire Line
	12150 3950 12350 3950
Wire Wire Line
	12150 4050 12350 4050
Text Label 12150 3850 0    50   ~ 0
A0
Text Label 12150 3950 0    50   ~ 0
A1
Text Label 12150 4050 0    50   ~ 0
A2
Wire Bus Line
	10100 3450 10100 3200
Wire Bus Line
	10100 3200 12050 3200
Connection ~ 10100 3450
Wire Wire Line
	13350 3850 13650 3850
Text Notes 13300 3950 0    50   ~ 0
0x8001
Text Notes 13300 4050 0    50   ~ 0
0x8002
Text Notes 13300 4150 0    50   ~ 0
0x8003
Text Notes 13300 4250 0    50   ~ 0
0x8004
Text Notes 13300 4350 0    50   ~ 0
0x8005
Text Notes 13300 4450 0    50   ~ 0
0x8006
Text Notes 13300 4550 0    50   ~ 0
0x8007
Wire Wire Line
	10200 4700 11200 4700
Wire Wire Line
	11200 4700 11200 4500
Wire Wire Line
	3700 6400 3700 2000
Wire Wire Line
	3700 2000 3150 2000
Connection ~ 3700 6400
$Comp
L power:GND #PWR?
U 1 1 5DA99DE2
P 5550 3500
F 0 "#PWR?" H 5550 3250 50  0001 C CNN
F 1 "GND" H 5555 3327 50  0000 C CNN
F 2 "" H 5550 3500 50  0001 C CNN
F 3 "" H 5550 3500 50  0001 C CNN
	1    5550 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DA99DE8
P 2950 4350
F 0 "#PWR?" H 2950 4100 50  0001 C CNN
F 1 "GND" H 2955 4177 50  0000 C CNN
F 2 "" H 2950 4350 50  0001 C CNN
F 3 "" H 2950 4350 50  0001 C CNN
	1    2950 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5550 3400 5550 3500
Wire Wire Line
	2250 3800 2050 3800
Wire Wire Line
	2750 4350 2950 4350
Wire Wire Line
	2750 4100 2750 4350
Wire Wire Line
	2050 4350 2750 4350
Wire Wire Line
	2050 3800 2050 4350
Connection ~ 2750 4350
Wire Wire Line
	2250 3900 2150 3900
Wire Wire Line
	2150 3900 2150 4250
Wire Wire Line
	2150 4250 3250 4250
Wire Wire Line
	3250 4250 3250 3800
Wire Wire Line
	3250 3800 3150 3800
Wire Wire Line
	2250 2800 1650 2800
Wire Wire Line
	2250 2900 1650 2900
Wire Wire Line
	2250 3000 1650 3000
Wire Wire Line
	2250 3100 1650 3100
Entry Wire Line
	1550 2700 1650 2800
Entry Wire Line
	1550 2800 1650 2900
Entry Wire Line
	1550 2900 1650 3000
Entry Wire Line
	1550 3000 1650 3100
Text Label 1650 2800 0    50   ~ 0
A0
Text Label 1650 2900 0    50   ~ 0
A15
Text Label 1650 3000 0    50   ~ 0
A13
Text Label 1650 3100 0    50   ~ 0
A14
Wire Bus Line
	1950 4450 1550 4450
Connection ~ 1950 4450
Text GLabel 12950 7050 0    50   Input ~ 0
RX
Text GLabel 12950 7150 0    50   Input ~ 0
TX
Wire Wire Line
	12950 7050 13100 7050
Wire Wire Line
	12950 7150 13100 7150
Text GLabel 2100 3700 0    50   Input ~ 0
RX
Text GLabel 3300 3700 2    50   Input ~ 0
TX
Wire Wire Line
	2100 3700 2250 3700
Wire Wire Line
	3150 3700 3300 3700
$Comp
L 74xx:74LS04 U?
U 4 1 5DA99E10
P 13950 3850
F 0 "U?" H 13950 4167 50  0000 C CNN
F 1 "74LS04" H 13950 4076 50  0000 C CNN
F 2 "" H 13950 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 13950 3850 50  0001 C CNN
	4    13950 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 3000 14350 3850
Wire Wire Line
	14350 3850 14250 3850
Wire Wire Line
	10350 3000 14350 3000
Wire Wire Line
	9550 3000 9550 5250
Wire Wire Line
	9550 5250 12200 5250
Wire Wire Line
	12200 4450 12200 5250
Connection ~ 9550 5250
Text Notes 550  3000 0    50   ~ 0
A000 = TX/RX registers\nA001 = Control registers
Text Notes 2100 3100 0    50   ~ 0
~CS2
Wire Bus Line
	7150 4450 9300 4450
Wire Bus Line
	12050 3200 12050 3950
Wire Bus Line
	10100 3450 10100 4600
Wire Bus Line
	1550 2700 1550 4450
Wire Bus Line
	10150 850  10150 1850
Wire Bus Line
	3500 850  3500 5900
Wire Bus Line
	8800 850  8800 2400
Wire Bus Line
	6350 850  6350 2400
Wire Bus Line
	2000 850  2000 2400
Wire Bus Line
	4700 1700 4700 4450
Wire Bus Line
	7150 1700 7150 4450
Wire Bus Line
	1950 4450 1950 6700
$EndSCHEMATC
