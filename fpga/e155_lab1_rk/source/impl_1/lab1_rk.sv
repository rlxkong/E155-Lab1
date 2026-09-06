module top(
     input   logic reset,
	 input   logic [3:0] s,
     output  logic [2:0] led,
	 output  logic [6:0] seg
);

   logic int_osc;
   logic [24:0] counter;

   // Internal high-speed oscillator
   HSOSC #(.CLKHF_DIV(2'b01))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

//cooked
   // Counter
   always_ff @(posedge int_osc) begin
     if(reset == 0)  counter <= 0;
     else            counter <= counter + 1;
   end

   // Assign LED output
   assign led = counter[24];
 //move and cooked

endmodule