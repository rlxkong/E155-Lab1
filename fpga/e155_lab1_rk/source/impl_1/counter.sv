module counter(
	input logic clk, enable, reset,
	output logic led
);
	logic [22:0] counter;
	logic switch_led;
	
   // Initialize switch_led
   assign switch_led = '0;
   
   // Counter
   always_ff @(posedge clk) begin
     if      (reset == 0)
		 counter <=0;
	 else if (counter == 5000000) begin
		 switch_led = ~switch_led;
		 counter <= 0;
		 end
	 else 
		 counter <= counter + 1;
   end
   
   // Assign led  
   assign led = switch_led;
	
endmodule