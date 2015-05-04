/*
Image processing project : ContrastTransform.

Function: Change contrast of an image.

Main module.

Version: 1.0

Modified: 2015-05-05

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

module ContrastTransform(
	clk,
	rst_n,
	ct_scale,
	in_enable,
	in_data,
	out_ready,
	out_data
    );

	// 1 - 12
	parameter color_width = 8;
	// 0 for Piplines, 1 for Req-ack
	parameter work_mode = 0; 
	// 0 for Multiplier, 1 for LUTs
	parameter multiplier_mode = 0;

	input clk, rst_n;
	// 12bits.12bits
	// 2^-12 - 2^12
	input[23 : 0] ct_scale;
	input in_enable;
	input [color_width - 1 : 0] in_data;
	output out_ready;
	output[color_width - 1 : 0] out_data;

	wire[11 : 0] mul_a;
	wire[23 : 0] mul_b;
	wire[35 : 0] mul_p;
	reg[2 : 0] con_enable;

	generate

		if(work_mode == 0) begin
			assign mul_a = in_data;
		end else begin 
			assign mul_a = in_enable ? in_data : mul_a;
		end

		if(multiplier_mode == 0) begin
			Multiplier12x24Mul Mul1(clk, mul_a, mul_b, rst_n, mul_p);
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_enable <= 0;
				else if(con_enable == 3)
					con_enable <= con_enable;
				else
					con_enable <= con_enable +1;
			end
			assign out_ready = con_enable == 3 ? 1 : 0; 
		end else begin
			Multiplier12x24LUT Mul1(clk, mul_a, mul_b, rst_n, mul_p);
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_enable <= 0;
				else if(con_enable == 5)
					con_enable <= con_enable;
				else
					con_enable <= con_enable +1;
			end
			assign out_ready = con_enable == 5 ? 1 : 0; 
		end

	endgenerate

	assign out_data = mul_p[color_width + 12 - 1 : 12];

endmodule