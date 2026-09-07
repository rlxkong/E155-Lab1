module counter #(
	parameter maxcount = 10000000, //maximum postitive edges to achieve 2.4 Hz
	parameter N = 23 //sets bitsize of counter
) (
	input logic clk, enable, reset,
	output logic led
);
	logic [N:0] counter;
	logic switch_led;
	
   // Counter
   always_ff @(posedge clk) begin
     if      (reset == 0) begin		// when reset == 0 it resets
		 counter <= 0;
		 switch_led <= 0;
		 end
	 else if (enable == 0) 
		 counter <= counter; 		// when enable == 0 it stops the flip-flop
	 else if ((counter == maxcount) & (enable == 1)) begin
		 switch_led <= ~switch_led;
		 counter <= 0;
		 end
	 else begin
		 if  (enable == 1)
			counter <= counter + 1;
			end
   end
   
   // Assign led  
   assign led = switch_led;
	
endmodule