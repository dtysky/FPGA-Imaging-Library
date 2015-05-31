/*
:Project
FPGA-Imaging-Library

:Design
ColorRGB16toRGB24

:Function
Covert 16bits-RGB to 24bits-RGB.

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

module ColorRGB16toRGB24(
	input[15 : 0] rgb16,
	output[23 : 0] rgb24
    );

	assign rgb24[23 : 16] = {rgb16[15 : 11], rgb16[15 : 13]};
	assign rgb24[15:8] = {rgb16[10 : 5], rgb16[10 : 9]};
	assign rgb24[7:0] = {rgb16[4 : 0], rgb16[4 : 2]};

endmodule