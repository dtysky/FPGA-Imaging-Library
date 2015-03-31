`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/03/30 13:58:51
// Design Name: Window
// Module Name: Window
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: The lowest color_width-bits of out_data are the top left corner of this window !
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Window(clk, rst_n, in_enable, in_data, out_enable, out_data);

	parameter color_width = 8;
	//Less than 16
	parameter window_size = 3;
	parameter window_size_half = window_size >> 1;

	input clk, rst_n;
	input in_enable;
	input[color_width * window_size - 1 : 0] in_data;
	output out_enable;
	output[color_width * window_size * window_size - 1 : 0] out_data;

	reg reg_out_enable;
	reg[color_width * window_size - 1 : 0] reg_out_data[0 : window_size - 1];
	reg[3 : 0] con_init;

	always @(posedge clk or negedge rst_n) begin
		if(~rst_n || ~in_enable) begin
			con_init <= 0;
			reg_out_enable <= 0;
		end else if(con_init == window_size_half) begin
			con_init <= con_init;
			reg_out_enable <= 1;
		end else begin
			con_init <= con_init + 1;
			reg_out_enable <= 0;
		end
	end

	assign out_enable = reg_out_enable;

	genvar y;
	genvar x;
	generate
		for (y = 0; y < window_size; y = y + 1) begin

			for (x = 0; x < window_size; x = x + 1) begin

				if (x == 0) begin 
					always @(posedge clk or negedge rst_n) begin
						if(~rst_n || ~in_enable) begin
							reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
						end else begin
							reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= in_data[(y + 1) * color_width - 1 : y * color_width];
						end
					end
				end else begin
					always @(posedge clk or negedge rst_n) begin
						if(~rst_n || ~in_enable) begin
							reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= 0;
						end else begin
							reg_out_data[y][(x + 1) * color_width - 1 : x * color_width] <= reg_out_data[y][x * color_width - 1 : (x - 1)* color_width];
						end
					end
				end

			end

			assign out_data[(y + 1) * color_width * window_size - 1 : y * color_width * window_size] = reg_out_data[y];
		
		end
	endgenerate

endmodule
