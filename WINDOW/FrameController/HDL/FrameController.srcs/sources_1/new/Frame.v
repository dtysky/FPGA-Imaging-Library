`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/06 16:25:33
// Design Name: Frame
// Module Name: Frame
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Frame(clk, rst_n, in_enable, in_data, out_enable, out_data, ram_addr);

	//0: write
	//1: read
	parameter mode = 0;
	parameter color_width = 8;
	parameter im_width = 320;
	parameter im_height = 240;
	parameter addr_width = 17;
	parameter ram_read_latency = 1;
	parameter row_init = 0;

	input clk, rst_n;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	output out_enable;
	output[color_width - 1 : 0] out_data;
	output[addr_width - 1 : 0] ram_addr;

	reg[addr_width - 1 : 0] reg_ram_addr;
	reg reg_out_enable;
	reg[color_width - 1 : 0] reg_out_data;

	assign ram_addr = reg_ram_addr;
	assign out_data = ~rst_n || ~in_enable ? 0 : in_data;

	generate

		if(mode == 0) begin

			assign out_enable = ~rst_n || ~in_enable ? 0 : 1;
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable || reg_ram_addr == im_width * im_height - 1)
					reg_ram_addr <= row_init;
				else
					reg_ram_addr <= reg_ram_addr + 1;
			end

		end else begin

			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable || reg_ram_addr == im_width * im_height - 1)
					reg_ram_addr <= 0;
				else
					reg_ram_addr <= reg_ram_addr + 1;
			end
			always @(posedge clk or negedge rst_n or negedge in_enable) begin
				if(~rst_n || ~in_enable)
					reg_out_enable <= 0;
				else if (reg_ram_addr == ram_read_latency)
					reg_out_enable <= 1;
				else
					reg_out_enable <= reg_out_enable;
			end
			assign out_enable = reg_out_enable;

		end

	endgenerate

endmodule