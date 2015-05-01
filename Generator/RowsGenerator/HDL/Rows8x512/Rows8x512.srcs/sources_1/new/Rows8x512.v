`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/03/27 16:45:09
// Design Name: Rows
// Module Name: Rows8x512
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: The lowest color_width-bits of out_data are the first row!
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Rows8x512(
	clk,
	rst_n,
	in_enable,
	in_data,
	out_enable,
	out_data
	);
	parameter im_width = 320;
	parameter rows_width = 5;
	//Can't be changed in this IP.
	parameter color_width = 8;

	input clk;
	input rst_n;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	output out_enable;
	output[color_width * rows_width - 1 : 0] out_data;

	wire row_rst = ~rst_n;
	reg reg_row_wr_en[0 : rows_width];
	wire row_wr_en[0 : rows_width];
	wire row_rd_en[0 : rows_width - 1];
	wire[color_width - 1 : 0] row_din[0 : rows_width - 1];
	wire[color_width - 1 : 0] row_dout[0 : rows_width - 1];
	wire[8 : 0] row_num[0 : rows_width - 1];

	reg[color_width - 1 : 0] reg_in_data;

	assign out_enable = row_wr_en[rows_width];

	genvar i;
	generate
		for (i = 0; i < rows_width; i = i + 1) begin : Fifos
			assign row_rd_en[i] = row_num[i] == im_width - 1 ? 1 : 0;

			if (i == 0) begin
				always @(posedge clk)
					reg_in_data = in_data;
				assign row_din[i] = reg_in_data;
				assign row_wr_en[i] = in_enable;
			end else begin
				assign row_din[i] = row_dout[i - 1];
			end

			//One clock delay from fifo read enable to data out
			always @(posedge clk)
				reg_row_wr_en[i + 1] <= row_rd_en[i];
			assign row_wr_en[i + 1] = reg_row_wr_en[i + 1];

			Fifo8x512 f(
				.clk(clk),
				.rst(row_rst),
				.din(row_din[i]),
				.wr_en(row_wr_en[i]),
				.rd_en(row_rd_en[i]),
				.dout(row_dout[i]),
				.data_count(row_num[i])
				);

			assign out_data[(i + 1) * color_width - 1 : i * color_width] = row_dout[rows_width - 1 - i];
		
		end

	endgenerate

endmodule