//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
ContrastTransform

:Function
Change the contrast of an image. 
Give the first output after mul_delay + 1 cycles while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-16

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

module ContrastTransform(
	clk,
	rst_n,
	ct_scale,
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
	Delay for multiplier.
	::range
	Depend your multilpliers' configurations
	*/
	parameter mul_delay = 3;
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
	input[23 : 0] ct_scale;
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

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				con_enable <= 0;
			else if(con_enable == mul_delay + 1)
				con_enable <= con_enable;
			else
				con_enable <= con_enable +1;
		end
		assign out_ready = con_enable == mul_delay + 1 ? 1 : 0; 

		`define h (i + 1) * color_width - 1
		`define l i * color_width
		for (i = 0; i < color_channels; i = i + 1) begin: channel
			wire[11 : 0] mul_a;
			wire[23 : 0] mul_b;
			wire[23 : 0] mul_p;

			if(work_mode == 0) begin
				assign mul_a = in_data[`h : `l];
				assign mul_b = ct_scale;
			end else begin 
				reg[11 : 0] reg_mul_a;
				reg[23 : 0] reg_mul_b;
				always @(posedge in_enable) begin
					reg_mul_a = in_data[`h : `l];
					reg_mul_b = ct_scale;
				end
				assign mul_a = reg_mul_a;
				assign mul_b = reg_mul_b;
			end

			/*
			::description
			Multiplier for Unsigned 12bits x Unsigned 24bits, used for fixed multiplication. 
			You can configure the multiplier by yourself, then change the "mul_delay". 
			All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
			*/
			Multiplier12x24CT Mul(.CLK(clk), .A(mul_a), .B(mul_b), .SCLR(~rst_n), .P(mul_p));

			//For overflow
			reg [color_width - 1 : 0] out_buffer;
			always @(posedge clk) begin
				out_buffer <= mul_p[23 : color_width] != 0 ? 
					{color_width{1'b1}} : 
					mul_p[color_width - 1 : 0];
			end
			assign out_data[`h : `l] = out_ready ? out_buffer : 0;
			
		end
		`undef h
		`undef l


	endgenerate

endmodule