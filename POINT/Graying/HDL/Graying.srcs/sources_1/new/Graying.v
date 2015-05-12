//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Graying

:Function
Covert RGB images to gray-scale images.
Give the first output after 2 cycles while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-12

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


module Graying(
	clk,
	rst_n,
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
	parameter work_mode = 0;
	/*
	::description
	Color's bit wide
	::range
	1 - 12
	*/
	parameter color_width = 8;

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
	Scale for contrast, fixed, 12bits.12bits.
	*/
	/*
	::description
	Input data enable, in pipelines mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [3 * color_width - 1 : 0] in_data;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output[color_width - 1 : 0] out_data;

	reg[color_width - 1 : 0] reg_out_data;
	reg[color_width - 1 : 0] r, g, b;
	wire[10 : 0] mul_r;
	wire[11 : 0] mul_g;
	wire[8 : 0] mul_b;
	reg[2 : 0] con_enable;

	genvar i;
	generate

		if(work_mode == 0) begin
			always @(*) begin
				r = in_data[3 * color_width - 1 : 2 * color_width];
				g = in_data[2 * color_width - 1 : 1 * color_width];
				b = in_data[1 * color_width - 1 : 0 * color_width]; 
			end
		end else begin
			always @(posedge in_enable) begin
				r = in_data[3 * color_width - 1 : 2 * color_width];
				g = in_data[2 * color_width - 1 : 1 * color_width];
				b = in_data[1 * color_width - 1 : 0 * color_width];
			end
		end
	
		/*
		::description
		Multiplier for Unsigned 12bits x 0.299, used for Red channel.
		The pipline stages is 2.
		*/
		MultiplierRedx0d299 MulRed(clk, {{12 - color_width{1'b0}} ,r}, ~rst_n, mul_r);
		/*
		::description
		Multiplier for Unsigned 12bits x 0.587, used for Red channel.
		The pipline stages is 2.
		*/
		MultiplierGreenx0d587 MulGreen(clk, {{12 - color_width{1'b0}} ,g}, ~rst_n, mul_g);
		/*
		::description
		Multiplier for Unsigned 12bits x 0.114, used for Red channel.
		The pipline stages is 2.
		*/
		MultiplierBluex0d114 MulBlue(clk, {{12 - color_width{1'b0}} ,b}, ~rst_n, mul_b);

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) begin
				reg_out_data <= 0;
			end else begin
				reg_out_data <= mul_r + mul_g + mul_b;
			end
		end
		assign out_data = out_ready ? reg_out_data : 0;

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				con_enable <= 0;
			else if(con_enable == 3)
				con_enable <= con_enable;
			else
				con_enable <= con_enable +1;
		end
		assign out_ready = con_enable == 3 ? 1 : 0; 

	endgenerate

endmodule