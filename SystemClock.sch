EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 7 8
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
L Timer:NE555 U?
U 1 1 5DCE99AF
P 2850 2100
AR Path="/5DAF5C26/5DCE99AF" Ref="U?"  Part="1" 
AR Path="/5DCCE260/5DCE99AF" Ref="U?"  Part="1" 
F 0 "U?" H 2600 2450 50  0000 C CNN
F 1 "NE555" H 3050 2450 50  0000 C CNN
F 2 "" H 2850 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 2850 2100 50  0001 C CNN
	1    2850 2100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DCE99B5
P 2850 1000
AR Path="/5DAF5C26/5DCE99B5" Ref="#PWR?"  Part="1" 
AR Path="/5DCCE260/5DCE99B5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2850 850 50  0001 C CNN
F 1 "VCC" H 2867 1173 50  0000 C CNN
F 2 "" H 2850 1000 50  0001 C CNN
F 3 "" H 2850 1000 50  0001 C CNN
	1    2850 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DCE99BB
P 2850 3150
AR Path="/5DAF5C26/5DCE99BB" Ref="#PWR?"  Part="1" 
AR Path="/5DCCE260/5DCE99BB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2850 2900 50  0001 C CNN
F 1 "GND" H 2855 2977 50  0000 C CNN
F 2 "" H 2850 3150 50  0001 C CNN
F 3 "" H 2850 3150 50  0001 C CNN
	1    2850 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RB?
U 1 1 5DCE99C1
P 3500 1450
AR Path="/5DAF5C26/5DCE99C1" Ref="RB?"  Part="1" 
AR Path="/5DCCE260/5DCE99C1" Ref="RD?"  Part="1" 
F 0 "RD?" H 3430 1496 50  0000 R CNN
F 1 "1K" H 3430 1405 50  0000 R CNN
F 2 "" H 3500 1450 50  0001 C CNN
F 3 "~" H 3500 1450 50  0001 C CNN
	1    3500 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RT?
U 1 1 5DCE99C7
P 4300 2250
AR Path="/5DAF5C26/5DCE99C7" Ref="RT?"  Part="1" 
AR Path="/5DCCE260/5DCE99C7" Ref="RF?"  Part="1" 
F 0 "RF?" H 4230 2296 50  0000 R CNN
F 1 "1M" H 4230 2205 50  0000 R CNN
F 2 "" H 4300 2250 50  0001 C CNN
F 3 "~" H 4300 2250 50  0001 C CNN
	1    4300 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3550 2300 3350 2300
Wire Wire Line
	2350 2300 2250 2300
$Comp
L Device:CP1 C?
U 1 1 5DCE99DB
P 2000 2850
AR Path="/5DAF5C26/5DCE99DB" Ref="C?"  Part="1" 
AR Path="/5DCCE260/5DCE99DB" Ref="C?"  Part="1" 
F 0 "C?" H 2115 2896 50  0000 L CNN
F 1 "0.1uF" H 2115 2805 50  0000 L CNN
F 2 "" H 2000 2850 50  0001 C CNN
F 3 "~" H 2000 2850 50  0001 C CNN
	1    2000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1000 2850 1100
Connection ~ 2850 1100
Wire Wire Line
	2850 1100 2850 1700
Wire Wire Line
	2250 2300 2250 1100
Wire Wire Line
	2250 1100 2850 1100
Text Notes 3900 2450 0    50   ~ 0
Frequency
Text Notes 3700 1450 0    50   ~ 0
Duty
Text Notes 2000 3650 0    50   ~ 0
Frequency Range\n0.1uF = 300KHz to 700KHz\n0.47uF = 1KHz to 6KHz\n1uF = Low Freq
Text Notes 1300 3050 0    50   ~ 0
No Effect
$Comp
L Device:R R?
U 1 1 5DCEA93E
P 3850 2100
F 0 "R?" V 3750 2100 50  0000 C CNN
F 1 "1K" V 3950 2100 50  0000 C CNN
F 2 "" V 3780 2100 50  0001 C CNN
F 3 "~" H 3850 2100 50  0001 C CNN
	1    3850 2100
	0    1    1    0   
$EndComp
NoConn ~ 4300 2100
Wire Wire Line
	3350 2100 3500 2100
Wire Wire Line
	4000 2100 4150 2100
Wire Wire Line
	4150 2100 4150 2250
Wire Wire Line
	4300 2400 4300 2600
Wire Wire Line
	4300 2600 3550 2600
Wire Wire Line
	3550 2600 3550 2300
Wire Wire Line
	3500 2100 3500 1600
Connection ~ 3500 2100
Wire Wire Line
	3500 2100 3700 2100
Wire Wire Line
	3650 1450 3650 1100
Wire Wire Line
	2850 1100 3650 1100
Wire Wire Line
	3550 2600 2000 2600
Wire Wire Line
	2000 2600 2000 2700
Connection ~ 3550 2600
Wire Wire Line
	2000 2600 2000 1900
Connection ~ 2000 2600
Wire Wire Line
	2000 1900 2350 1900
Wire Wire Line
	1200 2100 1200 2700
Wire Wire Line
	1200 2100 2350 2100
Wire Wire Line
	1200 3000 1200 3150
