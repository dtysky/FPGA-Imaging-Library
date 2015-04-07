`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: dtysky
// 
// Create Date: 2015/02/05 18:01:07
// Design Name: 
// Module Name: ColorBin2Rgb
// Project Name: 
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


module ColorBin2Rgb(
	input b,
	output[23:0] rgb24
    );

	assign rgb24 = b ? 24'Hffffff : 24'b0;

endmodule