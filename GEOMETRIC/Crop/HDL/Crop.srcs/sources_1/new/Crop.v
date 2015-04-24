/*
Image processing project : Crop.

Function: Cropping a image, depending on your top, bottom, left and right coordinate.

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

Documents for all modules:
http://image-on-fpga.dtysky.moe

All modules for image processing project:
https://github.com/dtysky/Image-processing-on-FPGA

This mail is for connecting me:
dtysky@outlook.com

My blog is here:
http://dtysky.moe

*/

`timescale 1ns / 1ps

module Crop(
	clk,
	rst_n,
	top,
	bottom,
	left,
	right,
	in_enable,
	in_data,
	in_count_x,
	in_count_y,
	out_enable,
	out_data,
	out_count_x,
	out_count_y,
	in_range);

	parameter color_width = 8;
	parameter im_width_bits = 9;
	parameter im_width = 320;
	parameter im_height = 240;

	input clk;
	input rst_n;
	input[im_width_bits - 1 : 0] top, bottom, left, right;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	input[im_width_bits - 1 : 0] in_count_x, in_count_y;
	output out_enable;
	output[color_width - 1 : 0] out_data;
	output[im_width_bits - 1 : 0] out_count_x, out_count_y;
	output in_range;

	assign out_count_x = in_count_x;
	assign out_count_y = in_count_y;
	assign in_range = in_count_x >= left && in_count_x <= right && in_count_y >= top && in_count_y <= bottom ? 1 : 0;
	assign out_data = ~rst_n || ~in_enable || ~in_range ? 0 : in_data;
	assign out_enable = ~rst_n || ~in_enable ? 0 : 1;
	
endmodule