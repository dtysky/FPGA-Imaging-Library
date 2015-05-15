//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Threshold

:Function
Convert gray-scales image to binary images.  
Give the first output after 1 cycles while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-15

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


module Threshold(
	clk,
	rst_n,
	th_mode,
	th1,
	th2,
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
	The method for processing.
	::range
	0 for Base, 1 for Contour
	*/
	input th_mode;
	/*
	::description
	First thorshold, used for all methods.
	*/
	input [color_width - 1 : 0] th1;
	/*
	::description
	Second thorshold, only used for "Contour" method.
	*/
	input [color_width - 1 : 0] th2;
	/*
	::description
	Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [color_width - 1 : 0] in_data;
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

	generate

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) begin
				reg_out_ready <= 0;
			end else begin
				reg_out_ready <= 1;
			end
		end

		if(work_mode == 0) begin 

			always @(posedge clk) begin
				case (th_mode)
					0 : reg_out_data <= in_data > th1 ? 1 : 0;
					1 : reg_out_data <= in_data > th1 && in_data <= th2 ? 1 : 0;
					default : /* default */;
				endcase
			end

		end else begin

			always @(posedge in_enable) begin
				case (th_mode)
					0 : reg_out_data <= in_data > th1 ? 1 : 0;
					1 : reg_out_data <= in_data > th1 && in_data <= th2 ? 1 : 0;
					default : /* default */;
				endcase
			end

		end

		assign out_ready = reg_out_ready;
		assign out_data = out_ready == 0 ? 0 : reg_out_data;

	endgenerate

endmodule