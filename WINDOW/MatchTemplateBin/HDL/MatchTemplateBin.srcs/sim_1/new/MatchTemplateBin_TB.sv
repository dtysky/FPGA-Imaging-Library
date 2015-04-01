`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/01 22:18:04
// Design Name: MatchTemplateBin
// Module Name: MatchTemplateBin_TB
// Project Name: Image processing project
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
module CLOCK (
	output bit clk
	);
	
	always #(100ps) begin
		clk = ~clk;
	end

endmodule

module MatchTemplateBin_TB( );
	//For Rows8x512
	parameter im_width = 320;
	parameter rows_width = 3;
	//For Window
	parameter window_size = 3;
	//Can't be changed in this IP.
	parameter color_width = 1;

	bit clk,rst_n;
	bit[color_width - 1 : 0] in_color;
	bit row_enable;
	bit[color_width * rows_width - 1 : 0] out_color;

	bit[color_width * window_size * window_size - 1 : 0] win_data;
	bit win_enable;

	bit[color_width * window_size * window_size - 1 : 0] template = 9'b000010000;
	bit out_data;

	CLOCK CLOCK1(clk);
	Rows1x512 #(im_width,rows_width) Rows1 (clk, rst_n, in_color, row_enable, out_color);
	Window #(color_width,window_size) Window1(clk, rst_n, row_enable, out_color, win_enable, win_data);
	MatchTemplateBin #(window_size) MTB1(template, win_data, out_data);

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
		repeat(1100) @(posedge clk);
		rst_n = 1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		for (int i = 0; i < fsize; i++) begin;
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
				$fscanf(fi,"%b",in_color);
				if(win_enable)
					$fwrite(fo,"%d\n",out_data);
				if(win_data == template)
					$display("time %0d matched!", $time);
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end
endmodule