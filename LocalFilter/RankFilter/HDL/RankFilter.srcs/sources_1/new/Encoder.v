module Encoder(index, value);
	parameter window_width = 3;
	parameter full_win_bits = 4;
	input[window_width * window_width - 1 : 0] index;
	output[full_win_bits - 1 : 0] value;
	reg[full_win_bits - 1 : 0] reg_value;
	assign value = reg_value;
	generate
		case(window_width)
			2 : 
				always@(*) begin
					case(index)
						1 : reg_value <= 0;
						2 : reg_value <= 1;
						4 : reg_value <= 2;
						8 : reg_value <= 3;
						default: reg_value <= 0;
					endcase
				end
			3 : 
				always@(*) begin
					case(index)
						1 : reg_value <= 0;
						2 : reg_value <= 1;
						4 : reg_value <= 2;
						8 : reg_value <= 3;
						16 : reg_value <= 4;
						32 : reg_value <= 5;
						64 : reg_value <= 6;
						128 : reg_value <= 7;
						256 : reg_value <= 8;
						default: reg_value <= 0;
					endcase
				end
			4 : 
				always@(*) begin
					case(index)
						1 : reg_value <= 0;
						2 : reg_value <= 1;
						4 : reg_value <= 2;
						8 : reg_value <= 3;
						16 : reg_value <= 4;
						32 : reg_value <= 5;
						64 : reg_value <= 6;
						128 : reg_value <= 7;
						256 : reg_value <= 8;
						512 : reg_value <= 9;
						1024 : reg_value <= 10;
						2048 : reg_value <= 11;
						4096 : reg_value <= 12;
						8192 : reg_value <= 13;
						16384 : reg_value <= 14;
						32768 : reg_value <= 15;
						default: reg_value <= 0;
					endcase
				end
			5 : 
				always@(*) begin
					case(index)
						1 : reg_value <= 0;
						2 : reg_value <= 1;
						4 : reg_value <= 2;
						8 : reg_value <= 3;
						16 : reg_value <= 4;
						32 : reg_value <= 5;
						64 : reg_value <= 6;
						128 : reg_value <= 7;
						256 : reg_value <= 8;
						512 : reg_value <= 9;
						1024 : reg_value <= 10;
						2048 : reg_value <= 11;
						4096 : reg_value <= 12;
						8192 : reg_value <= 13;
						16384 : reg_value <= 14;
						32768 : reg_value <= 15;
						65536 : reg_value <= 16;
						131072 : reg_value <= 17;
						262144 : reg_value <= 18;
						524288 : reg_value <= 19;
						1048576 : reg_value <= 20;
						2097152 : reg_value <= 21;
						4194304 : reg_value <= 22;
						8388608 : reg_value <= 23;
						16777216 : reg_value <= 24;
						default: reg_value <= 0;
					endcase
				end
			default : ;
		endcase
	endgenerate
endmodule	