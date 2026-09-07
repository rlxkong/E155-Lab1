`timescale 1 ns/1 ns

module sevenseg_tb();
  logic   		  clk;	  // system clock
  logic   [3:0]   s; 	  // 4-bit input switches
  logic   [6:0]   seg;    // 6 output segments

    sevenseg dut (
        .switch(s),
        .segments_abc_defg(seg)
    );

  // generate clock
  always begin
      clk = 0; #5;
      clk = 1; #5;
  end

  // apply stimuli and check outputs
  initial begin

    // display 0
        s = ~(4'b0000);                		// setup inputs
        #10;                        		// wait required time
        assert (seg == ~(7'b111_1110))      // check output
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
            
    // display 1
        s = ~(4'b0001);
        #10;
        assert (seg == ~(7'b011_0000))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display 2
        s = ~(4'b0010);
        #10;
        assert (seg == ~(7'b110_1101))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display 3
        s = ~(4'b0011);
        #10;
        assert (seg == ~(7'b111_1001))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display 4
        s = ~(4'b0100);
        #10;
        assert (seg == ~(7'b011_0011))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display 5
        s = ~(4'b0101);
        #10;
        assert (seg == ~(7'b101_1011))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display 6
        s = ~(4'b0110);
        #10;
        assert (seg == ~(7'b101_1111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display 7
        s = ~(4'b0111);
        #10;
        assert (seg == ~(7'b111_0000))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display 8
        s = ~(4'b1000);
        #10;
        assert (seg == ~(7'b111_1111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display 9
        s = ~(4'b1001);
        #10;
        assert (seg == ~(7'b111_0011))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display A
        s = ~(4'b1010);
        #10;
        assert (seg == ~(7'b111_0111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display b
        s = ~(4'b1011);
        #10;
        assert (seg == ~(7'b001_1111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display C
        s = ~(4'b1100);
        #10;
        assert (seg == ~(7'b100_1110))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display d
        s = ~(4'b1101);
        #10;
        assert (seg == ~(7'b011_1101))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
        
    // display E
        s = ~(4'b1110);
        #10;
        assert (seg == ~(7'b100_1111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time);
			
    // display F
        s = ~(4'b1111);
        #10;
        assert (seg == ~(7'b100_0111))
            $display("PASSED! The seven segments behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven segments behaves incorrectly at time: %0t.", $time); 
 
 
    #100 $stop;
  end
endmodule