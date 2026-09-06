module counter(
	input logic clk, reset,
	output logic [2:0] led
);
   // Counter
   always_ff @(posedge int_osc) begin
     if(reset == 0)  counter <= 0;
     else            counter <= counter + 1;
   end

   // Assign LED output
   assign led = counter[24];
	
endmodule