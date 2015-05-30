/*
:Project
FPGA-Imaging-Library

:Design
ColorBin2Channels

:Function
Covert Bin to more channels.

:Module
Main module

:Version
1.0

:Modified
2015-05-12

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


module ColorBin2Channels(
	b,
	channels
    );

	parameter color_width = 8;
	parameter color_channels = 3;

	input b;
	output[color_channels * color_width - 1 : 0] channels;

	genvar i;
	generate
		`define h (i + 1) * color_width - 1
		`define l i * color_width
		for (i = 0; i < color_channels; i = i + 1) begin: channel
			assign channels[`h : `l] = b ? {color_width{1'b1}} : {color_width{1'b0}};
		end
		`undef h
		`undef l

	endgenerate

endmodule