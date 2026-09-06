module counter(
	input logic clk, enable, reset,
	output logic led
);
	logic [23:0] counter;
	logic switch_led;
	
   // Counter
   always_ff @(posedge clk) begin
     if      (reset == 0) begin
		 counter <= 0;
		 switch_led <= 0;
		 end
	 else if (counter == 10000000) begin
		 switch_led <= ~switch_led;
		 counter <= 0;
		 end
	 else 
		 counter <= counter + 1;
   end
   
   // Assign led  
   assign led = switch_led;
	
endmodule