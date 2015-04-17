`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/17 13:32:36
// Design Name: RankFitter
// Module Name: Encoder
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Encoder(index, value);
	parameter full_win_bits = 3;
	input[2 ** full_win_bits - 1 : 0] index;
	output[full_win_bits - 1 : 0] value;
	reg[full_win_bits - 1 : 0] reg_value;
	assign value = reg_value;
	generate
		case(full_win_bits)
			0 : 
				always@(*) begin
					case(index)
						default: reg_value <= 0;
					endcase
				end
			1 : 
				always@(*) begin
					case(index)
						1 : reg_value <= 0;
						default: reg_value <= 0;
					endcase
				end
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
			default : ;
		endcase
	endgenerate
endmodule