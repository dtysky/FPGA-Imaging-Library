`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/08/30 11:01:22
// Design Name: 
// Module Name: bram
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


module Bram1x320x240(
input dina,
input [16:0] addra,
input clka,wea,clkb,
output doutb,
input [16:0] addrb

    );
    
BlcokRam1x320x240 u_fb(
        .clka ( clka),
        .wea  (wea),
        .addra( addra),
        .dina ( dina),
         
        .clkb ( clkb),
       .addrb ( addrb),
        .doutb ( doutb)
      );
endmodule
