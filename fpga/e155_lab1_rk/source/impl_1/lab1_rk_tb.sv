`timescale 1 ns/1 ns

module lab1_rk_tb();
  logic           clk;    // system clock
  logic           reset;  // active high reset
  logic   [3:0]   s;      // 4-bit input switches
  logic   [1:0]   led;    // 2 output leds
  logic   [6:0]   seg;    // 6 output segments

    lab1_rk dut (
        .clk(clk),
        .reset(reset),
        .switch(s),
        .led(led),
		.seg(seg)
    );

  // generate clock
  always begin
      clk = 0; #5;
      clk = 1; #5;
  end

  // apply stimuli and check outputs
  initial begin
    reset = 0;
    #22 reset = 1;

	// LED combinational logic
    // both led off
        s = 4'b0000;                // setup inputs
        #10;                        // wait required time
        assert (led == 2'b00)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
    // one switch on for both LEDs --> led[1] off and led[0] on
        s = 4'b0101;
        #10;
        assert (led == 2'b01)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
    // other switch on for both LEDs --> led[1] off and led[0] on
        s = 4'b1010;               
        #10;                      
        assert (led == 2'b01)       
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
    // both switches on for both LEDs --> led[1] on and led[0] off
        s = 4'b1111;
        #10;
        assert (led == 2'b10)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 

    #100 $stop;
  end
endmodule