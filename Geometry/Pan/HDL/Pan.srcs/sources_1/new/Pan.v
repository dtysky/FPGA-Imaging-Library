//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Pan

:Function
Panning a image from your given offset. 
Give the first output after 2 cycles while the input enable.

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

module Pan(
	clk,
	rst_n,
	offset_x,
	offset_y,
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
	Offset for horizontal. 
	::range
	The value must be true code if offset is positive, if negative, must be complemental code. 
	*/
	input signed [im_width_bits : 0] offset_x;
	/*
	::description
	::description
	Offset for vertical. 
	::range
	The value must be true code if offset is positive, if negative, must be complemental code. 
	*/
	input signed [im_width_bits : 0] offset_y;
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

	reg[2 : 0] con_enable;
	reg signed [im_width_bits : 0] addr_sum_x, addr_sum_y;
	reg signed [im_width_bits : 0] tmp_sum_x, tmp_sum_y;
	reg signed [im_width_bits : 0] addr_sp_x, addr_sp_y;
	reg in_range_t, in_range_b, in_range_l, in_range_r;

	genvar i;
	generate

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				con_enable <= 0;
			else if(con_enable == 2)
				con_enable <= con_enable;
			else
				con_enable <= con_enable + 1;
		end
		assign out_ready = con_enable == 2 ? 1 : 0;

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) begin
				addr_sum_x <= 0;
				addr_sum_y <= 0;
				tmp_sum_x <= 0;
				tmp_sum_y <= 0;
			end else begin
				addr_sum_x <= in_count_x + offset_x;
				addr_sum_y <= in_count_y + offset_y;
				tmp_sum_x <= addr_sum_x;
				tmp_sum_y <= addr_sum_y;
			end
		end

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) begin
				addr_sp_x <= 0;
				addr_sp_y <= 0;
			end else begin
				addr_sp_x <= addr_sum_x < 0 ? addr_sum_x + im_width : addr_sum_x - im_width;
				addr_sp_y <= addr_sum_y < 0 ? addr_sum_y + im_height : addr_sum_y - im_height;
			end
		end

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) begin
				in_range_t <= 0;
				in_range_b <= 0;
				in_range_l <= 0;
				in_range_r <= 0;
			end else begin
				in_range_t <= addr_sum_y >= 0 ? 1 : 0;
				in_range_b <= addr_sum_y < im_height ? 1 : 0;
				in_range_l <= addr_sum_x >= 0 ? 1 : 0;
				in_range_r <= addr_sum_x < im_width ? 1 : 0;
			end
		end

		assign out_count_x = in_range_l & in_range_r & out_ready ? tmp_sum_x : addr_sp_x;
		assign out_count_y = in_range_t & in_range_b & out_ready ? tmp_sum_y : addr_sp_y;

		if(work_mode == 0) begin
			for (i = 0; i < 2; i = i + 1) begin : buffer
				reg[data_width - 1 : 0] b;
				if(i == 0) begin
					always @(posedge clk)
						b <= in_data;
				end else begin
					always @(posedge clk)
						b <= buffer[i - 1].b;
				end
			end
			assign out_data = out_ready & in_range_t & in_range_b & in_range_l & in_range_r ? buffer[1].b : 0;
		end else begin 
			reg[data_width - 1 : 0] reg_in_data;
			always @(posedge in_enable)
				reg_in_data <= in_data;
			assign out_data = out_ready & in_range_t & in_range_b & in_range_l & in_range_r ? reg_in_data : 0;
		end

	endgenerate

endmodule