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
     if      (reset == 0) begin
		 counter <= 0;
		 switch_led <= 0;
		 end
	 else if (counter == maxcount) begin
		 switch_led <= ~switch_led;
		 counter <= 0;
		 end
	 else 
		 counter <= counter + 1;
   end
   
   // Assign led  
   assign led = switch_led;
	
endmodule