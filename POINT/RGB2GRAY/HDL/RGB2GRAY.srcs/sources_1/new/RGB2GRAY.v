`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: dtysky
// 
// Create Date: 2015/01/30 16:56:39
// Design Name: RGB2GRAY
// Module Name: RGB2GRAY
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


module RGB2GRAY(
	input clk,rst_n,
	input[23:0] rgb,
	output[7:0] gray
    );

	wire[7:0] r,g,b;
	wire[7:0] gray_r,gray_g,gray_b;

	//0.3 = 1/4 + 1/32
	assign gray_r = r>>2 + r>>5;
	//0.6 = 1/2 + 1/8
	assign gray_g = g>>1 + g>>3;
	//0.1 = 1/8
	assign gray_b = b>>3;

	assign gray = gray_r + gray_g + gray_b;

endmodule