//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Graying

:Function
Covert RGB images to gray-scale images. 
Users can configure the multipliers by themselves. 
Give the first output after mul_delay + 2 cycles while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-12

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
	0 for Pipeline, 1 for Req-ack
	*/
	parameter work_mode = 0;
	/*
	::description
	Color's bit width.
	::range
	1 - 12
	*/
	parameter color_width = 8;
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
	Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.
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
		Multiplier for Unsigned 12bits x 0.299, used for red channel. 
		You can configure the multiplier by yourself, then change the "mul_delay". 
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		MultiplierRedx0d299 MulRed(.CLK (clk), .A({{12 - color_width{1'b0}} ,r}), .SCLR(~rst_n), .P(mul_r));
		/*
		::description
		Multiplier for Unsigned 12bits x 0.587, used for green channel.
		You can configure the multiplier by yourself, then change the "mul_delay".
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		MultiplierGreenx0d587 MulGreen(.CLK (clk), .A({{12 - color_width{1'b0}} ,g}), .SCLR(~rst_n), .P(mul_g));
		/*
		::description
		Multiplier for Unsigned 12bits x 0.114, used for blue channel.
		You can configure the multiplier by yourself, then change the "mul_delay".
		All Multiplier's pipeline stage must be same, you can not change the ports' configurations!
		*/
		MultiplierBluex0d114 MulBlue(.CLK (clk), .A({{12 - color_width{1'b0}} ,b}), .SCLR(~rst_n), .P(mul_b));

		reg[11 : 0] mul_g_buffer;
		reg[color_width - 1 : 0] sum_tmp;
		always @(posedge clk) begin
			mul_g_buffer <= mul_g;
			sum_tmp <= mul_r + mul_b;
		end
		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) begin
				reg_out_data <= 0;
			end else begin
				reg_out_data <= sum_tmp + mul_g_buffer;
			end
		end
		assign out_data = out_ready ? reg_out_data : 0;

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable)
				con_enable <= 0;
			else if(con_enable == mul_delay + 2)
				con_enable <= con_enable;
			else
				con_enable <= con_enable + 1;
		end
		assign out_ready = con_enable == mul_delay + 2 ? 1 : 0; 

	endgenerate

endmodule