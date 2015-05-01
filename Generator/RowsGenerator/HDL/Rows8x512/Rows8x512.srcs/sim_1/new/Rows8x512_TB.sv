`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/03/29 14:00:37
// Design Name: Rows
// Module Name: Rows8x512_TB
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
module CLOCK (
	output bit clk
	);
	
	always #(100ps) begin
		clk = ~clk;
	end

endmodule

module Rows8x512_TB();

	//For Rows8x512
	parameter im_width = 320;
	parameter rows_width = 5;
	//Can't be changed in this IP.
	parameter color_width = 8;

	bit clk,rst_n;
	bit in_enable;
	bit[color_width - 1 : 0] in_color;
	bit out_enable;
	bit[color_width * rows_width - 1 : 0] out_color;

	CLOCK CLOCK1(clk);
	Rows8x512 #(im_width,rows_width) Rows1 (clk,rst_n,in_enable,in_color,out_enable,out_color);

	integer fi,fo;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	initial begin
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			$fscanf(fi,"%s",ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		rst_n = 0;
		in_enable = 0;
		repeat(1100) @(posedge clk);
		rst_n = 1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		//in_enable = 1;
		for (int i = 0; i < fsize; i++) begin;
			$display("%m: at time %t ps , start%d !", $time, i);
			ftmp = fname.pop_back();
			fi = $fopen({ftmp,".dat"},"r");
			fo = $fopen({ftmp,".res"},"w");
			//Keep xsize and ysize
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			while (!$feof(fi)) begin 
				@(posedge clk);
				in_enable = 1;
				$fscanf(fi,"%b",in_color);
				if(out_enable == 1)
					$fwrite(fo,"%b\n",out_color);
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule