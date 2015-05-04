/*
Image processing project : ColorReversal.

Function: Get a reversal all ponit's color.

Main module.

Copyright (C) 2015  Dai Tianyu (dtysky)

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

	parameter channels = 3;
	parameter color_width = 8;
	
	input clk, rst_n;
	input in_enable;
	input[channels * color_width - 1 : 0] in_data;
	output out_ready;
	output[channels * color_width - 1 : 0] out_data;

	reg reg_out_ready;
	assign out_ready = reg_out_ready;
	reg[channels * color_width - 1 : 0] reg_out_data;
	assign out_data = reg_out_data;
	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n | ~in_enable) begin
			reg_out_ready <= 0;
			reg_out_data <= 0;
		end else begin
			reg_out_ready <= 1;
			reg_out_data <= ~in_data;
		end
	end

endmodule