Wire Wire Line
	1200 3150 2000 3150
Wire Wire Line
	2000 3150 2000 3000
Wire Wire Line
	2000 3150 2850 3150
Connection ~ 2000 3150
Wire Wire Line
	2850 2500 2850 3150
Connection ~ 2850 3150
$Comp
L 74xx:74LS153 U?
U 1 1 5DD17614
P 9400 7400
F 0 "U?" H 9150 6450 50  0000 C CNN
F 1 "74LS153" H 9600 6450 50  0000 C CNN
F 2 "" H 9400 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS153" H 9400 7400 50  0001 C CNN
	1    9400 7400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 5DD22119
P 7250 7300
F 0 "SW?" H 7250 7150 50  0000 C CNN
F 1 "Halt" H 7250 7050 50  0000 C CNN
F 2 "" H 7250 7300 50  0001 C CNN
F 3 "~" H 7250 7300 50  0001 C CNN
	1    7250 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DD225C7
P 7600 7900
F 0 "R?" H 7670 7946 50  0000 L CNN
F 1 "1K" H 7670 7855 50  0000 L CNN
F 2 "" V 7530 7900 50  0001 C CNN
F 3 "~" H 7600 7900 50  0001 C CNN
	1    7600 7900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DD22C7D
P 9400 6250
F 0 "#PWR?" H 9400 6100 50  0001 C CNN
F 1 "VCC" H 9417 6423 50  0000 C CNN
F 2 "" H 9400 6250 50  0001 C CNN
F 3 "" H 9400 6250 50  0001 C CNN
	1    9400 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 6250 9400 6400
$Comp
L power:VCC #PWR?
U 1 1 5DD29682
P 6900 6950
F 0 "#PWR?" H 6900 6800 50  0001 C CNN
F 1 "VCC" H 6917 7123 50  0000 C CNN
F 2 "" H 6900 6950 50  0001 C CNN
F 3 "" H 6900 6950 50  0001 C CNN
	1    6900 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 7450 7600 7300
Connection ~ 7600 7300
Wire Wire Line
	7600 7300 7450 7300
$Comp
L power:GND #PWR?
U 1 1 5DD2A278
P 9400 8650
F 0 "#PWR?" H 9400 8400 50  0001 C CNN
F 1 "GND" H 9405 8477 50  0000 C CNN
F 2 "" H 9400 8650 50  0001 C CNN
F 3 "" H 9400 8650 50  0001 C CNN
	1    9400 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 8500 9400 8600
Wire Wire Line
	7050 7300 6900 7300
Connection ~ 9400 8600
Wire Wire Line
	9400 8600 9400 8650
$Comp
L Switch:SW_DIP_x02 SW?
U 1 1 5DD2B3F7
P 8200 8200
F 0 "SW?" H 8200 8050 50  0000 C CNN
F 1 "Select" H 8200 8476 50  0000 C CNN
F 2 "" H 8200 8200 50  0001 C CNN
F 3 "~" H 8200 8200 50  0001 C CNN
	1    8200 8200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DD2EB67
P 8850 8400
F 0 "R?" H 8920 8446 50  0000 L CNN
F 1 "2K" H 8920 8355 50  0000 L CNN
F 2 "" V 8780 8400 50  0001 C CNN
F 3 "~" H 8850 8400 50  0001 C CNN
	1    8850 8400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DD2F0D1
P 8600 8400
F 0 "R?" H 8670 8446 50  0000 L CNN
F 1 "2K" H 8670 8355 50  0000 L CNN
F 2 "" V 8530 8400 50  0001 C CNN
F 3 "~" H 8600 8400 50  0001 C CNN
	1    8600 8400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 8100 8850 8100
Wire Wire Line
	8500 8200 8600 8200
Wire Wire Line
	8600 8200 8600 8250
Connection ~ 8600 8200
Wire Wire Line
	8600 8200 8900 8200
Wire Wire Line
	8850 8100 8850 8250
Connection ~ 8850 8100
Wire Wire Line
	8850 8100 8900 8100
Wire Wire Line
	8850 8550 8850 8600
Connection ~ 8850 8600
Wire Wire Line
	8850 8600 9400 8600
Wire Wire Line
	8600 8550 8600 8600
Connection ~ 8600 8600
Wire Wire Line
	8600 8600 8850 8600
Wire Wire Line
	6900 6950 6900 7300
Wire Wire Line
	7250 8100 7900 8100
Wire Wire Line
	7900 8200 7250 8200
Wire Wire Line
	7250 8200 7250 8150
Text GLabel 11150 6700 2    50   Output ~ 0
Clock
$Comp
L 74xx:74LS32 U?
U 1 1 5DD44A89
P 8350 7200
F 0 "U?" H 8350 6900 50  0000 C CNN
F 1 "74LS32" H 8350 7000 50  0000 C CNN
F 2 "" H 8350 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8350 7200 50  0001 C CNN
	1    8350 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 7200 8650 7200
Wire Wire Line
	8050 7100 7500 7100
Text GLabel 7500 7100 0    50   Input ~ 0
CPUHalt
Text Notes 7100 7650 0    50   ~ 0
Latching
Wire Wire Line
	7250 8150 6900 8150
