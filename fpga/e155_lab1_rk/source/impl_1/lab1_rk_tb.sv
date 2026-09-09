//	lab1_rk_tb.sv
//	Rebecca Kong
//	rkong@hmc.edu
//	9/7/2026
//
//	A testbench used to verify that modules are wired together correctly, the HSOSC produces a clock, and that the assign logic works.

`timescale 1 ns/1 ns

module lab1_rk_tb();
  logic           reset;  // active high reset
  logic   [3:0]   s;      // 4-bit input switches
  logic   [2:0]   led;    // 3 output leds
  logic   [6:0]   seg;    // 6 output segments
  logic 		  enable; // active high enable

    lab1_rk dut (
        .reset(reset),
        .switch(s),
        .led(led),
		.seg(seg),
		.enable(enable)
    );


  // apply stimuli and check outputs
  initial begin
	// HSOSC clock testing
	// immediately check the internal oscillator
		#5;
		assert (dut.int_osc == 0)       
            $display("PASSED! The oscillator behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The oscillator behaves incorrectly at time: %0t.", $time); 
		#6;			//a bit more than half a internal oscillator cycle (the clock would be on high) in addition to the 5ns from earlier.
		assert (dut.int_osc == 1)       
            $display("PASSED! The oscillator behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The oscillator behaves incorrectly at time: %0t.", $time); 
			
	// counter submodule verification
	// enable verification
		reset = 0; 				// set intial value to 0
		#21; 					// one cycle
		reset = 1; 				// start counting
		#21;
		enable = 0;								// set enable to 0 should freeze the code
        #200;                       			
        assert (dut.counter.count == 0)    
            $display("PASSED! The enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The enable behaves incorrectly at time: %0t.", $time);
		
		enable = 1;
		#200;			// wait for enable to occur (counter goes to 0)
		assert (dut.counter.count != 0)    
            $display("PASSED! The enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The enable behaves incorrectly at time: %0t.", $time); 
			
	// reset verification 
		reset = 0;
		#20;			// reset all initial values to 0
		assert ((dut.counter.count == 0) & (led[2] == 0))  
            $display("PASSED! The reset behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The reset behaves incorrectly at time: %0t.", $time);
		reset = 1;
		#20;		
		
	// led[2] turns on so it shows that the led responds to HSOSC which means the submodule is connected
		#300000000;  	// 20ns per cycle x 10000000 (maxcount) for time it takes to reach maxcount
		assert ((led[2] == 1))
            $display("PASSED! The led behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led behaves incorrectly at time: %0t.", $time); 

	// LED combinational logic
    // testing for led[0] -- XOR
        s = ~(4'bxx00);                
        #20;                 
        assert (led[0] == 0)       
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
        s = ~(4'bxx01);
        #20;
        assert (led[0] == 1)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
        s = ~(4'bxx10);               
        #20;                      
        assert (led[0] == 1)       
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
        s = ~(4'bxx11);
        #20;
        assert (led[0] == 0)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
    // testing for led[1] -- AND
        s = ~(4'b00xx);                
        #20;                 
        assert (led[1] == 0)       
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
        s = ~(4'b01xx);
        #20;
        assert (led[1] == 0)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
        s = ~(4'b10xx);               
        #20;                      
        assert (led[1] == 0)       
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
            
        s = ~(4'b11xx);
        #20;
        assert (led[1] == 1)
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
		
	// Check seven segments works the same in top module	
    // display 0
        s = ~(4'b0000);                		// setup inputs
        #20;                        		// wait required time
        assert (seg == ~(7'b111_1110))      // check output
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
            
    // display 1
        s = ~(4'b0001);
        #20;
        assert (seg == ~(7'b011_0000))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display 2
        s = ~(4'b0010);
        #20;
        assert (seg == ~(7'b110_1101))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display 3
        s = ~(4'b0011);
        #20;
        assert (seg == ~(7'b111_1001))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display 4
        s = ~(4'b0100);
        #20;
        assert (seg == ~(7'b011_0011))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display 5
        s = ~(4'b0101);
        #20;
        assert (seg == ~(7'b101_1011))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display 6
        s = ~(4'b0110);
        #20;
        assert (seg == ~(7'b101_1111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display 7
        s = ~(4'b0111);
        #20;
        assert (seg == ~(7'b111_0000))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display 8
        s = ~(4'b1000);
        #20;
        assert (seg == ~(7'b111_1111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display 9
        s = ~(4'b1001);
        #20;
        assert (seg == ~(7'b111_0011))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display A
        s = ~(4'b1010);
        #20;
        assert (seg == ~(7'b111_0111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display b
        s = ~(4'b1011);
        #20;
        assert (seg == ~(7'b001_1111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display C
        s = ~(4'b1100);
        #20;
        assert (seg == ~(7'b100_1110))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display d
        s = ~(4'b1101);
        #20;
        assert (seg == ~(7'b011_1101))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display E
        s = ~(4'b1110);
        #20;
        assert (seg == ~(7'b100_1111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display F
        s = ~(4'b1111);
        #20;
        assert (seg == ~(7'b100_0111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 		

    #100 $stop;
  end
endmodule