`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/01/31 21:02:04
// Design Name: GRAY2BIN
// Module Name: GRAY2BIN
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

module GRAY2BIN(
	input[7:0] gray,
	output b
    );
	parameter th = 128;

	assign b = gray<th ? 0 : 1;

endmodule