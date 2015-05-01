`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: dtysky
// 
// Create Date: 2015/02/05 18:01:07
// Design Name: 
// Module Name: Or8
// Project Name: 
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


module Or8(i0, i1, i2, i3, i4, i5, i6, i7, o);
	
	input i0;
	input i1;
	input i2;
	input i3;
	input i4;
	input i5;
	input i6;
	input i7;
	output o;

	assign o = {i0, i1, i2, i3, i4, i5, i6, i7} == 0 ? 0 : 1; 

endmodule