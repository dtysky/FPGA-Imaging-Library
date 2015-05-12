//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
ContrastTransform

:Function
For controlling a block ram from xilinx.
Give the first output after ram_read_latency cycles while the input enable.

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


module FrameController(
	clk,
	rst_n,
	in_enable,
	in_data,
	out_ready,
	out_data,
	ram_addr);

	parameter work_mode = 0;
	//0 for Write, 1 for Read
	parameter wr_mode = 0;
	parameter color_width = 8;
	parameter im_width = 320;
	parameter im_height = 240;
	parameter addr_width = 17;
	parameter ram_read_latency = 1;
	parameter row_init = 0;

	input clk;
	input rst_n;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	output out_ready;
	output[color_width - 1 : 0] out_data;
	output[addr_width - 1 : 0] ram_addr;

	reg[addr_width - 1 : 0] reg_ram_addr;
	reg reg_out_ready;

	assign ram_addr = reg_ram_addr;
	assign out_data = out_ready ? in_data : 0;

	generate

		if(wr_mode == 0) begin

			if(work_mode == 0) begin
				always @(posedge clk or negedge rst_n or negedge in_enable) begin
					if(~rst_n || ~in_enable)
						reg_ram_addr <= row_init * im_width;
					else if(reg_ram_addr == im_width * im_height - 1)
						reg_ram_addr <= 0;
					else
						reg_ram_addr <= reg_ram_addr + 1;
				end
			end else begin 
				always @(posedge in_enable or negedge rst_n) begin
					if(~rst_n)
						reg_ram_addr <= row_init * im_width;
					else if(reg_ram_addr == im_width * im_height - 1)
						reg_ram_addr <= 0;
					else
						reg_ram_addr <= reg_ram_addr + 1;
				end
			end
			assign out_enable = ~rst_n || ~in_enable ? 0 : 1;

		end else begin

			if(work_mode == 0) begin
				always @(posedge clk or negedge rst_n or negedge in_enable) begin
					if(~rst_n || ~in_enable)
						reg_ram_addr <= 0;
					else if(reg_ram_addr == im_width * im_height - 1)
						reg_ram_addr <= 0;
					else
						reg_ram_addr <= reg_ram_addr + 1;
				end
			end else begin 
				always @(posedge in_enable or negedge rst_n) begin
					if(~rst_n)
						reg_ram_addr <= 0;
					else if(reg_ram_addr == im_width * im_height - 1)
						reg_ram_addr <= 0;
					else
						reg_ram_addr <= reg_ram_addr + 1;
				end
			end

			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					reg_out_ready <= 0;
				else if (reg_ram_addr == ram_read_latency)
					reg_out_ready <= 1;
				else
					reg_out_ready <= reg_out_ready;
			end
			assign out_ready = reg_out_ready;

		end

	endgenerate

endmodule