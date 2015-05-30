//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
CountGenerator

:Function
For generating counts from xilinx.
Give the first output after 0 cycle while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-31

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


module CountGenerator(
	clk,
	rst_n,
	in_enable,
	in_data,
	out_ready,
	out_data,
	count_x,
	count_y);

	/*
	::description
	This module's working mode.
	::range
	0 for Pipline, 1 for Req-ack
	*/
	parameter work_mode = 0;
	/*
	::description
	This module's WR mode.
	::range
	0 for Write, 1 for Read
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
	Count for x.
	*/
	output reg[im_width_bits - 1 : 0] count_x;
	/*
	::description
	Count for y.
	*/
	output reg[im_width_bits - 1 : 0] count_y;

	assign out_ready = in_enable;
	assign out_data = out_ready ? in_data : 0;

	generate

		if(work_mode == 0) begin
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					count_x <= 0;
				else if(count_x == im_width - 1)
					count_x <= 0;
				else
					count_x <= count_x + 1;
			end
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					count_y <= 0;
				else if(count_x == im_width - 1 && count_y == im_height - 1)
					count_y <= 0;
				else if(count_x == im_width - 1)
					count_y <= count_y + 1;
				else
					count_y <= count_y;
			end
		end else begin 
			always @(posedge in_enable or negedge rst_n) begin
				if(~rst_n)
					count_x <= 0;
				else if(count_x == im_width - 1)
					count_x <= 0;
				else
					count_x <= count_x + 1;
			end
			always @(posedge in_enable or negedge rst_n) begin
				if(~rst_n)
					count_y <= 0;
				else if(count_x == im_width - 1 && count_y == im_height - 1)
					count_y <= 0;
				else if(count_x == im_width - 1)
					count_y <= count_y + 1;
				else
					count_y <= count_y;
			end
		end

	endgenerate

endmodule