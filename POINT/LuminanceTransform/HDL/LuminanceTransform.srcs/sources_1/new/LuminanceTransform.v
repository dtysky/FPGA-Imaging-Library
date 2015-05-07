//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
LuminanceTransform

:Function
Change the luminance of an image.
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

module LuminanceTransform(
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
	0 for Piplines, 1 for Req-ack
	*/
	parameter[0 : 0] work_mode = 0; 
	/*
	::description
	Channels for color, 1 for gray, 3 for rgb, etc.
	::range
	1 - Inf
	*/
	parameter color_mode = 3;
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
	If positive must be true code, if negative, must be complemental code.
	*/
	input signed [12 : 0] lm_gain;
	/*
	::description
	Input data enable, in pipelines mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [color_mode * color_width - 1 : 0] in_data;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output[color_mode * color_width - 1 : 0] out_data;

	reg[2 : 0] con_enable;

	genvar i;
	generate
		`define h (i + 1) * color_width - 1
		`define l i * color_width
		for (i = 0; i < color_mode; i = i + 1) begin: channel
			wire signed [12 : 0] add_a, add_b;
			wire signed [13 : 0] add_s;

			if(work_mode == 0) begin
				assign add_a = {{13 - color_width{1'b0}} ,in_data[`h : `l]};
				assign add_b = lm_gain;
			end else begin 
				reg signed [12 : 0] reg_add_a, reg_add_b;
				always @(posedge in_enable) begin
					reg_add_a = {{13 - color_width{1'b0}} ,in_data[`h : `l]};
					reg_add_b = lm_gain;
				end
				assign add_a = reg_add_a;
				assign add_b = reg_add_b;
			end
			/*
			::description
			Adder for Signed 12bits + Signed 12bits.
			The pipline stages is 2.
			*/
			AddSub13Sx13S Adder(add_a, add_b, clk, add_s);

			//For overflow
			reg[color_width - 1 : 0] out_buffer;
			always @(posedge add_s) begin
				if(add_s < 0)
					out_buffer <= 0;
				else if(add_s[13 : color_width] != 0)
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