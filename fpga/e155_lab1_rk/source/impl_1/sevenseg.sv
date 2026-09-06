module sevenseg(
	input  logic [3:0] switch,
	output logic [6:0] segments_abc_defg
);
	// Assign corresponding segments to given hexadecimal digit
	always_comb
		case(switch)
			4'b0000: segments_abc_defg = 7'b111_1110;
			4'b0001: segments_abc_defg = 7'b011_0000;
			4'b0010: segments_abc_defg = 7'b110_1101;
			4'b0011: segments_abc_defg = 7'b111_1001;
			4'b0100: segments_abc_defg = 7'b011_0011;
			4'b0101: segments_abc_defg = 7'b101_1011;
			4'b0110: segments_abc_defg = 7'b101_1111;
			4'b0111: segments_abc_defg = 7'b111_0000;
			4'b1000: segments_abc_defg = 7'b111_1111;
			4'b1001: segments_abc_defg = 7'b111_0011;
			4'b1010: segments_abc_defg = 7'b111_0111;		//A
			4'b1011: segments_abc_defg = 7'b001_1111;		//b
			4'b1100: segments_abc_defg = 7'b100_1110;		//C
			4'b1101: segments_abc_defg = 7'b011_1101;		//d
			4'b1110: segments_abc_defg = 7'b100_1111;		//E
			4'b1111: segments_abc_defg = 7'b100_0111;		//F
			default: segments_abc_defg = 7'b000_0000;	//blank
		endcase
endmodule