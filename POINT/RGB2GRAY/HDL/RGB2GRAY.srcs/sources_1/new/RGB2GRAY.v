`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Dai Tianyu (dtysky)
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
	input[23:0] rgb,
	output[7:0] gray
    );

	wire[7:0] r,g,b;
	wire[7:0] gray_r,gray_g,gray_b;

	assign r = rgb[23:16];
	assign g = rgb[15:8];
	assign b = rgb[7:0];

	//0.3 = 1/4 + 1/32
	assign gray_r = {2'b0,r[7:2]} + {5'b0,r[7:5]};
	//0.6 = 1/2 + 1/16
	assign gray_g = {1'b0,g[7:1]} + {4'b0,g[7:4]};
	//0.1 = 1/8
	assign gray_b = {3'b0,b[7:3]};

	assign gray = gray_r + gray_g + gray_b;

endmodule