Wire Wire Line
	6900 8150 6900 7300
Connection ~ 7250 8150
Wire Wire Line
	7250 8150 7250 8100
Connection ~ 6900 7300
$Comp
L 74xx:74LS161 U?
U 1 1 5DC21E7F
P 3100 6850
F 0 "U?" H 2900 7500 50  0000 C CNN
F 1 "74LS161" H 3300 7500 50  0000 C CNN
F 2 "" H 3100 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 3100 6850 50  0001 C CNN
	1    3100 6850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS153 U?
U 1 1 5DC2C25A
P 4650 7050
F 0 "U?" H 4400 6100 50  0000 C CNN
F 1 "74LS153" H 4850 6100 50  0000 C CNN
F 2 "" H 4650 7050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS153" H 4650 7050 50  0001 C CNN
	1    4650 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 6350 7500 6350
Wire Wire Line
	7500 6350 7500 7000
Wire Wire Line
	7500 7000 8900 7000
$Comp
L Switch:SW_DIP_x02 SW?
U 1 1 5DC458A0
P 3350 8150
F 0 "SW?" H 3350 8517 50  0000 C CNN
F 1 "Select" H 3350 8426 50  0000 C CNN
F 2 "" H 3350 8150 50  0001 C CNN
F 3 "~" H 3350 8150 50  0001 C CNN
	1    3350 8150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DC458A6
P 4150 8050
F 0 "R?" H 4220 8096 50  0000 L CNN
F 1 "2K" H 4220 8005 50  0000 L CNN
F 2 "" V 4080 8050 50  0001 C CNN
F 3 "~" H 4150 8050 50  0001 C CNN
	1    4150 8050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DC458AC
P 3900 8050
F 0 "R?" H 3970 8096 50  0000 L CNN
F 1 "2K" H 3970 8005 50  0000 L CNN
F 2 "" V 3830 8050 50  0001 C CNN
F 3 "~" H 3900 8050 50  0001 C CNN
	1    3900 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 7850 3900 7900
Connection ~ 3900 7850
Wire Wire Line
	3900 7850 4200 7850
Wire Wire Line
	4150 7750 4150 7900
Connection ~ 4150 7750
Wire Wire Line
	4150 7750 4200 7750
Wire Wire Line
	4650 8150 4650 8350
Wire Wire Line
	4650 8350 4150 8350
Wire Wire Line
	4150 8350 4150 8200
Wire Wire Line
	3900 8200 3900 8350
Wire Wire Line
	3900 8350 4150 8350
Connection ~ 4150 8350
$Comp
L power:VCC #PWR?
U 1 1 5DC4BAA6
P 4650 5950
F 0 "#PWR?" H 4650 5800 50  0001 C CNN
F 1 "VCC" H 4667 6123 50  0000 C CNN
F 2 "" H 4650 5950 50  0001 C CNN
F 3 "" H 4650 5950 50  0001 C CNN
	1    4650 5950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DC4CB99
P 3100 5900
F 0 "#PWR?" H 3100 5750 50  0001 C CNN
F 1 "VCC" H 3117 6073 50  0000 C CNN
F 2 "" H 3100 5900 50  0001 C CNN
F 3 "" H 3100 5900 50  0001 C CNN
	1    3100 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 7850 3900 7850
Wire Wire Line
	3350 7850 3350 7750
Wire Wire Line
	3350 7750 4150 7750
$Comp
L power:VCC #PWR?
U 1 1 5DC57A8D
P 2950 8450
F 0 "#PWR?" H 2950 8300 50  0001 C CNN
F 1 "VCC" H 2967 8623 50  0000 C CNN
F 2 "" H 2950 8450 50  0001 C CNN
F 3 "" H 2950 8450 50  0001 C CNN
	1    2950 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 8450 2950 8550
Wire Wire Line
	2950 8550 3400 8550
Wire Wire Line
	3400 8550 3400 8450
Wire Wire Line
	3400 8450 3350 8450
Wire Wire Line
	3400 8450 3450 8450
Connection ~ 3400 8450
Wire Wire Line
	3600 6350 4150 6350
Wire Wire Line
	3600 6450 4150 6450
Wire Wire Line
	3600 6550 4150 6550
Wire Wire Line
	3600 6650 4150 6650
Wire Wire Line
	4150 6850 3700 6850
Wire Wire Line
	3700 6850 3700 7650
Wire Wire Line
	3700 7650 3100 7650
$Comp
L power:GND #PWR?
U 1 1 5DC60240
P 3100 7650
F 0 "#PWR?" H 3100 7400 50  0001 C CNN
F 1 "GND" H 3105 7477 50  0000 C CNN
F 2 "" H 3100 7650 50  0001 C CNN
F 3 "" H 3100 7650 50  0001 C CNN
	1    3100 7650
	1    0    0    -1  
$EndComp
Connection ~ 3100 7650
Wire Wire Line
	3100 5900 3100 5950
Wire Wire Line
	4650 5950 4650 6050
Wire Wire Line
	2600 7150 2350 7150
