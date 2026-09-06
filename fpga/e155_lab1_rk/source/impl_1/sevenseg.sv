module sevenseg(
	input  logic [3:0] switch,
	output logic [6:0] segments_abc_defg
);
	// Assign corresponding segments to given hexadecimal digit
	always_comb
		case(switch)
			0: segments_abc_defg = 7'b111_1110;
			1: segments_abc_defg = 7'b011_0000;
			2: segments_abc_defg = 7'b110_1101;
			3: segments_abc_defg = 7'b111_1001;
			4: segments_abc_defg = 7'b011_0011;
			5: segments_abc_defg = 7'b101_1011;
			6: segments_abc_defg = 7'b101_1111;
			7: segments_abc_defg = 7'b111_0000;
			8: segments_abc_defg = 7'b111_1111;
			9: segments_abc_defg = 7'b111_0011;
			10: segments_abc_defg = 7'b111_0111;		//A
			11: segments_abc_defg = 7'b001_1111;		//b
			12: segments_abc_defg = 7'b100_1110;		//C
			13: segments_abc_defg = 7'b011_1101;		//d
			14: segments_abc_defg = 7'b100_1111;		//E
			15: segments_abc_defg = 7'b100_0111;		//F
			default: segments_abc_defg = 7'b000_0000;	//blank
		endcase
endmodule