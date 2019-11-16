# MC6809P
This repo contains the on going work of building a simple *Basic 6809 CPU Single Board Computer*. I'm have a higher priority project that superceeds this one so things will go somewhat slowly.

* The first task was build a simple NVRam programmer--**done**.
* The next task is to test the 4 CPUs to make sure they *free run*.
* Once I know that I have a functioning CPU I can build a more feature capable programmer.
* Then I can build a simple breadboard test with minimal chips.
* **TODO** add more items.

## RamTron NVRam programmer
An early experimental version of the programmer is located under the two following folders:
* **src/NVRamProgrammer**: contains the [Go](https://golang.org/) frontend and controller program. It controls both the older [TinyFPGA-B2](https://tinyfpga.com/) and [Adafruit USB-to-GPIO](https://www.adafruit.com/product/2264). First it sends the Address and Data to GPIO then it sends signals to the FPGA to complete the memory cycle.
* **src/TinyFPGAB2**: contains the Verilog code for generating NVRam control signals.

It was simply meant to test if I could program the NV Ram. The Non-Volital Ram is an old technology originally designed by RamTron which has since be bought by Cypress Semi.

This is an image of the layout:

![NVRam Programmer](docs/NVRamProg1.JPG).

Ignore the *TTGO T-Display* microcontroller in the upper left, it was used for something else. Also, some of the Logic analyser probes are still hooked up in the upper right.

The *grey* wires are the data, the *green* are the address, the *yellow* are the signals to the FPGA and the *white/red/yellow* are the control for the NVRam.

You only need to connect a powered USB cable to the FPGA once it is programmed. The GPIO needs to be connected to a computer so the Go program can control it.