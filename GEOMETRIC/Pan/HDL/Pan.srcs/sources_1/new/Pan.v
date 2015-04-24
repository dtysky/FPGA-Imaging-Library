/*
Image processing project : Pan.

Function: Panning a image from your given offset.

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

This module is a part of image processing project, you can get all of them here:
	https://github.com/dtysky/Image-processing-on-FPGA

This mail is for connecting me:
	dtysky@outlook.com

My blog is here:
	http://dtysky.moe/
*/

`timescale 1ns / 1ps

module Pan(
	clk,
	rst_n,
	offset_x,
	offset_y,
	in_enable,
	in_data,
	in_count_x,
	in_count_y,
	out_enable,
	out_data,
	out_count_x,
	out_count_y);

	parameter color_width = 8;
	parameter im_width = 320;
	parameter im_height = 240;
	parameter im_width_bits = 9;
	
	input clk, rst_n;
	input signed [im_width_bits : 0] offset_x, offset_y;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	input[im_width_bits - 1 : 0] in_count_x, in_count_y;
	output out_enable;
	output[color_width - 1 : 0] out_data;
	output[im_width_bits - 1 : 0] out_count_x, out_count_y;

	wire signed [im_width_bits : 0] tmp_out_x, tmp_out_y;

	function signed [im_width_bits : 0] out_count_gen(
		input[im_width_bits - 1 : 0] c,
		input signed [im_width_bits : 0] coffset,
		input[im_width_bits - 1 : 0] csize);
		reg signed [im_width_bits : 0] c_sum;
		reg [im_width_bits - 1 : 0] out_sp;
		begin
			c_sum = c + coffset;
			out_sp = c_sum >= csize ? c_sum - csize : c_sum + csize;
			out_count_gen = c_sum < csize && c_sum >= 0 ? c_sum : out_sp;
		end
	endfunction
	
	assign out_enable = ~rst_n || ~in_enable ? 0 : 1;

	assign tmp_out_x = out_count_gen(in_count_x, offset_x, im_width);
	assign tmp_out_y = out_count_gen(in_count_y, offset_y, im_height);

	assign out_count_x = ~rst_n || ~in_enable ? 0 : tmp_out_x[im_width_bits - 1 : 0];
	assign out_count_y = ~rst_n || ~in_enable ? 0 : tmp_out_y[im_width_bits - 1 : 0];
	assign out_data =
		tmp_out_x >= offset_x && tmp_out_x < im_width + offset_x &&
		tmp_out_y >= offset_y && tmp_out_y < im_height + offset_y ?
		in_data : 0;
	wire test1 = tmp_out_x >= offset_x ? 1 : 0;
	wire test2 = tmp_out_x < im_width + offset_x ? 1 : 0;
	wire test3 = tmp_out_y >= offset_y ? 1 : 0;
	wire test4 = tmp_out_y < im_height + offset_y ? 1 : 0;



endmodule