Text Notes 2350 7150 0    50   ~ 0
4MHz
Text Notes 3650 6350 0    50   ~ 0
2MHz
Text Notes 3650 6450 0    50   ~ 0
1MHz
Text Notes 3650 6550 0    50   ~ 0
0.5MHz
Text Notes 3650 6650 0    50   ~ 0
0.25MHz
Text Notes 8600 6900 0    50   ~ 0
4MHz
Wire Wire Line
	5150 1900 5150 6200
Wire Wire Line
	5150 6200 7650 6200
Wire Wire Line
	7650 6200 7650 6800
Wire Wire Line
	7650 6800 8900 6800
Wire Wire Line
	3350 1900 5150 1900
$Comp
L Timer:NE555 U?
U 1 1 5DC78EDC
P 13900 2100
AR Path="/5DAF5C26/5DC78EDC" Ref="U?"  Part="1" 
AR Path="/5DCCE260/5DC78EDC" Ref="U?"  Part="1" 
F 0 "U?" H 13650 2450 50  0000 C CNN
F 1 "NE555" H 14100 2450 50  0000 C CNN
F 2 "" H 13900 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 13900 2100 50  0001 C CNN
	1    13900 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DC798AC
P 12950 1500
F 0 "R?" V 12850 1500 50  0000 C CNN
F 1 "1K" V 13050 1500 50  0000 C CNN
F 2 "" V 12880 1500 50  0001 C CNN
F 3 "~" H 12950 1500 50  0001 C CNN
	1    12950 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5DC7F0E5
P 14550 1500
F 0 "R?" V 14450 1500 50  0000 C CNN
F 1 "1M" V 14650 1500 50  0000 C CNN
F 2 "" V 14480 1500 50  0001 C CNN
F 3 "~" H 14550 1500 50  0001 C CNN
	1    14550 1500
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DC7F35F
P 13900 1250
AR Path="/5DAF5C26/5DC7F35F" Ref="#PWR?"  Part="1" 
AR Path="/5DCCE260/5DC7F35F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 13900 1100 50  0001 C CNN
F 1 "VCC" H 13917 1423 50  0000 C CNN
F 2 "" H 13900 1250 50  0001 C CNN
F 3 "" H 13900 1250 50  0001 C CNN
	1    13900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 1350 12950 1250
Wire Wire Line
	12950 1250 13200 1250
Wire Wire Line
	13900 1250 14550 1250
Wire Wire Line
	14550 1250 14550 1350
Connection ~ 13900 1250
Wire Wire Line
	13900 1250 13900 1700
Wire Wire Line
	14400 2100 14550 2100
Wire Wire Line
	14550 2100 14550 1650
Wire Wire Line
	12950 1650 12950 1900
Wire Wire Line
	12950 1900 13400 1900
Wire Wire Line
	13200 1250 13200 2300
Wire Wire Line
	13200 2300 13400 2300
Connection ~ 13200 1250
Wire Wire Line
	13200 1250 13900 1250
$Comp
L Device:C C?
U 1 1 5DC91BC9
P 13100 2750
F 0 "C?" H 13215 2796 50  0000 L CNN
F 1 "0.01uF" H 13215 2705 50  0000 L CNN
F 2 "" H 13138 2600 50  0001 C CNN
F 3 "~" H 13100 2750 50  0001 C CNN
	1    13100 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DC92D60
P 1200 2850
F 0 "C?" H 1315 2896 50  0000 L CNN
F 1 "0.01uF" H 1315 2805 50  0000 L CNN
F 2 "" H 1238 2700 50  0001 C CNN
F 3 "~" H 1200 2850 50  0001 C CNN
	1    1200 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DC97C6E
P 14550 2750
F 0 "C?" H 14665 2796 50  0000 L CNN
F 1 "0.2uF" H 14665 2705 50  0000 L CNN
F 2 "" H 14588 2600 50  0001 C CNN
F 3 "~" H 14550 2750 50  0001 C CNN
	1    14550 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 2100 14550 2300
Connection ~ 14550 2100
Wire Wire Line
	14400 2300 14550 2300
Connection ~ 14550 2300
Wire Wire Line
	14550 2300 14550 2600
Wire Wire Line
	13400 2100 13100 2100
Wire Wire Line
	13100 2100 13100 2600
$Comp
L power:GND #PWR?
U 1 1 5DCA1E02
P 13900 2900
AR Path="/5DAF5C26/5DCA1E02" Ref="#PWR?"  Part="1" 
AR Path="/5DCCE260/5DCA1E02" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 13900 2650 50  0001 C CNN
F 1 "GND" H 13905 2727 50  0000 C CNN
F 2 "" H 13900 2900 50  0001 C CNN
F 3 "" H 13900 2900 50  0001 C CNN
	1    13900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	13900 2500 13900 2900
Wire Wire Line
	14550 2900 13900 2900
Connection ~ 13900 2900
Wire Wire Line
	13900 2900 13100 2900
$Comp
L Switch:SW_Push SW?
U 1 1 5DCA9465
P 12550 1900
F 0 "SW?" H 12550 2185 50  0000 C CNN
F 1 "SW_Push" H 12550 2094 50  0000 C CNN
F 2 "" H 12550 2100 50  0001 C CNN
F 3 "~" H 12550 2100 50  0001 C CNN
	1    12550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 1900 12750 1900
