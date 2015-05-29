//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Crop

:Function
Cropping images, depending on your top, bottom, left and right coordinate. 
Give the first output after 1 cycle while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-25

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
	out_ready,
	out_data,
	out_count_x,
	out_count_y);
	/*
	::description
	This module's working mode.
	::range
	0 for Pipline, 1 for Req-ack
	*/
	parameter work_mode = 0;
	/*
	::description
	Data bit width. 
	*/
	parameter data_width = 8;
	/*
	::description
	Width of image.
	::range
	1 - 4096
	*/
	parameter im_width = 320;
	/*
	::description
	Height of image.
	::range
	1 - 4096
	*/
	parameter im_height = 240;
	/*
	::description
	The bits of width of image.
	::range
	Depend on width of image
	*/
	parameter im_width_bits = 9;

	/*
	::description
	Clock.
	*/
	input clk;
	/*
	::description
	Reset, active low.
	*/
	input rst_n;
	/*
	::description
	Top of the rang you want to crop. 
	::range
	Depend on height of image, 0 - im_height-1. 
	*/
	input[im_width_bits - 1 : 0] top;
	/*
	::description
	Bottom of the rang you want to crop. 
	::range
	Depend on height of image, 0 - im_height-1. 
	*/
	input[im_width_bits - 1 : 0] bottom;
	/*
	::description
	Left of the rang you want to crop. 
	::range
	Depend on height of image, 0 - im_width-1. 
	*/
	input[im_width_bits - 1 : 0] left;
	/*
	::description
	Right of the rang you want to crop. 
	::range
	Depend on height of image, 0 - im_width-1. 
	*/
	input[im_width_bits - 1 : 0] right;
	/*
	::description
	Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [data_width - 1 : 0] in_data;
	/*
	::description
	Input pixel count for width. 
	*/
	input[im_width_bits - 1 : 0] in_count_x;
	/*
	::description
	Input pixel count for height. 
	*/
	input[im_width_bits - 1 : 0] in_count_y;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output[data_width - 1 : 0] out_data;
	/*
	::description
	Output pixel count for height. 
	*/
	output[im_width_bits - 1 : 0] out_count_x;
	/*
	::description
	Output pixel count for height. 
	*/
	output[im_width_bits - 1 : 0] out_count_y;

	generate

		reg[im_width_bits - 1 : 0] reg_out_count_x;
		reg[im_width_bits - 1 : 0] reg_out_count_y;
		reg[data_width - 1 : 0] reg_out_data;
		reg reg_out_ready;
		reg in_range_t, in_range_b, in_range_l, in_range_r;

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				reg_out_ready <= 0;
			else
				reg_out_ready <= 1;
		end
		assign out_ready = reg_out_ready;

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) begin
				in_range_t <= 0;
				in_range_b <= 0;
				in_range_l <= 0;
				in_range_r <= 0;
			end else begin
				in_range_t <= in_count_y >= top ? 1 : 0;
				in_range_b <= in_count_y <= bottom ? 1 : 0;
				in_range_l <= in_count_x >= left ? 1 : 0;
				in_range_r <= in_count_x <= right ? 1 : 0;
			end
		end

		if(work_mode == 0) begin
			always @(posedge clk) begin
				reg_out_count_x <= in_count_x;
				reg_out_count_y <= in_count_y;
				reg_out_data <= in_data;
			end
		end else begin 
			always @(posedge in_enable) begin
				reg_out_count_x <= in_count_x;
				reg_out_count_y <= in_count_y;
				reg_out_data <= in_data;
			end
		end
		assign out_count_x = reg_out_count_x;
		assign out_count_y = reg_out_count_y;
		assign out_data = out_ready & in_range_t & in_range_b & in_range_l & in_range_r ? reg_out_data : 0;

	endgenerate
	
endmodule