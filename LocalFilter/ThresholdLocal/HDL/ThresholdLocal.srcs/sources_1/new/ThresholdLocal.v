//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
ThresholdLocal

:Function
Local thresholding by Threshold from filters. 
It will give the first output after 1 cycle while the tow input both enable. 

:Module
Main module

:Version
1.0

:Modified
2015-05-22

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
module ThresholdLocal(
	clk, 
	rst_n, 
	org_enable, 
	org_data, 
	ref_enable, 
	ref_data, 
	out_enable, 
	out_data);

	parameter color_width = 8;
	parameter ref_window_size = 5;
	parameter max_delay = 16;

	input clk, rst_n;
	input org_enable;
	input[ref_window_size * ref_window_size * color_width - 1 : 0] org_data;
	input ref_enable;
	input[color_width - 1 : 0] ref_data;
	output out_enable;
	output out_data;

	reg[3 : 0] con_out;
	reg reg_out_ready;
	reg reg_out_data;

	always @(posedge clk or negedge rst_n or negedge org_enable) begin
		if(~rst_n || ~org_enable)
			con_out <= 0;
		else if(~con_out == max_delay)
			con_out <= con_out;
		else if(~ref_enable)
			con_out <= con_out + 1;
		else
			con_out <= con_out;
	end

	always @(posedge clk or negedge rst_n or negedge ref_enable) begin
		if(~rst_n || ~ref_enable) begin
			reg_out_ready <= 0;
			reg_out_data <= 0;
		end else begin
			reg_out_ready <= 1;
			reg_out_data <= buffer[con_out].o;
		end
	end
	assign out_ready = reg_out_ready;
	assign out_data = out_ready ? reg_out_data : 0;

	genvar i, j;
	generate
		for (i = 0; i < max_delay; i = i + 1) begin : buffer
			reg[color_width - 1 : 0] b;
			reg o[max_delay - 1 : 0];
			if(i == 0) begin 
				always @(posedge clk)
					b <= org_data[((ref_window_size * ref_window_size >> 1) + 1) * color_width - 1 : (ref_window_size * ref_window_size >> 1) * color_width];
			end else begin 
				always @(posedge clk)
					b <= buffer[i - 1].b;
			end	
			always @(*)
				o <= b < ref_data ? 0 : 1;
		end
	endgenerate

endmodule