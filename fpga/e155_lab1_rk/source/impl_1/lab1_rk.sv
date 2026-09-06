module lab1_rk(
	 input   logic       reset, enable,
	 input   logic [3:0] switch,
     output  logic [2:0] led,
	 output  logic [6:0] seg
);

   logic int_osc;

   // Internal high-speed oscillator
   HSOSC #(.CLKHF_DIV(2'b01))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

  // Instantiate counter and seven segments
  counter counter(int_osc, enable, reset, led[2]);
  sevenseg sevenseg(switch, seg);
  
  // LED switch logic
  assign led[0] = switch[1] ^ switch[0];
  assign led[1] = switch[3] & switch[2]; 

endmodule