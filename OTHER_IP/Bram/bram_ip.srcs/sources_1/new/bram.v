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


module bram(
input [15:0] dina,
input [16:0] addra,
input clka,wea,clkb,
output [15:0] doutb,
input [16:0] addrb

    );
    
frame_buffer u_fb(
        .clka ( clka),
        .wea  (wea),
        .addra( addra),
        .dina ( dina),
         
        .clkb ( clkb),
       .addrb ( addrb),
        .doutb ( doutb)
      );
endmodule
