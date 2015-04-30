/*
Image processing project : FixedRound.

Function: Round, delay = 3.

Main module.

Copyright (C) 2015  Dai Tianyu (dtysky)

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Homepage for this project:
	http://ifl.dtysky.moe

Sources for this project:
	https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe

*/

`timescale 1ns / 1ps

module FixedRound(
	clk,
	fixed_num,
	round
	);

	parameter num_width = 42;
	parameter fixed_pos = 16;

	input clk;
	input signed [num_width - 1 : 0] fixed_num;
	output signed [num_width - fixed_pos - 1 : 0] round;

	reg signed [num_width - 1 : 0] num_orig;
	reg signed [num_width - fixed_pos - 1 : 0] num_comp;
	reg signed [num_width - fixed_pos - 1 : 0] reg_round;

	assign round = reg_round;

	always @(posedge clk) begin
		num_orig <= fixed_num[num_width - 1] == 0 ? fixed_num : 
			{fixed_num[num_width - 1], ~(fixed_num[num_width - 2 : 0] - 1)};
		num_comp <= num_orig[num_width - 1] == 0 ? num_orig[num_width - 1 : fixed_pos] : 
			{num_orig[num_width - 1], ~num_orig[num_width - 2 : fixed_pos] + 1};
		//Why not use num_comp[25] to judge? : if 0
		case(num_orig[41])
			0 : reg_round <= num_orig[fixed_pos - 1] == 0 ? num_comp : num_comp + 1;
			1 : reg_round <= num_orig[fixed_pos - 1] == 0 ? num_comp : num_comp - 1;
			default : /* default */;
		endcase
	end

endmodule