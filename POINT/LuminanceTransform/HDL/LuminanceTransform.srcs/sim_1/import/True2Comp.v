/*
:Project
FPGA-Imaging-Library

:Design
True2Comp

:Function
Convert true code to complemental code.

:Module
Main module

:Version
1.0

:Modified
2015-05-01

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


module True2Comp(
	true,
	complement);

	parameter data_channel = 1;
	parameter data_width = 17;

	input[data_channel * data_width - 1 : 0] true;
	output[data_channel * data_width - 1 : 0] complement;

	genvar i;
	generate
		`define h (i + 1) * data_width - 1
		`define l i * data_width
		for (i = 0; i < data_channel; i = i + 1) begin
			assign complement[`h : `l] = true[`h] == 0 ? 
				true[`h : `l] : {1'b1, ~true[`h - 1 : `l] + 1};
		end
		`undef h
		`undef l
	endgenerate
endmodule