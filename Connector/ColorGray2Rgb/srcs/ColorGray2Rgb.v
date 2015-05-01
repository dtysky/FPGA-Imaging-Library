`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: dtysky
// 
// Create Date: 2015/02/05 18:01:07
// Design Name: 
// Module Name: ColorGray2Rgb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependengrayes: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ColorGray2Rgb(
	input[7:0] gray,
	output[23:0] rgb24
    );

	assign rgb24 = {gray,gray,gray};

endmodule