Connection ~ 12950 1900
Wire Wire Line
	12350 1900 12350 2900
Wire Wire Line
	12350 2900 13100 2900
Connection ~ 13100 2900
Wire Wire Line
	14400 1900 15000 1900
Text Notes 14750 1850 0    50   ~ 0
Pulse
Text Notes 4050 1850 0    50   ~ 0
Low Freq Clock
$Comp
L Oscillator:ASCO X?
U 1 1 5DCF11E3
P 1900 7150
AR Path="/5DAB0D48/5DCF11E3" Ref="X?"  Part="1" 
AR Path="/5F293828/5DCF11E3" Ref="X?"  Part="1" 
AR Path="/5DCCE260/5DCF11E3" Ref="X?"  Part="1" 
F 0 "X?" H 1650 7400 50  0000 L CNN
F 1 "4 MHz" H 2000 7400 50  0000 L CNN
F 2 "Oscillator:Oscillator_SMD_Abracon_ASCO-4Pin_1.6x1.2mm" H 2000 6800 50  0001 C CNN
F 3 "https://abracon.com/Oscillators/ASCO.pdf" H 1675 7275 50  0001 C CNN
	1    1900 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 7150 2350 5350
Wire Wire Line
	2350 5350 8250 5350
Wire Wire Line
	8250 5350 8250 6900
Wire Wire Line
	8250 6900 8900 6900
Connection ~ 2350 7150
Wire Wire Line
	2350 7150 2300 7150
Wire Wire Line
	3100 7650 1900 7650
Wire Wire Line
	1900 7650 1900 7450
Wire Wire Line
	1900 6850 1900 5950
Wire Wire Line
	1900 5950 3100 5950
Connection ~ 3100 5950
Wire Wire Line
	3100 5950 3100 6050
NoConn ~ 1500 7150
Text Notes 6400 8650 0    50   ~ 0
00 = Pulse\n01 = Low Frequency Clock\n10 = 4 MHz clock\n11 = 0.25-2 MHz clock
Text Notes 6050 7400 0    50   ~ 0
Activate Halt before\nchanging Selector
$Comp
L Device:LED D?
U 1 1 5DD64D7D
P 7600 7600
AR Path="/5DAB0D48/5DD64D7D" Ref="D?"  Part="1" 
AR Path="/5F293828/5DD64D7D" Ref="D?"  Part="1" 
AR Path="/5DCCE260/5DD64D7D" Ref="D?"  Part="1" 
F 0 "D?" V 7600 7550 50  0000 R CNN
F 1 "Halt Activated" V 7450 7500 50  0000 R CNN
F 2 "" H 7600 7600 50  0001 C CNN
F 3 "~" H 7600 7600 50  0001 C CNN
	1    7600 7600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 8050 7600 8600
$Comp
L Device:R R?
U 1 1 5DD73BD7
P 7850 7450
F 0 "R?" H 7920 7496 50  0000 L CNN
F 1 "2K" H 7920 7405 50  0000 L CNN
F 2 "" V 7780 7450 50  0001 C CNN
F 3 "~" H 7850 7450 50  0001 C CNN
	1    7850 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 8600 7850 8600
Connection ~ 7850 7300
Wire Wire Line
	7850 7300 7600 7300
Wire Wire Line
	7850 7300 8050 7300
Wire Wire Line
	7850 7600 7850 8600
Connection ~ 7850 8600
Wire Wire Line
	7850 8600 8600 8600
$Comp
L 74xx:74LS00 U?
U 1 1 5DC41113
P 7350 1850
F 0 "U?" H 7350 2175 50  0000 C CNN
F 1 "74LS00" H 7350 2084 50  0000 C CNN
F 2 "" H 7350 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7350 1850 50  0001 C CNN
	1    7350 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 2 1 5DC42215
P 7350 2600
F 0 "U?" H 7350 2300 50  0000 C CNN
F 1 "74LS00" H 7350 2400 50  0000 C CNN
F 2 "" H 7350 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7350 2600 50  0001 C CNN
	2    7350 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DC4397C
P 6750 1450
F 0 "R?" V 6650 1450 50  0000 C CNN
F 1 "1K" V 6850 1450 50  0000 C CNN
F 2 "" V 6680 1450 50  0001 C CNN
F 3 "~" H 6750 1450 50  0001 C CNN
	1    6750 1450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5DC442D0
P 6750 3050
F 0 "R?" V 6650 3050 50  0000 C CNN
F 1 "1K" V 6850 3050 50  0000 C CNN
F 2 "" V 6680 3050 50  0001 C CNN
F 3 "~" H 6750 3050 50  0001 C CNN
	1    6750 3050
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPDT SW?
U 1 1 5DC44DC9
P 6550 2200
F 0 "SW?" H 6550 2485 50  0000 C CNN
F 1 "SW_SPDT" H 6550 2394 50  0000 C CNN
F 2 "" H 6550 2200 50  0001 C CNN
F 3 "~" H 6550 2200 50  0001 C CNN
	1    6550 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DC454E9
