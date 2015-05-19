//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
ContrastTransform

:Function
Get a reversal all ponit's color. 
Give the first output after 1 cycle while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-16

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

module ColorReversal(
	clk,
	rst_n,
	in_enable,
	in_data,
	out_ready,
	out_data);

	/*
	::description
	This module's working mode.
	::range
	0 for Pipelines, 1 for Req-ack
	*/
	parameter[0 : 0] work_mode = 0; 
	/*
	::description
	Channels for color, 1 for gray, 3 for rgb, etc.
	*/
	parameter color_channels = 3;
	/*
	::description
	Color's bit wide
	::range
	1 - 12
	*/
	parameter[3: 0] color_width = 8;
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
	Input data enable, in pipelines mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [color_channels * color_width - 1 : 0] in_data;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output[color_channels * color_width - 1 : 0] out_data;

	reg reg_out_ready;
	reg[color_channels * color_width - 1 : 0] reg_out_data;

	genvar i;
	generate

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n | ~in_enable)
				reg_out_ready <= 0;
			else
				reg_out_ready <= 1;
		end
		assign out_ready = reg_out_ready;

		if(work_mode == 0) begin
			always @(posedge clk)
				reg_out_data <= ~in_data;
		end else begin
			always @(posedge in_enable)
				reg_out_data <= ~in_data;
		end
		assign out_data = out_ready == 0 ? 0 : reg_out_data;

	endgenerate

endmodule