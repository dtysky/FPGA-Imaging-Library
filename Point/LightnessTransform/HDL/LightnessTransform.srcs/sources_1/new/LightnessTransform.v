//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
LightnessTransform

:Function
Change the lightness of an image. 
Give the first output after 2 cycles while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-06

Copyright (C) 2015  Tianyu Dai (dtysky)

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

module LightnessTransform(
	clk,
	rst_n,
	lm_gain,
	in_enable,
	in_data,
	out_ready,
	out_data
    );

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
	::range
	1 - Inf
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
	Gain for luminance, signed. 
	The value must be true code if gain is positive, if negative, must be complemental code.
	*/
	input signed [color_width : 0] lm_gain;
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

	reg[2 : 0] con_enable;

	genvar i;
	generate
		`define h (i + 1) * color_width - 1
		`define l i * color_width
		for (i = 0; i < color_channels; i = i + 1) begin: channel
			wire signed[color_width : 0] in_tmp;

			if(work_mode == 0) begin
				assign in_tmp = {1'b0, in_data[`h : `l]};
			end else begin
				reg signed[color_width : 0] reg_in_tmp;
				always @(posedge in_enable)
					reg_in_tmp = {1'b0, in_data[`h : `l]};
				assign in_tmp = reg_in_tmp;
			end

			reg signed [color_width + 1 : 0] add_s;
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					add_s <= 0;
				else
					add_s <= in_tmp + lm_gain;
			end

			//For overflow
			reg[color_width - 1 : 0] out_buffer;
			always @(posedge clk) begin
				if(add_s[color_width + 1] == 1)
					out_buffer <= 0;
				else if(add_s[color_width] == 1)
					out_buffer <= {color_width{1'b1}};
				else
					out_buffer <= add_s[color_width - 1 : 0];
			end
			assign out_data[`h : `l] = out_ready ? out_buffer : 0;
			
		end
		`undef h
		`undef l

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				con_enable <= 0;
			else if(con_enable == 2)
				con_enable <= con_enable;
			else
				con_enable <= con_enable +1;
		end
		assign out_ready = con_enable == 2 ? 1 : 0; 

	endgenerate

endmodule