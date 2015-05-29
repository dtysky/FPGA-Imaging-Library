/*
:Project
FPGA-Imaging-Library

:Design
FrameController

:Function
For controlling a BlockRAM from xilinx.
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

	/*
	::description
	This module's working mode.
	::range
	0 for Pipline, 1 for Req-ack
	*/
	parameter work_mode = 0;
	/*
	::description
	This module's WR mode.
	::range
	0 for Write, 1 for Read
	*/
	parameter wr_mode = 0;
	/*
	::description
	Data bit width. 
	*/
	parameter data_width = 8;
	/*
	::description
	Width of image.
	::range
	1 - 4096
	*/
	parameter im_width = 320;
	/*
	::description
	Height of image.
	::range
	1 - 4096
	*/
	parameter im_height = 240;
	/*
	::description
	Address bit width of a ram for storing this image.
	::range
	Depend on im_width and im_height.
	*/
	parameter addr_width = 17;
	/*
	::description
	RL of RAM, in xilinx 7-series device, it is 2.
	::range
	0 - 15, Depend on your using ram.
	*/
	parameter ram_read_latency = 2;
	/*
	::description
	The first row you want to storing, used for eliminating offset.
	::range
	Depend on your input offset.
	*/
	parameter row_init = 0;
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
	Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [data_width - 1 : 0] in_data;
	/*
	::description
	Output data ready, in both two mode, it will be high while the out_data can be read.
	*/
	output out_ready;
	/*
	::description
	Output data, it will be synchronous with out_ready.
	*/
	output[data_width - 1 : 0] out_data;
	/*
	::description
	Address for ram.
	*/
	output[addr_width - 1 : 0] ram_addr;

	reg[addr_width - 1 : 0] reg_ram_addr;
	reg[3 : 0] con_ready;

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
						reg_ram_addr <= row_init * im_width - 1;
					else if(reg_ram_addr == im_width * im_height - 1)
						reg_ram_addr <= 0;
					else
						reg_ram_addr <= reg_ram_addr + 1;
				end
			end
			assign out_ready = ~rst_n || ~in_enable ? 0 : 1;

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
						reg_ram_addr <= 0 - 1;
					else if(reg_ram_addr == im_width * im_height - 1)
						reg_ram_addr <= 0;
					else
						reg_ram_addr <= reg_ram_addr + 1;
				end
			end

			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					con_ready <= 0;
				else if (con_ready == ram_read_latency)
					con_ready <= con_ready;
				else
					con_ready <= con_ready + 1;
			end
			assign out_ready = con_ready == ram_read_latency ? 1 : 0;

		end

	endgenerate

endmodule