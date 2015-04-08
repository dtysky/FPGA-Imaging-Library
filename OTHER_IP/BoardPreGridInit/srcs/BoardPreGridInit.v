`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/07 18:01:07
// Design Name: BoardPreGridInit
// Module Name: BoardPreGridInit
// Project Name: Image processing project
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependenrgb24es: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BoardPreGridInit(
	input clk,
	input rst_n,
	input pll_locked,
	output rst_all_n,
	output mode_erosion,
	output mode_dilation,
	output[8 : 0] dilation0,
	output[24 : 0] erosion0,
	output[8 : 0] erosion1,
	output[8 : 0] erosion2,
	output[8 : 0] erosion3,
	output[8 : 0] erosion4,
	output[8 : 0] match0,
	output[7 : 0] harris_th
	);

	parameter init_delay = 2000;
	parameter harris_th_p = 5;

	assign mode_erosion = 0;
	assign mode_dilation = 1;
	assign dilation0 = 9'b111111111;
	assign erosion0 = 25'b1111111111111111111111111;
	assign erosion1 = 9'b000011000;
	assign erosion2 = 9'b000010010;
	assign erosion3 = 9'b000010001;
	assign erosion4 = 9'b000010100;
	assign match0 = 9'b000010000;
	assign harris_th = harris_th_p;

	reg[15 : 0] con_init;
	initial con_init = 0;
	
	always @(posedge clk or negedge rst_n or negedge pll_locked) begin
		if(~rst_n || ~pll_locked)
			con_init <= 0;
		else if(con_init == init_delay)
			con_init <= con_init;
		else
			con_init <= con_init + 1;
	end

	assign rst_all_n = con_init == init_delay ? 1 : 0;

endmodule