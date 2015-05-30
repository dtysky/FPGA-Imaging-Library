/*
:Project
FPGA-Imaging-Library

:Design
FixedRoundSigned

:Function
Round for signed fixed number. 
Give the first output after 3 cycles.

:Module
Main module

:Version
1.0

:Modified
2015-05-16

Copyright (C) 2015  Tianyu Dai (dtysky) <dtysky@outlook.com>

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
	http://fil.dtysky.moe

Sources for this project:
	https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe

*/
`timescale 1ns / 1ps

module FixedRoundSigned1(
	clk,
	fixed_num,
	round,
	overflow
	);

	parameter num_width = 42;
	parameter fixed_pos = 16;
	parameter res_width = 12;

	input clk;
	input signed [num_width - 1 : 0] fixed_num;
	output reg signed [res_width : 0] round;
	output reg overflow;

	reg signed [num_width - 1 : 0] num_orig;
	reg num_orig_sflag, num_orig_rflag, reg_overflow;
	reg signed [res_width : 0] num_comp;

	always @(posedge clk) begin
		num_orig <= fixed_num[num_width - 1] == 0 ? fixed_num : 
			{fixed_num[num_width - 1], ~(fixed_num[num_width - 2 : 0] - 1)};
		num_comp <= num_orig[num_width - 1] == 0 ? 
			{num_orig[num_width - 1], num_orig[res_width + fixed_pos - 1 : fixed_pos]} : 
			{num_orig[num_width - 1], ~num_orig[res_width + fixed_pos - 1 : fixed_pos] + 1};
		reg_overflow <= num_orig[num_width - 2 : res_width + fixed_pos] == 0 ? 0 : 1;
		overflow <= reg_overflow;
		num_orig_sflag <= num_orig[num_width - 1];
		num_orig_rflag <= num_orig[fixed_pos - 1];
		//Why not use num_comp[25] to judge? : if 0
		case(num_orig_sflag)
			0 : round <= num_orig_rflag == 0 ? num_comp : num_comp + 1;
			1 : round <= num_orig_rflag == 0 ? num_comp : num_comp - 1;
			default : /* default */;
		endcase
	end

endmodule