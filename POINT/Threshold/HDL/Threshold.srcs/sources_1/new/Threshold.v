/*
Image processing project : Threshold.

Function: Thresholding depend on two threshold,
convert the grayscale image to ternary or binary image.

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

This module is a part of image processing project, you can get all of them here:
	https://github.com/dtysky/Image-processing-on-FPGA

This mail is for connecting me:
	dtysky@outlook.com

My blog is here:
	http://dtysky.moe/
*/

`timescale 1ns / 1ps


module Threshold(clk, rst_n, th1, th2, in_enable, in_data, out_enable, out_data);
	//0 for Base, 1 for Contour, 2 for Ternary
	parameter mode = 0;
	parameter color_width = 8;

	input clk, rst_n;
	input[color_width - 1 : 0] th1, th2;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	output out_enable;
	output[1 : 0] out_data;

	assign out_enable = in_enable;

	generate

		if(mode == 0) 
			assign out_data = in_data > th1 ? 1 : 0; 
		else if(mode == 1)
			assign out_data = in_data > th1 && in_data <= th2 ? 1 : 0;
		else if(mode == 2) begin
			reg[1 : 0] reg_out_data;
			wire[1 : 0] tmp;
			assign tmp[0] = in_data > th1 ? 1 : 0;
			assign tmp[1] = in_data > th2 ? 1 : 0;
			always @(*) begin
				case (tmp)
					2'b00 : reg_out_data <= 0;
					2'b01 : reg_out_data <= 1;
					2'b11 : reg_out_data <= 2;
					default : reg_out_data <= 0;
				endcase
			end
	 		assign out_data = reg_out_data;
	 	end

	endgenerate

endmodule