P 6350 2500
AR Path="/5DAF5C26/5DC454E9" Ref="#PWR?"  Part="1" 
AR Path="/5DCCE260/5DC454E9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6350 2250 50  0001 C CNN
F 1 "GND" H 6355 2327 50  0000 C CNN
F 2 "" H 6350 2500 50  0001 C CNN
F 3 "" H 6350 2500 50  0001 C CNN
	1    6350 2500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DC459FF
P 6750 1150
AR Path="/5DAF5C26/5DC459FF" Ref="#PWR?"  Part="1" 
AR Path="/5DCCE260/5DC459FF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6750 1000 50  0001 C CNN
F 1 "VCC" H 6767 1323 50  0000 C CNN
F 2 "" H 6750 1150 50  0001 C CNN
F 3 "" H 6750 1150 50  0001 C CNN
	1    6750 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DC45F19
P 6750 3400
AR Path="/5DAF5C26/5DC45F19" Ref="#PWR?"  Part="1" 
AR Path="/5DCCE260/5DC45F19" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6750 3250 50  0001 C CNN
F 1 "VCC" H 6767 3573 50  0000 C CNN
F 2 "" H 6750 3400 50  0001 C CNN
F 3 "" H 6750 3400 50  0001 C CNN
	1    6750 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6350 2200 6350 2500
Wire Wire Line
	6750 2100 6750 1750
Wire Wire Line
	7050 1750 6750 1750
Connection ~ 6750 1750
Wire Wire Line
	6750 1750 6750 1600
Wire Wire Line
	6750 2300 6750 2700
Wire Wire Line
	6750 3200 6750 3400
Wire Wire Line
	7050 2700 6750 2700
Connection ~ 6750 2700
Wire Wire Line
	6750 2700 6750 2900
Wire Wire Line
	7050 1950 7050 2200
Wire Wire Line
	7050 2200 7800 2200
Wire Wire Line
	7800 2200 7800 2600
Wire Wire Line
	7800 2600 7650 2600
Wire Wire Line
	7050 2500 7050 2300
Wire Wire Line
	7050 2300 7900 2300
Wire Wire Line
	7900 2300 7900 1850
Wire Wire Line
	7900 1850 7650 1850
Connection ~ 7900 1850
Wire Wire Line
	8650 6700 8900 6700
$Comp
L 74xx:74LS32 U?
U 2 1 5DC87B35
P 10650 6700
F 0 "U?" H 10650 7025 50  0000 C CNN
F 1 "74LS32" H 10650 6934 50  0000 C CNN
F 2 "" H 10650 6700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 10650 6700 50  0001 C CNN
	2    10650 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5DC8FF2A
P 10150 7100
AR Path="/5DAB0D48/5DC8FF2A" Ref="D?"  Part="1" 
AR Path="/5F293828/5DC8FF2A" Ref="D?"  Part="1" 
AR Path="/5DCCE260/5DC8FF2A" Ref="D?"  Part="1" 
F 0 "D?" V 10150 7050 50  0000 R CNN
F 1 "Clock LED" V 10000 7000 50  0000 R CNN
F 2 "" H 10150 7100 50  0001 C CNN
F 3 "~" H 10150 7100 50  0001 C CNN
	1    10150 7100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5DC90F9C
P 10150 7650
F 0 "R?" H 10220 7696 50  0000 L CNN
F 1 "1K" H 10220 7605 50  0000 L CNN
F 2 "" V 10080 7650 50  0001 C CNN
F 3 "~" H 10150 7650 50  0001 C CNN
	1    10150 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 6600 10250 6600
Wire Wire Line
	10250 6600 10250 6700
Wire Wire Line
	10250 6800 10350 6800
Wire Wire Line
	10250 6700 10150 6700
Connection ~ 10250 6700
Wire Wire Line
	10250 6700 10250 6800
Wire Wire Line
	10150 6700 10150 6950
Connection ~ 10150 6700
Wire Wire Line
	10150 6700 9900 6700
Wire Wire Line
	10150 7250 10150 7500
Wire Wire Line
	9400 8600 10150 8600
Wire Wire Line
	10150 8600 10150 7800
Wire Wire Line
	10950 6700 11150 6700
Wire Wire Line
	7900 1850 8650 1850
Wire Wire Line
	8650 1850 8650 6700
Text Notes 8250 1800 0    50   ~ 0
Pulse
Wire Wire Line
	6750 1150 6750 1300
Text Notes 13000 3050 0    50   ~ 0
10nF
Text Notes 14650 2950 0    50   ~ 0
200nF
$Comp
L 74xx:74LS04 U?
U 1 1 5DC76C75
P 12450 4200
AR Path="/5DAF5C26/5DC76C75" Ref="U?"  Part="1" 
AR Path="/5DCCE260/5DC76C75" Ref="U?"  Part="1" 
F 0 "U?" H 12450 4517 50  0000 C CNN
F 1 "74LS04" H 12450 4426 50  0000 C CNN
F 2 "" H 12450 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 12450 4200 50  0001 C CNN
	1    12450 4200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 1 1 5DC76C7B
P 14950 3750
AR Path="/5DAF5C26/5DC76C7B" Ref="U?"  Part="1" 
AR Path="/5DCCE260/5DC76C7B" Ref="U?"  Part="1" 
F 0 "U?" H 14950 4075 50  0000 C CNN
F 1 "74LS08" H 14950 3984 50  0000 C CNN
F 2 "" H 14950 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 14950 3750 50  0001 C CNN
	1    14950 3750
	1    0    0    -1  
