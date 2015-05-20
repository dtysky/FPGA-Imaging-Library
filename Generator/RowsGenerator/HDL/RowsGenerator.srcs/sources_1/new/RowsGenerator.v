//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
RowsGenerator

:Function
Generate rows cache, **this module just support Pipeline mode now !!!** 
The lowest color_width-bits of out_data are the first row! 
You can configure all fifos by yourself, but fifos in one project whcih have same name must have same configurations. 
And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 ! 
Give the first output after rows_width * (rows_depth + 1) cycles while the input enable.

:Module
Main module

:Version
1.0

:Modified
2015-05-18

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

module RowsGenerator(
	clk,
	rst_n,
	in_enable,
	in_data,
	out_ready,
	out_data
	);

	/*
	::description
	The width of rows.
	::range
	2 - 15
	*/
	parameter[3 : 0] rows_width = 3;
	/*
	::description
	The width of image.
	::range
	1 - 4096
	*/
	parameter im_width = 320;
	/*
	::description
	Color's bit wide.
	::range
	1 - 12
	*/
	parameter[3: 0] color_width = 8;
	/*
	::description
	The bits of width of image.
	::range
	Depend on width of image
	*/
	parameter[4 : 0] im_width_bits = 9;

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
	Input data enable, it works as fifo0's wr_en.
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
	The lowest color_width-bits of this are the first row! 
	*/
	output[rows_width * color_width - 1 : 0] out_data;

	reg reg_row_wr_en[0 : rows_width];
	wire row_wr_en[0 : rows_width];
	wire row_rd_en[0 : rows_width - 1];
	wire[color_width - 1 : 0] row_din[0 : rows_width - 1];
	wire[color_width - 1 : 0] row_dout[0 : rows_width - 1];
	wire[im_width_bits - 1 : 0] row_num[0 : rows_width - 1];

	wire rst = ~rst_n;

	genvar i, j;
	generate
		assign out_ready = row_wr_en[rows_width];

		for (i = 0; i < rows_width; i = i + 1) begin : fifos
			
			assign row_rd_en[i] = row_num[i] == im_width - 1 ? 1 : 0;

			if (i == 0) begin
				assign row_wr_en[i] = in_enable;
				assign row_din[i] = in_data;
			end else begin 
				assign row_din[i] = row_dout[i - 1];
			end

			//One clock delay from fifo read enable to data out
			always @(posedge clk)
				reg_row_wr_en[i + 1] <= row_rd_en[i];
			assign row_wr_en[i + 1] = reg_row_wr_en[i + 1];

			case (color_width)
				1 : 
					/*
					::description
					Fifo which has 1 width and N depth (0 < N < 4096), used for rows cache which color_width is 1. 
					You can configure the fifo by yourself, but all fifos in one project whcih have same name must have same configurations. 
					And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !
					*/
					Fifo1xWidthRows Fifo(
					.clk(clk),
					.rst(rst),
					.din(row_din[i]),
					.wr_en(row_wr_en[i]),
					.rd_en(row_rd_en[i]),
					.dout(row_dout[i]),
					.data_count(row_num[i])
					);
				2, 3, 4 : 
					/*
					::description
					Fifo which has 4 width and N depth (0 < N < 4096), used for rows cache which color_width is 2, 3 and 4. 
					You can configure the fifo by yourself, but all fifos in one project whcih have same name must have same configurations. 
					And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !
					*/
					Fifo4xWidthRows Fifo(
					.clk(clk),
					.rst(rst),
					.din(row_din[i]),
					.wr_en(row_wr_en[i]),
					.rd_en(row_rd_en[i]),
					.dout(row_dout[i]),
					.data_count(row_num[i])
					);
				5, 6, 7, 8 : 
					/*
					::description
					Fifo which has 8 width and N depth (0 < N < 4096), used for rows cache which color_width is 5, 6, 7 and 8. 
					You can configure the fifo by yourself, but all fifos in one project whcih have same name must have same configurations. 
					And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !
					*/
					Fifo8xWidthRows Fifo(
					.clk(clk),
					.rst(rst),
					.din(row_din[i]),
					.wr_en(row_wr_en[i]),
					.rd_en(row_rd_en[i]),
					.dout(row_dout[i]),
					.data_count(row_num[i])
					);
				9, 10, 11, 12 : 
					/*
					::description
					Fifo which has 12 width and N depth (0 < N < 4096), used for rows cache which color_width is 9, 10, 11 and 12. 
					You can configure the fifo by yourself, but all fifos in one project whcih have same name must have same configurations. 
					And you can just change the "Write Depth" and "Fifo Implementation", the Read Latency must be 1 !
					*/
					Fifo12xWidthRows Fifo(
					.clk(clk),
					.rst(rst),
					.din(row_din[i]),
					.wr_en(row_wr_en[i]),
					.rd_en(row_rd_en[i]),
					.dout(row_dout[i]),
					.data_count(row_num[i])
					);
				default : /* default */;
			endcase

			assign out_data[(i + 1) * color_width - 1 : i * color_width] = out_ready ? row_dout[rows_width - 1 - i] : 0;
		
		end

	endgenerate

endmodule