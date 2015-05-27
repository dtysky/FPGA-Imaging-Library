//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Mirror

:Function
Getting a mirror of your given image. 
Give the first output after 1 cycle while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-26

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

module Mirror(
	clk,
	rst_n,
	mode,
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
	Mode for mirror. 
	::range
	00 for horizontal, 01 for vertical, 10 or 11 for all 
	*/
	input [1 : 0] mode;
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

	reg[im_width_bits - 1 : 0] reg_out_x, reg_out_y;
	reg[data_width - 1 : 0] reg_out_data;
	reg reg_out_ready;

	generate
		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				reg_out_ready <= 0;
			else
				reg_out_ready <= 1;
		end

		if(work_mode == 0) begin
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					reg_out_data <= 0;
				else
					reg_out_data <= in_data;
			end
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					reg_out_x <= 0;
				else begin
					case (mode)
						1 : reg_out_x <= in_count_x;
						default : reg_out_x <= im_width - 1 - in_count_x;
					endcase
				end
			end
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					reg_out_y <= 0;
				else begin 
					case (mode)
						0 : reg_out_y <= in_count_y;
						default : reg_out_y <= im_height - 1 - in_count_y;
					endcase
				end
			end
		end else begin 
			reg in_enable_last;
			always @(posedge clk)
				in_enable_last <= in_enable;
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n || ~in_enable)
					reg_out_data <= 0;
				else if(~in_enable_last & in_enable)
					reg_out_data <= in_data;
				else
					reg_out_data <= reg_out_data;
			end
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n || ~in_enable)
					reg_out_x <= 0;
				else if(~in_enable_last & in_enable) begin
					case (mode)
						1 : reg_out_x <= in_count_x;
						default : reg_out_x <= im_width - 1 - in_count_x;
					endcase
				end else
					reg_out_x <= reg_out_x;
			end
			always @(posedge clk or negedge rst_n) begin
				if(~rst_n || ~in_enable)
					reg_out_y <= 0;
				else if(~in_enable_last & in_enable) begin 
					case (mode)
						0 : reg_out_y <= in_count_y;
						default : reg_out_y <= im_height - 1 - in_count_y;
					endcase
				end else
					reg_out_y <= reg_out_y;
			end
		end
	endgenerate

	assign out_ready = reg_out_ready;
	assign out_count_x = reg_out_x;
	assign out_count_y = reg_out_y;
	assign out_data = reg_out_data;

endmodule