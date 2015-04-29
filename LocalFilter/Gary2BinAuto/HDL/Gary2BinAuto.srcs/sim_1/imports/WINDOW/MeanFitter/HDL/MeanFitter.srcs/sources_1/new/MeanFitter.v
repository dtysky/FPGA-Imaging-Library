`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/03/31 15:59:20
// Design Name: MeanFitter
// Module Name: MeanFitter
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: The window size must be less than 16 !
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define full_win_size window_size * window_size

module MeanFitter(clk, rst_n, in_enable, in_data, out_enable, out_data);

	parameter color_width = 8;
	//Less than 16
	parameter window_size = 5;
	// The highest bit of full_win_size, the lowest bit is "0"
	// 1 : 0;
	// 2 : 1;
	// 3 : 3;
	// 4 : 4;
	// 5 : 4;
	// 6 : 5;
	// 7 : 5;
	// 8 : 6;
	// 9 : 6;
	// 10 : 6;
	// 11 : 6;
	// 12 : 7;
	// 13 : 7;
	// 14 : 8;
	// 15 : 8;
	// 16 : 8;
	parameter sum_counter = 4;

	input clk;
	input rst_n;
	input in_enable;
	input[color_width * window_size * window_size - 1 : 0] in_data;
	output out_enable;
	output[color_width - 1 : 0] out_data;

	wire[color_width + `full_win_size - 1 : 0] sum_all;
	reg[3 : 0] con_enable;

	always @(posedge clk or negedge rst_n or negedge in_enable) begin
		if(~rst_n || ~in_enable) 
			con_enable <= 0;
		else if(con_enable == sum_counter)
			con_enable <= con_enable;
		else
			con_enable <= con_enable + 1;
	end

	assign out_enable = con_enable == sum_counter ? 1 : 0;

	genvar i;
	genvar j;
	generate

		for (i = 0; i < sum_counter; i = i + 1) begin : pip
			reg[color_width + `full_win_size - 1 : 0] sum[0 : (`full_win_size >> i + 1) - 1];
			for (j = 0; j < `full_win_size >> i + 1; j = j + 1) begin
				if(i == 0) begin

					if(j == 0 && ((`full_win_size >> i) % 2 != 0)) begin
						always @(posedge clk)
							sum[j] <= 
								in_data[`full_win_size * color_width - 1 : (`full_win_size - 1) * color_width] +
								in_data[(2 * j + 1) * color_width - 1 : (2 * j) * color_width] +
								in_data[(2 * j + 2) * color_width - 1 : (2 * j + 1) * color_width];
					end else begin
						always @(posedge clk)
							sum[j] <= 
								in_data[(2 * j + 1) * color_width - 1 : (2 * j) * color_width] +
								in_data[(2 * j + 2) * color_width - 1 : (2 * j + 1) * color_width];
					end


				end else begin 

					if(j == 0 && ((`full_win_size >> i) % 2 != 0)) begin
						always @(posedge clk)
							sum[j] <= pip[i - 1].sum[(`full_win_size >> i) - 1] + pip[i - 1].sum[2 * j] + pip[i - 1].sum[2 * j + 1];
					end else begin
						always @(posedge clk)
							sum[j] <= pip[i - 1].sum[2 * j] + pip[i - 1].sum[2 * j + 1];
					end
				end

			end
		end

		assign sum_all = ~rst_n || ~in_enable ? 0 : pip[sum_counter - 1].sum[0];

		case (window_size)
		 	1 : assign out_data = sum_all;
		 	2 : assign out_data = sum_all >> 2;
		 	3 : assign out_data = (sum_all >> 4) + (sum_all >> 5) + (sum_all >> 6);
		 	4 : assign out_data = sum_all >> 4;
		 	5 : assign out_data = (sum_all >> 5) + (sum_all >> 7);
		 	6 : assign out_data = (sum_all >> 6) + (sum_all >> 7) + (sum_all >> 8);
		 	7 : assign out_data = (sum_all >> 6) + (sum_all >> 8);
		 	8 : assign out_data = sum_all >> 6;
		 	9 : assign out_data = (sum_all >> 7) + (sum_all >> 8) + (sum_all >> 10);
		 	10 : assign out_data = (sum_all >> 7) + (sum_all >> 9);
		 	11 : assign out_data = (sum_all >> 7) + (sum_all >> 10);
		 	12 : assign out_data = (sum_all >> 8) + (sum_all >> 9) + (sum_all >> 10);
		 	13 : assign out_data = (sum_all >> 8) + (sum_all >> 9);
		 	14 : assign out_data = (sum_all >> 8) + (sum_all >> 10);
		 	15 : assign out_data = (sum_all >> 8) + (sum_all >> 11);
		 	16 : assign out_data = sum_all >> 8;
		 	default : /* default */;
		 endcase

	endgenerate
endmodule