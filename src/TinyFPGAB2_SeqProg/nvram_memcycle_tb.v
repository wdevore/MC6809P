// --------------------------------------------------------------------------
// Test bench
// --------------------------------------------------------------------------

`timescale 1ns/10ps

`define PERIOD 31.25  // 16MHz

module NVRamMemCycle_tb;
   integer i;

   reg clk;
   reg startCycle = 1'b0;
   reg readSeq = 1'b0;
   reg writeSeq = 1'b0;
   reg extend = 1'b0;
   wire CE, WE, OE;

   wire[1:0] seqState;

   initial begin
      $dumpfile("nvram_memcycle_tb.vcd");  // waveforms file
      
      $dumpvars;  // save waveforms
      
      $display("%d %m: Starting testbench simulation...", $stime);

      // $monitor("%d %m: MONITOR - clk = %d, CE = %d, WE = %d, RE = %d", $stime, clk, CE, WE, OE);

      clk = 1;
      startCycle = 1'b0;
      // sq.cycleState = 2'b00;
      readSeq = 1'b0;
      writeSeq = 1'b0;

      $display("%d %m: -------------------------------", $stime);
      $display("%d %m: Check controls are in-active.", $stime);
      $display("%d %m: -------------------------------", $stime);
      #100;

      // ----------------------------------------------------------
      // Run the clock to make sure control signals are in-active.
      // ----------------------------------------------------------
      for (i=0; i <= 20; i=i+1) begin
         clk = ~clk;

         #`PERIOD;

         if (CE == 0) begin
            $display("%d %m: ERROR #2 - /CE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
         if (WE == 0) begin
            $display("%d %m: ERROR #2 - /WE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
         if (OE == 0) begin
            $display("%d %m: ERROR #2 - /OE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
      end

      $display("%d %m: -------------------------------", $stime);
      $display("%d %m: Cycle with no sequence selected.", $stime);
      $display("%d %m: -------------------------------", $stime);
      #100;
      // ----------------------------------------------------------
      // Start a cycle with no sequence selected, then end cycle.
      // ----------------------------------------------------------
      startCycle = 1'b1;
      for (i=0; i <= 20; i=i+1) begin
         clk = ~clk;

         #`PERIOD;

         if (CE == 0) begin
            $display("%d %m: ERROR #2 - /CE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
         if (WE == 0) begin
            $display("%d %m: ERROR #2 - /WE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
         if (OE == 0) begin
            $display("%d %m: ERROR #2 - /OE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
      end

      $display("%d %m: Ending cycle.", $stime);
      // End cycle
      startCycle = 1'b0;
      for (i=0; i <= 20; i=i+1) begin
         clk = ~clk;

         #`PERIOD;

         if (CE == 0) begin
            $display("%d %m: ERROR #2 - /CE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
         if (WE == 0) begin
            $display("%d %m: ERROR #2 - /WE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
         if (OE == 0) begin
            $display("%d %m: ERROR #2 - /OE should be in-active = High, got: (%d).", $stime, WE);
            $finish;
         end
      end
      
      $display("%d %m: -------------------------------", $stime);
      $display("%d %m: Read sequence.", $stime);
      $display("%d %m: -------------------------------", $stime);
      #100;

      // ----------------------------------------------------------
      // Run a cycle with a read sequence selected.
      // ----------------------------------------------------------
      startCycle = 1'b1;
      readSeq = 1'b1;

      for (i=0; i <= 20; i=i+1) begin
         clk = ~clk;
         #`PERIOD;
      end
      startCycle = 1'b0;
      for (i=0; i <= 20; i=i+1) begin
         clk = ~clk;
         #`PERIOD;
      end

      $display("%d %m: -------------------------------", $stime);
      $display("%d %m: Write sequence.", $stime);
      $display("%d %m: -------------------------------", $stime);
      #100;

      // ----------------------------------------------------------
      // Run a cycle with a read sequence selected.
      // ----------------------------------------------------------
      startCycle = 1'b1;
      readSeq = 1'b0;
      writeSeq = 1'b1;
      for (i=0; i <= 20; i=i+1) begin
         clk = ~clk;
         #`PERIOD;
      end
      startCycle = 1'b0;
      for (i=0; i <= 20; i=i+1) begin
         clk = ~clk;
         #`PERIOD;
      end

      $display("%d %m: -------------------------------", $stime);
      $display("%d %m: Read sequence with Extend.", $stime);
      $display("%d %m: -------------------------------", $stime);
      #100;

      // ----------------------------------------------------------
      // Run a cycle with a read sequence selected.
      // ----------------------------------------------------------
      writeSeq = 1'b0;
      extend = 1'b1;
      for (i=0; i <= 10; i=i+1) begin
         clk = ~clk;
         #`PERIOD;
      end

      startCycle = 1'b1;
      readSeq = 1'b1;

      for (i=0; i <= 30; i=i+1) begin
         clk = ~clk;
         #`PERIOD;
      end

      extend = 1'b0;
      for (i=0; i <= 10; i=i+1) begin
         clk = ~clk;
         #`PERIOD;
      end

      startCycle = 1'b0;
      readSeq = 1'b0;
      for (i=0; i <= 20; i=i+1) begin
         clk = ~clk;
         #`PERIOD;
      end

      #100 $display("%d %m: Testbench simulation PASSED.", $stime);
      
      $finish;  // end simulation
   end

   SequenceGenerator sq (
      .Clk(clk),
      .Delay(3'b011),
      .Extend(extend),
      .StartCycle(startCycle),
      .ReadSeq(readSeq),
      .WriteSeq(writeSeq),
      .CE(CE),
      .WE(WE),
      .OE(OE),
      .SeqState(seqState)
      );

endmodule

