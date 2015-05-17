`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/01 13:58:51
// Design Name: Harris
// Module Name: Harris_TB
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

module Harris_TB();
	//For Rows8x512
	parameter im_width = 320;
	parameter rows_width = 3;
	//For Window
	parameter window_size = 3;
	//Can't be changed in this IP.
	parameter color_width = 8;

	bit clk,rst_n;
	bit in_enable;
	bit[color_width - 1 : 0] in_color;
	bit row_enable;
	bit[color_width * rows_width - 1 : 0] out_color;

	bit[color_width * window_size * window_size - 1 : 0] win_data;
	bit win_enable;

	bit[color_width - 1 : 0] diff_th = 5;
	bit out_enable;
	bit out_data;

	bit now_start = 0;

	CLOCK CLOCK1(clk);
	Rows8x512 #(im_width,rows_width) Rows1 (clk, rst_n, in_enable, in_color, row_enable, out_color);
	Window #(color_width,window_size) Window1(clk, rst_n, row_enable, out_color, win_enable, win_data);
	Harris #(color_width) Harris1(diff_th, win_enable, win_data, out_enable, out_data);

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
		now_start = 0;
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
				in_enable = 1;
				if(out_enable) begin
					if(~now_start)
						$display("%m: at time %t ps , start%d !", $time, i);
					now_start = 1;
					$fwrite(fo,"%d\n",out_data);
				end
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end
endmodule