$EndComp
Text GLabel 11900 3650 0    50   Input ~ 0
Pulse
$Comp
L Device:R R?
U 1 1 5DC76C82
P 13000 4200
AR Path="/5DAF5C26/5DC76C82" Ref="R?"  Part="1" 
AR Path="/5DCCE260/5DC76C82" Ref="R?"  Part="1" 
F 0 "R?" H 13070 4246 50  0000 L CNN
F 1 "1K" H 13070 4155 50  0000 L CNN
F 2 "" V 12930 4200 50  0001 C CNN
F 3 "~" H 13000 4200 50  0001 C CNN
	1    13000 4200
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5DC76C88
P 13300 4350
AR Path="/5DAF5C26/5DC76C88" Ref="C?"  Part="1" 
AR Path="/5DCCE260/5DC76C88" Ref="C?"  Part="1" 
F 0 "C?" H 13415 4396 50  0000 L CNN
F 1 "1uF" H 13415 4305 50  0000 L CNN
F 2 "" H 13338 4200 50  0001 C CNN
F 3 "~" H 13300 4350 50  0001 C CNN
	1    13300 4350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 1 1 5DC76C8E
P 13950 4200
AR Path="/5DAF5C26/5DC76C8E" Ref="U?"  Part="1" 
AR Path="/5DCCE260/5DC76C8E" Ref="U?"  Part="1" 
F 0 "U?" H 13950 4517 50  0000 C CNN
F 1 "74LS04" H 13950 4426 50  0000 C CNN
F 2 "" H 13950 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 13950 4200 50  0001 C CNN
	1    13950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	14250 4200 14450 4200
Wire Wire Line
	14450 4200 14450 3850
Wire Wire Line
	14450 3850 14650 3850
Wire Wire Line
	12750 4200 12850 4200
Wire Wire Line
	13150 4200 13300 4200
Connection ~ 13300 4200
Wire Wire Line
	13300 4200 13650 4200
Wire Wire Line
	11900 3650 12050 3650
Wire Wire Line
	12150 4200 12050 4200
Wire Wire Line
	12050 4200 12050 3650
Connection ~ 12050 3650
Wire Wire Line
	12050 3650 14650 3650
$Comp
L power:GND #PWR?
U 1 1 5DC76CA0
P 13300 4600
AR Path="/5DAF5C26/5DC76CA0" Ref="#PWR?"  Part="1" 
AR Path="/5DCCE260/5DC76CA0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 13300 4350 50  0001 C CNN
F 1 "GND" H 13305 4427 50  0000 C CNN
F 2 "" H 13300 4600 50  0001 C CNN
F 3 "" H 13300 4600 50  0001 C CNN
	1    13300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13300 4500 13300 4600
$Comp
L 74xx:74LS240 U?
U 1 1 5DCC2803
P 14100 6050
F 0 "U?" H 13850 6700 50  0000 C CNN
F 1 "74LS240" H 14300 6700 50  0000 C CNN
F 2 "" H 14100 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS240" H 14100 6050 50  0001 C CNN
	1    14100 6050
	1    0    0    -1  
$EndComp
Text GLabel 12200 5550 0    50   Input ~ 0
Pulse
$Comp
L Device:R R?
U 1 1 5DCC280A
P 12900 5900
F 0 "R?" H 12970 5946 50  0000 L CNN
F 1 "680" H 12970 5855 50  0000 L CNN
F 2 "" V 12830 5900 50  0001 C CNN
F 3 "~" H 12900 5900 50  0001 C CNN
	1    12900 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DCC2810
P 12550 5550
F 0 "C?" H 12665 5596 50  0000 L CNN
F 1 "0.1uF" H 12665 5505 50  0000 L CNN
F 2 "" H 12588 5400 50  0001 C CNN
F 3 "~" H 12550 5550 50  0001 C CNN
	1    12550 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	14600 5550 14850 5550
$Comp
L power:GND #PWR?
U 1 1 5DCC2817
P 14100 7050
F 0 "#PWR?" H 14100 6800 50  0001 C CNN
F 1 "GND" H 14105 6877 50  0000 C CNN
F 2 "" H 14100 7050 50  0001 C CNN
F 3 "" H 14100 7050 50  0001 C CNN
	1    14100 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	14100 7050 14100 6950
Wire Wire Line
	13600 6450 13500 6450
Wire Wire Line
	13500 6450 13500 6500
Wire Wire Line
	13500 6550 13600 6550
Wire Wire Line
	13500 6500 13400 6500
Wire Wire Line
	13400 6500 13400 6950
Connection ~ 13500 6500
Wire Wire Line
	13500 6500 13500 6550
Connection ~ 14100 6950
Wire Wire Line
	14100 6950 14100 6850
Wire Wire Line
	13400 6950 14100 6950
Wire Wire Line
	12700 5550 12900 5550
Wire Wire Line
	12200 5550 12400 5550
Wire Wire Line
	13400 6500 12900 6500
