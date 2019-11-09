// This is a Memory Cycle control signal generator
// This module generates signals on 2 or 3 pins according the memory cycle specs
// of the FM1808 NVRam chip from RamTron (now "Cypress Semi")

module top (
   output pin1_usb_dp,// USB pull-up enable, set low to disable
   output pin2_usb_dn,
   input  pin3_clk_16mhz,   // 16 MHz on-board clock
   input  pin7,    // Wait flag (i.e.) cycle extend
   input  pin8,    // Start cycle
   input  pin9,    // Read sequence
   input  pin10,   // Write sequence
   output pin11,   // /CE routes to pin 20 on FM1808
   output pin12,   // /WE routes to pin 27
   output pin13,    // /OE routes to pin 22
   output pin14_sdo,
   output pin15_sdi,
   output pin16_sck
   );

   wire[1:0] seq;

   SequenceGenerator sq (
      .Clk(pin3_clk_16mhz),
      .Delay(3'b011),
      .Extend(pin7),
      .StartCycle(pin8),
      .ReadSeq(pin9),
      .WriteSeq(pin10),
      .CE(pin11),
      .WE(pin12),
      .OE(pin13),
      .SeqState(seq)
      );

   assign pin1_usb_dp = 1'b0;
   assign pin2_usb_dn = 1'b0;

   assign pin14_sdo = seq[0];
   assign pin15_sdi = seq[1];
   assign pin16_sck = seq[2];

endmodule  // top
