// Max cycle time is       |----- 2us ----------|
//       /CE _____/''''''''\____________________/''''''''\________

// Read cycle:
// /CE xxxxx/''''''''\____________________/''''''''\________
// ADR xxxxxxx0101010101010xxxxxxxxxxxxxxxxxxx
// /OE ''''''''''''''''''\______________________/'''''''''''

// Write cycle: CE controlled (i.e. WE occurs BEFORE CE)
// /CE xxxxx/''''''''\____________________/''''''''\________
// ADR xxxxxxx0101010101010xxxxxxxxxxxxxxxxxxx
// /WE ''''''''''\_____________________________/'''''''''''
// /OE '''''''''''''''''''''''''''''''''''''''''''''''''''''
// DAT xxxxxxxxxxxxxxxxxx01010101010101010101010101xxxxxxxxxx

// Write cycle: WE controlled (i.e. WE occurs BEFORE CE)
// /CE xxxxx/''''''''\____________________/''''''''\________
// ADR xxxxxxx0101010101010xxxxxxxxxxxxxxxxxxx
// /WE ''''''''''''''''''\_____________________/'''''''''''
// /OE '''''''''''''''''''''''''''''''''''''''''''''''''''''
// DAT xxxxxxxxxxxxxxxxxx01010101010101010101010101xxxxxxxxxx

// 16MHz = 62.5ns period
// 8MHz = 125ns period

// A sequence starts when StartCycle goes high.
// StartCycle must return low before another sequence can start.
// If StartCycle returns low before the current sequence has finished
// we must wait for the sequence to complete.

module SequenceGenerator (
   input        Clk,
   input[2:0]   Delay,        // 0->9 clock cycle delay
   input        Extend,         // Extend cycle arbitrarily. (Active high)
   input        StartCycle,   // Start a memory cycle (Active high)
   input        ReadSeq,      // Initiate a read cycle (Active high)
   input        WriteSeq,     // Initiate a write cycle (Active high)
   output       CE,           // Active low
   output       WE,           // Active low
   output       OE,            // Active low
   output[1:0]       SeqState       // Debug
   );

   // Internal vars
   reg[1:0] cycleState = 2'b00; // 00 = idle, 01 = starting cycle, 10 = currently in a cycle, 11 = cycle has ended.
   reg[2:0] delayCnt;
   reg[1:0] seqState = 2'b00;
   reg oWE, oCE, oOE;

   // Handcrafted FSM. :-O
   always @(posedge Clk) begin
      // We can begin a cycle only if idling.
      if (StartCycle == 1'b1 && cycleState == 2'b00) begin
         // Start cycle
         cycleState <= 2'b01;  // Transition to start
         $display("%d %m: Start cycle detected: %d", $stime, cycleState);
      end else if (cycleState == 2'b01) begin
         // Starting cycle.
         delayCnt <= 3'b000;
         seqState <= 2'b00;
         oWE <= 1'b1;
         oCE <= 1'b1;
         oOE <= 1'b1;
         cycleState <= 2'b10;  // Transition to in-cycle
         $display("%d %m: Starting cycle: %d, %d, %d", $stime, delayCnt, seqState, cycleState);
      end else if (cycleState == 2'b10) begin
         // In cycle
         $display("%d %m: In cycle: %d", $stime, cycleState);
         if (ReadSeq == 1'b1) begin
            $display("%d %m: Read sequence.", $stime);
            if (seqState == 2'b00) begin
               oCE <= 1'b0;
               seqState <= 2'b01;
            end else if (seqState == 2'b01) begin
               oOE <= 1'b0;
               if (Extend == 1'b0) begin
                  if (delayCnt >= Delay) begin
                     seqState <= 2'b10;
                  end else begin
                     delayCnt <= delayCnt + 1;
                  end
               end else begin
                  seqState <= seqState;
               end
            end else if (seqState == 2'b10) begin
               oCE <= 1'b1;
               seqState <= 2'b11;
            end else begin // seqState == 2'b11
               oOE <= 1'b1;
               cycleState <= 2'b11; // Transition to cycle ended
            end
         end else if (WriteSeq == 1'b1) begin
            $display("%d %m: Write sequence.", $stime);
            if (seqState == 2'b00) begin
               oCE <= 1'b0;
               seqState <= 2'b01;
            end else if (seqState == 2'b01) begin
               oWE <= 1'b0;
               if (Extend == 1'b0) begin
                  if (delayCnt >= Delay) begin
                     seqState <= 2'b10;
                  end else begin
                     delayCnt <= delayCnt + 1;
                  end
               end else begin
                  seqState <= seqState;
               end
            end else if (seqState == 2'b10) begin
               oWE <= 1'b1;
               seqState <= 2'b11;
            end else begin // seqState == 2'b11
               oCE <= 1'b1;
               cycleState <= 2'b11; // Transition to cycle ended
            end
         end else begin
            $display("%d %m: Nothing to do. End cycle: %d", $stime, cycleState);
            // Nothing to do. End cycle
           cycleState <= 2'b11;
         end
      end else if (cycleState == 2'b11) begin
         $display("%d %m: Ending cycle...", $stime);
         // The cycle sequence had ended.
         oWE <= 1'b1;
         oCE <= 1'b1;
         oOE <= 1'b1;
         // Wait for StartCycle to go low
         if (StartCycle == 1'b0) begin
            $display("%d %m: StartCycle went low. Transitioning to Idle.", $stime);
            cycleState <= 2'b00;  // Transition to idle.
         end else begin
            // Stay and wait.
            $display("%d %m: Waiting for Low StartCycle: %d", $stime, cycleState);
            cycleState <= cycleState;
         end
      end else begin
         // Stay in current state.
         cycleState <= cycleState;
         $display("%d %m: Idling: %d", $stime, cycleState);
      end
   end

   assign CE = oCE;
   assign WE = oWE;
   assign OE = oOE;
   assign SeqState = seqState;

endmodule
