//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
RankFilter

:Function
Local filter - Rank filter, it always used for denoising with preserving edge. 
It will give the first output after sum_stage + 2 cycles while the input enable. 

:Module
Main module

:Version
1.0

:Modified
2015-05-21

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
`define full_win_width window_width * window_width

module RankFifter(
	clk, 
	rst_n, 
	rank, 
	in_enable, 
	in_data, 
	out_ready, 
	out_data);

	/*
	::description
	This module's working mode.
	::range
	0 for Pipeline, 1 for Req-ack
	*/
	parameter[0 : 0] work_mode = 0;
	/*
	::description
	The width(and height) of window.
	::range
	2 - 15
	*/
	parameter[3 : 0] window_width = 3;
	/*
	::description
	Color's bit width.
	::range
	1 - 12
	*/
	parameter[3 : 0] color_width = 8;
	/*
	::description
	Stage of sum.
	::range
	Depend on width of window, int(log8(window_width^2)) + 1
	*/
	parameter[2 : 0] sum_stage = 2;
	/*
	::description
	Width bits of full size of window.
	::range
	Depend on width of window
	*/
	parameter full_win_bits = 4;
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
	Filter's rank, if half of full size of window, this module working as median filter, etc.
	*/
	input[full_win_bits - 1 : 0] rank;
	/*
	::description
	Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
	*/
	input in_enable;
	/*
	::description
	Input data, it must be synchronous with in_enable.
	*/
	input [color_width * window_width * window_width - 1 : 0] in_data;
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
	
	reg[color_width - 1 : 0] reg_in_data[0 : `full_win_width - 1];
	reg[`full_win_width - 1 : 0] big_flag[0 : `full_win_width - 1];
	wire[`full_win_width - 1 : 0] rank_list;
	wire[full_win_bits - 1 : 0] rank_res;
	reg[3 : 0] con_enable;
	reg[color_width - 1 : 0] reg_out_data;

	genvar i, j, k;
	generate

		always @(posedge clk or negedge rst_n or negedge in_enable) begin
			if(~rst_n || ~in_enable) 
				con_enable <= 0;
			else if(con_enable == sum_stage + 3)
				con_enable <= con_enable;
			else
				con_enable <= con_enable + 1;
		end
		assign out_ready = con_enable == sum_stage + 3 ? 1 : 0;

		for (i = 0; i < `full_win_width; i = i + 1) begin
			if(work_mode == 0) begin
				always @(*)
					reg_in_data[i] = in_data[(i + 1) * color_width - 1 : i * color_width];
			end else begin
				always @(posedge in_enable)
					reg_in_data[i] = in_data[(i + 1) * color_width - 1 : i * color_width];
			end
		end

		if(work_mode == 0) begin : pipemode
			for (i = 0; i < sum_stage + 2; i = i + 1) begin : buffer
				reg[color_width - 1 : 0] b[0 : `full_win_width - 1];
				for (j = 0; j < `full_win_width; j = j + 1) begin
					if(i == 0) begin
						always @(posedge clk)
							b[j] <= reg_in_data[j];
					end else begin
						always @(posedge clk)
							b[j] <= buffer[i - 1].b[j];
					end
				end
			end
		end

		for (i = 0; i < `full_win_width; i = i + 1) begin
			always @(posedge clk)
				big_flag[i][i] <= 0;
		end

		for (i = 0; i < `full_win_width; i = i + 1) begin
			for (j = i + 1; j < `full_win_width; j = j + 1) begin
				always @(posedge clk) begin
					if(reg_in_data[i] >= reg_in_data[j]) begin
						big_flag[i][j] <= 1;
						big_flag[j][i] <= 0;
					end else begin 
						big_flag[i][j] <= 0;
						big_flag[j][i] <= 1;
					end
				end
			end
		end

		for (i = 0; i < sum_stage; i = i + 1) begin : pipe
			for (k = 0; k < `full_win_width; k = k + 1) begin : pixel
				reg[((`full_win_width - 1) >> 3 * (sum_stage - i)) + 3 : 0] sum[0 : (`full_win_width - 1) >> 3 * (i + 1)];
				for (j = 0; j < ((`full_win_width - 1) >> 3 * (i + 1)) + 1; j = j + 1) begin
					if(i == 0) begin
						if(`full_win_width - j * 8 >= 8) begin
							always @(posedge clk)
								sum[j] <= big_flag[k][8 * j + 0] + big_flag[k][8 * j + 1] + big_flag[k][8 * j + 2] + big_flag[k][8 * j + 3] + big_flag[k][8 * j + 4] + big_flag[k][8 * j + 5] + big_flag[k][8 * j + 6] + big_flag[k][8 * j + 7];
						end else begin
							case (`full_win_width % 8)
								1 : always @(posedge clk)
										sum[j] <= big_flag[k][8 * j + 0];
								2 : always @(posedge clk)
										sum[j] <= big_flag[k][8 * j + 0] + big_flag[k][8 * j + 1];
								3 : always @(posedge clk)
										sum[j] <= big_flag[k][8 * j + 0] + big_flag[k][8 * j + 1] + big_flag[k][8 * j + 2];
								4 : always @(posedge clk)
										sum[j] <= big_flag[k][8 * j + 0] + big_flag[k][8 * j + 1] + big_flag[k][8 * j + 2] + big_flag[k][8 * j + 3];
								5 : always @(posedge clk)
										sum[j] <= big_flag[k][8 * j + 0] + big_flag[k][8 * j + 1] + big_flag[k][8 * j + 2] + big_flag[k][8 * j + 3] + big_flag[k][8 * j + 4];
								6 : always @(posedge clk)
										sum[j] <= big_flag[k][8 * j + 0] + big_flag[k][8 * j + 1] + big_flag[k][8 * j + 2] + big_flag[k][8 * j + 3] + big_flag[k][8 * j + 4] + big_flag[k][8 * j + 5];
								7 : always @(posedge clk)
										sum[j] <= big_flag[k][8 * j + 0] + big_flag[k][8 * j + 1] + big_flag[k][8 * j + 2] + big_flag[k][8 * j + 3] + big_flag[k][8 * j + 4] + big_flag[k][8 * j + 5] + big_flag[k][8 * j + 6];
								default : /* default */;
							endcase
						end
					end else begin 
						if((`full_win_width >> 3 * i) - j * 8 >= 8) begin
							always @(posedge clk)
								sum[j] <= pipe[i - 1].pixel[k].sum[8 * j + 0] + pipe[i - 1].pixel[k].sum[8 * j + 1] + pipe[i - 1].pixel[k].sum[8 * j + 2] + pipe[i - 1].pixel[k].sum[8 * j + 3] + pipe[i - 1].pixel[k].sum[8 * j + 4] + pipe[i - 1].pixel[k].sum[8 * j + 5] + pipe[i - 1].pixel[k].sum[8 * j + 6] + pipe[i - 1].pixel[k].sum[8 * j + 7];
						end else begin
							case ((`full_win_width >> 3 * i) % 8 + 1)
								1 : always @(posedge clk)
										sum[j] <= pipe[i - 1].pixel[k].sum[8 * j + 0];
								2 : always @(posedge clk)
										sum[j] <= pipe[i - 1].pixel[k].sum[8 * j + 0] + pipe[i - 1].pixel[k].sum[8 * j + 1];
								3 : always @(posedge clk)
										sum[j] <= pipe[i - 1].pixel[k].sum[8 * j + 0] + pipe[i - 1].pixel[k].sum[8 * j + 1] + pipe[i - 1].pixel[k].sum[8 * j + 2];
								4 : always @(posedge clk)
										sum[j] <= pipe[i - 1].pixel[k].sum[8 * j + 0] + pipe[i - 1].pixel[k].sum[8 * j + 1] + pipe[i - 1].pixel[k].sum[8 * j + 2] + pipe[i - 1].pixel[k].sum[8 * j + 3];
								5 : always @(posedge clk)
										sum[j] <= pipe[i - 1].pixel[k].sum[8 * j + 0] + pipe[i - 1].pixel[k].sum[8 * j + 1] + pipe[i - 1].pixel[k].sum[8 * j + 2] + pipe[i - 1].pixel[k].sum[8 * j + 3] + pipe[i - 1].pixel[k].sum[8 * j + 4];
								6 : always @(posedge clk)
										sum[j] <= pipe[i - 1].pixel[k].sum[8 * j + 0] + pipe[i - 1].pixel[k].sum[8 * j + 1] + pipe[i - 1].pixel[k].sum[8 * j + 2] + pipe[i - 1].pixel[k].sum[8 * j + 3] + pipe[i - 1].pixel[k].sum[8 * j + 4] + pipe[i - 1].pixel[k].sum[8 * j + 5];
								7 : always @(posedge clk)
										sum[j] <= pipe[i - 1].pixel[k].sum[8 * j + 0] + pipe[i - 1].pixel[k].sum[8 * j + 1] + pipe[i - 1].pixel[k].sum[8 * j + 2] + pipe[i - 1].pixel[k].sum[8 * j + 3] + pipe[i - 1].pixel[k].sum[8 * j + 4] + pipe[i - 1].pixel[k].sum[8 * j + 5] + pipe[i - 1].pixel[k].sum[8 * j + 6];
								default : /* default */;
							endcase
						end
					end
				end
			end
		end

		for (i = 0; i < `full_win_width; i = i + 1) begin
			assign rank_list[i] = pipe[sum_stage - 1].pixel[i].sum[0] == rank ? 1 : 0;
		end
		Encoder #(window_width, full_win_bits) ED(rank_list, rank_res);

		if(work_mode == 0) begin
			always @(posedge clk) reg_out_data <= pipemode.buffer[sum_stage + 1].b[rank_res];
		end else begin 
			always @(posedge clk) reg_out_data <= reg_in_data[rank_res];
		end
		assign out_data = out_ready ? reg_out_data : 0;

	endgenerate
endmodule
`undef full_win_width