Connection ~ 13400 6500
$Comp
L Simulation_SPICE:DIODE D?
U 1 1 5DCC282E
P 13300 5550
F 0 "D?" H 13300 5350 50  0000 C CNN
F 1 "1N4148" H 13300 5450 50  0000 C CNN
F 2 "" H 13300 5550 50  0001 C CNN
F 3 "~" H 13300 5550 50  0001 C CNN
F 4 "Y" H 13300 5550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 13300 5550 50  0001 L CNN "Spice_Primitive"
	1    13300 5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	12900 5750 12900 5550
Wire Wire Line
	12900 6050 12900 6500
Wire Wire Line
	12900 5550 13150 5550
Wire Wire Line
	13450 5550 13600 5550
Connection ~ 12900 5550
Wire Wire Line
	14850 5550 14850 5200
Wire Wire Line
	14850 5200 13500 5200
Wire Wire Line
	13500 5200 13500 5650
Wire Wire Line
	13500 5650 13600 5650
Wire Wire Line
	14600 5650 15300 5650
Text GLabel 15300 5650 2    50   Output ~ 0
Pulse
$Comp
L Device:Crystal Y?
U 1 1 5DEB97FE
P 3750 10300
F 0 "Y?" H 3750 10568 50  0000 C CNN
F 1 "Crystal 4MHz" H 3750 10477 50  0000 C CNN
F 2 "" H 3750 10300 50  0001 C CNN
F 3 "~" H 3750 10300 50  0001 C CNN
	1    3750 10300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS14 U?
U 1 1 5DEBA9FF
P 3750 9700
F 0 "U?" H 3750 10017 50  0000 C CNN
F 1 "74LS14" H 3750 9926 50  0000 C CNN
F 2 "" H 3750 9700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 3750 9700 50  0001 C CNN
	1    3750 9700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DEBC75F
P 3300 10650
F 0 "C?" H 3415 10696 50  0000 L CNN
F 1 "22pF" H 3415 10605 50  0000 L CNN
F 2 "" H 3338 10500 50  0001 C CNN
F 3 "~" H 3300 10650 50  0001 C CNN
	1    3300 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DEBDB5E
P 4150 10650
F 0 "C?" H 4265 10696 50  0000 L CNN
F 1 "22pF" H 4265 10605 50  0000 L CNN
F 2 "" H 4188 10500 50  0001 C CNN
F 3 "~" H 4150 10650 50  0001 C CNN
	1    4150 10650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DEBE352
P 3750 10800
F 0 "#PWR?" H 3750 10550 50  0001 C CNN
F 1 "GND" H 3755 10627 50  0000 C CNN
F 2 "" H 3750 10800 50  0001 C CNN
F 3 "" H 3750 10800 50  0001 C CNN
	1    3750 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DEC0575
P 4500 9700
F 0 "R?" H 4570 9746 50  0000 L CNN
F 1 "220" V 4400 9600 50  0000 L CNN
F 2 "" V 4430 9700 50  0001 C CNN
F 3 "~" H 4500 9700 50  0001 C CNN
	1    4500 9700
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS14 U?
U 2 1 5DEC0EEE
P 5150 9700
F 0 "U?" H 5150 10017 50  0000 C CNN
F 1 "74LS14" H 5150 9926 50  0000 C CNN
F 2 "" H 5150 9700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS14" H 5150 9700 50  0001 C CNN
	2    5150 9700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5DEC1640
P 5800 9700
F 0 "R?" H 5870 9746 50  0000 L CNN
F 1 "100" V 5700 9600 50  0000 L CNN
F 2 "" V 5730 9700 50  0001 C CNN
F 3 "~" H 5800 9700 50  0001 C CNN
	1    5800 9700
	0    1    1    0   
$EndComp
Text GLabel 6200 9700 2    50   Output ~ 0
Clock
Wire Wire Line
	3450 9700 3300 9700
Wire Wire Line
	3300 9700 3300 10300
Wire Wire Line
	4050 9700 4150 9700
Wire Wire Line
	4650 9700 4850 9700
Wire Wire Line
	5450 9700 5650 9700
Wire Wire Line
	5950 9700 6200 9700
Wire Wire Line
	4150 10500 4150 10300
Connection ~ 4150 9700
Wire Wire Line
	4150 9700 4350 9700
Wire Wire Line
	3900 10300 4150 10300
Connection ~ 4150 10300
Wire Wire Line
	4150 10300 4150 9700
Wire Wire Line
	3600 10300 3300 10300
Connection ~ 3300 10300
Wire Wire Line
	3300 10300 3300 10500
Wire Wire Line
	3300 10800 3750 10800
Connection ~ 3750 10800
Wire Wire Line
	3750 10800 4150 10800
$Comp
L Device:R R?
U 1 1 5DF04F14
P 3750 9050
F 0 "R?" H 3820 9096 50  0000 L CNN
F 1 "100K" V 3650 8950 50  0000 L CNN
F 2 "" V 3680 9050 50  0001 C CNN
F 3 "~" H 3750 9050 50  0001 C CNN
	1    3750 9050
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 9050 4150 9050
Wire Wire Line
	4150 9050 4150 9700
Wire Wire Line
	3600 9050 3300 9050
Wire Wire Line
	3300 9050 3300 9700
Connection ~ 3300 9700
$EndSCHEMATC
