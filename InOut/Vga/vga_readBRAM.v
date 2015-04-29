`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/10/31 18:07:26
// Design Name: 
// Module Name: vga_readBRAM
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


module vga_readBRAM(
    input clk25,
    output reg[4:0] vga_red,
    output reg[5:0] vga_green,
    output reg[4:0] vga_blue,
    output reg vga_hsync,
    output reg vga_vsync,
    output [9:0] HCnt,
    output [9:0] VCnt,

    output [16:0] frame_addr,
    input [15:0] vga_in
);
    parameter hRez   = 640;
    parameter hStartSync   = 640+16;
    parameter hEndSync     = 640+16+96;
    parameter hMaxCount    = 800;

    parameter vRez         = 480;
    parameter vStartSync   = 480+10;
    parameter vEndSync     = 480+10+2;
    parameter vMaxCount    = 480+10+2+33;

    parameter hsync_active   =0;
    parameter vsync_active  = 0;

    reg[9:0] hCounter;
    reg[9:0] vCounter;    
    reg[16:0] address;  
    reg blank;

    initial begin
       hCounter = 10'b0;
       vCounter = 10'b0;
       address = 17'b0;   
       blank = 1'b1;   
    end 

    assign frame_addr = address;
    assign HCnt = hCounter;
    assign VCnt = vCounter;
   
    always @(posedge clk25) begin
        if( hCounter == hMaxCount-1 )begin
        		hCounter <=  10'b0;
        		if (vCounter == vMaxCount-1 ) vCounter <=  10'b0;
        		else vCounter <= vCounter+1;
    	end else hCounter <= hCounter+1;

    	if (blank ==0) begin
    		vga_red   <= vga_in[15:11];
    		vga_green <= vga_in[10:5];
    		vga_blue  <= vga_in[4:0];
		end else begin
    		vga_red   <= 0;
    		vga_green <= 0;
    		vga_blue  <= 0;
        end;

    	if (vCounter  >= 360 || vCounter  < 120) begin
    		address <= 17'b0; 
    		blank <= 1;
        end else begin
            if ( hCounter  < 480 && hCounter  >= 160) begin
            	blank <= 0;
            	address <= address+1;
        	end else blank <= 1;
        end;

    	if( hCounter > hStartSync && hCounter <= hEndSync)
    		vga_hsync <= hsync_active;
    	else 
            vga_hsync <= ~ hsync_active;

    	if( vCounter >= vStartSync && vCounter < vEndSync )
    		vga_vsync <= vsync_active;
    	else
    		vga_vsync <= ~ vsync_active;

    end 
endmodule