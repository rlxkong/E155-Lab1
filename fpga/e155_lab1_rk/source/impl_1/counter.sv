//	counter.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/5/2026
//
//	Logic to ensure led[2] blinks at 2.4Hz. Includes a reset, enable, and max count feature.

module counter #(
	parameter maxcount = 10000000, //maximum postitive edges to achieve 2.4 Hz
	parameter N = 24 //sets bitsize of counter
) (
	input logic clk, enable, reset,
	output logic led
);
	logic [N-1:0] count;
	logic switch_led;
	
   // Counter
   always_ff @(posedge clk) begin
     if      (reset == 0) begin			// when reset == 0 it resets
		 count <= 0;
		 switch_led <= 0;
		 end
	 else if (enable) begin				// only runs when enable == 1
		if (count == maxcount) begin	// blinks the light and resets the count at the end of a cycle
			switch_led <= ~switch_led;
			count <= 0;
			end
		else 
			count <= count + 1;
	 end
   end
   
   // Assign led  
   assign led = switch_led;
	
endmodule