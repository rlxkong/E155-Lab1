module lab1_rk(
	 input   logic [3:0] switch,
     output  logic [2:0] led,
	 output  logic [6:0] seg
);

   logic int_osc;

   // Internal high-speed oscillator
   HSOSC #(.CLKHF_DIV(2'b01))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));



endmodule