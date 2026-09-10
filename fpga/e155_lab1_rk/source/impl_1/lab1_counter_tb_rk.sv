//	lab1_counter_tb_rk.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/6/2026
//
//	A testbench used to verify the reset, enable, and max count behavior.

`timescale 1 ns/1 ns

module lab1_counter_tb_rk();
  logic           clk;    			// system clock
  logic           enable;  			// active high enable
  logic           reset;  			// active high reset
  logic           led;    			// blinking led
  logic           temp_counter; 	// temporary counter

    lab1_counter_rk dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .led(led)
    );

  // generate clock
  always begin
      clk = 0; #10;
      clk = 1; #10;
  end

  // apply stimuli and check outputs
  initial begin
    reset = 0;
    #20; 			// initial set all values to 0
	reset = 1; 
	#20; 			// resume the code (one cycle)

	// enable verification
		enable = 0;								// set enable to 0 should freeze the code
        #200;                       			
        assert (dut.count == 0)    
            $display("PASSED! The enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The enable behaves incorrectly at time: %0t.", $time);
			
		enable = 1;
		#200;			// wait a cycle for enable to occur (continue counting)
		assert (dut.count != 0)    
            $display("PASSED! The enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The enable behaves incorrectly at time: %0t.", $time); 
			
	// reset verification 
		reset = 0;
		#200;			// reset all initial values to 0
		assert ((dut.count == 0) & (led == 0))  
            $display("PASSED! The reset behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The reset behaves incorrectly at time: %0t.", $time);
		reset = 1;
		#20;			// wait a cycle for reset to occur
		
	// maxcount verification
		#199999980;  	// 20ns per cycle x 10000000 - 1 (maxcount) for time it takes to reach maxcount
		assert (dut.count == 0)
            $display("PASSED! The maxcounter condition behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The maxcounter condition behaves incorrectly at time: %0t.", $time); 
            
    // ensure counting and led timing works
        #20;
        assert (dut.count != 0)
            $display("PASSED! The counting behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counting behaves incorrectly at time: %0t.", $time); 
		assert (led == 1)
            $display("PASSED! The led timing behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led timing behaves incorrectly at time: %0t.", $time); 

    #100 $stop;
  end
endmodule