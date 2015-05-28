/*
:Project
FPGA-Imaging-Library

:Design
FixedRoundUnsigned

:Function
Round for unsigned fixed number. 
Give the first output after 1 cycle.

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

module FixedRoundUnsigned(
	clk,
	fixed_num,
	rounded_num
	);

	parameter num_width = 42;
	parameter fixed_pos = 16;

	input clk;
	input [num_width - 1 : 0] fixed_num;
	output [num_width - fixed_pos - 1 : 0] rounded_num;

	reg [num_width - fixed_pos - 1 : 0] reg_rounded_num;

	assign rounded_num = reg_rounded_num;

	always @(posedge clk)
		reg_rounded_num <= fixed_num[fixed_pos - 1] == 0 ? 
			fixed_num[num_width -1 : fixed_pos] : 
			fixed_num[num_width -1 : fixed_pos] + 1;

endmodule