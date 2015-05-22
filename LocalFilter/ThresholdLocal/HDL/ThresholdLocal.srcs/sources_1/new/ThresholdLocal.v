//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
ThresholdLocal

:Function
Local thresholding by Threshold from filters. 
It will give the first output after 1 cycle while the tow input both enable. 
ref_enable must enable after in_enable !

:Module
Main module

:Version
1.0

:Modified
2015-05-22

Copyright (C) 2015 Tianyu Dai (dtysky) <dtysky@outlook.com>

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

module ThresholdLocal(
	clk, 
	rst_n, 
	in_enable, 
	in_data, 
	ref_enable, 
	ref_data, 
	out_ready, 
	out_data);

	/*
	::description
	This module's working mode.
	::range
	0 for Pipline, 1 for Req-ack
	*/
	parameter[0 : 0] work_mode = 0;
	/*
	::description
	The width(and height) of input window, if input is not a window, set it to 1.
	::range
	1 - 15
	*/
	parameter[3 : 0] in_window_width = 1;
	/*
	::description
	Color's bit width.
	::range
	1 - 12
	*/
	parameter[3 : 0] color_width = 8;
	/*
	::description
	The possible max cycles from in_enable to ref_enable.
	*/
	parameter max_delay = 8;
	/*
	::description
	Width bits of max delay.
	::range
	Depend on max delay
	*/
	parameter max_delay_bits = 4;

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
	Filter's rank, if half of full size of window, this module working as median filter, etc.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [color_width * in_window_width * in_window_width - 1 : 0] in_data;
	/*
	::description
	Threshold enable.
	*/
	input ref_enable;
	/*
	::description
	Threshold, used as threshold for thresholding, it must be synchronous with ref_enable.
	*/
	input[color_width - 1 : 0] ref_data;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output out_data;

	reg reg_out_ready;
	reg reg_out_data;
	reg[max_delay_bits - 1 : 0] con_out;

	genvar i, j;
	generate

		if(work_mode == 0) begin
			reg[color_width - 1 : 0] buffer[0 : max_delay - 1];
			wire[max_delay - 1 : 0] res;
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_out <= 0;
				else if(con_out == max_delay)
					con_out <= con_out;
				else if(~ref_enable)
					con_out <= con_out + 1;
				else
					con_out <= con_out;
			end
			always @(posedge clk or negedge rst_n or negedge ref_enable) begin
				if(~rst_n || ~ref_enable) begin
					reg_out_ready <= 0;
					reg_out_data <= 0;
				end else begin
					reg_out_ready <= 1;
					reg_out_data <= res[con_out - 1];
				end
			end
			for (i = 0; i < max_delay; i = i + 1) begin
				if(i == 0) begin 
					always @(posedge clk)
						buffer[i] <= in_data[((in_window_width * in_window_width >> 1) + 1) * color_width - 1 : (in_window_width * in_window_width >> 1) * color_width];
				end else begin 
					always @(posedge clk)
						buffer[i] <= buffer[i - 1];
				end
				assign res[i] = buffer[i] < ref_data ? 0 : 1;
			end
		end else begin 
			always @(posedge clk or negedge rst_n or negedge ref_enable) begin
				if(~rst_n || ~ref_enable) begin
					reg_out_ready <= 0;
					reg_out_data <= 0;
				end else begin
					reg_out_ready <= 1;
					reg_out_data <= in_data < ref_data ? 0 : 1;
				end
			end
		end

		assign out_ready = reg_out_ready;
		assign out_data = reg_out_data;
	endgenerate

endmodule