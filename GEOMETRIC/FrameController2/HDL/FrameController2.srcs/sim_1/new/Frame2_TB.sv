/*
Image processing project : Frame2.

Function: Controlling a frame(block ram etc.), writing or reading with counts.

Testbench.

Copyright (C) 2015  Dai Tianyu (dtysky)

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

This module is a part of image processing project, you can get all of them here:
	https://github.com/dtysky/Image-processing-on-FPGA

This mail is for connecting me:
	dtysky@outlook.com

My blog is here:
	http://dtysky.moe/
*/

`timescale 1ns / 1ns

module CLOCK (
	output bit clk
	);
	
	always #(5ns) begin
		clk = ~clk;
	end

endmodule

module Frame2_TB();

	//For Frame
	parameter im_width_bits = 9;
	parameter im_width = 240;
	parameter im_height = 320;
	parameter addr_width = 17;
	parameter ram_read_latency = 2;
	//For Window
	parameter window_size = 5;
	//Can't be changed in this IP.
	parameter color_width = 8;

	bit clk, rst_n;
	bit[im_width_bits - 1 : 0] in_count_xW, in_count_yW;
	bit in_enableW;
	bit[color_width - 1 : 0] in_dataW;
	bit out_enableW;
	bit[color_width - 1 : 0] out_dataW;
	bit[addr_width - 1 : 0] ram_addrW;
	bit[im_width_bits - 1 : 0] out_count_xW, out_count_yW;

	bit in_enableR;
	bit[color_width - 1 : 0] in_dataR;
	bit out_enableR;
	bit[color_width - 1 : 0] out_dataR;
	bit[addr_width - 1 : 0] ram_addrR;
	bit[im_width_bits - 1 : 0] out_count_xR, out_count_yR;

	CLOCK CLOCK1(clk);
	Frame2 #(0, color_width, im_width, im_height, im_width_bits, addr_width, ram_read_latency)
		FrameWrite (clk, rst_n, in_enableW, in_dataW, in_count_xW, in_count_yW, out_enableW, out_dataW, out_count_xW, out_count_yW, ram_addrW);
	Frame2 #(1, color_width, im_width, im_height, im_width_bits, addr_width, ram_read_latency)
		FrameRead (clk, rst_n, in_enableR, in_dataR, 0, 0, out_enableR, out_dataR, out_count_xR, out_count_yR, ram_addrR);
	//Write clock must be in the middle of data and address !
	BRam BRam1(~clk, out_enableW, ram_addrW, out_dataW, clk, ram_addrR, in_dataR);

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
		repeat(1000) @(posedge clk);
		rst_n = 1;
		@(posedge clk);
		for (int i = 0; i < fsize; i++) begin;
			rst_n = 0;
			in_enableW = 0;
			in_enableR = 0;
			repeat(10) @(posedge clk);
			rst_n = 1;
			@(posedge clk);
			ftmp = fname.pop_back();
			fi = $fopen({ftmp,".dat"},"r");
			fo = $fopen({ftmp,".res"},"w");
			//Keep xsize and ysize
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$display("%m: at time %t ps , frame%d write begin!", $time, i);
			while(!$feof(fi)) begin 
				@(posedge clk);
				in_enableW = 1;
				$fscanf(fi, "%b", in_count_xW);
				$fscanf(fi, "%b", in_count_yW);
				$fscanf(fi, "%b", in_dataW);
			end
			repeat(3) @(posedge clk);
			$display("%m: at time %t ps , frame%d read begin!", $time, i);
			in_enableW = 0;
			@(posedge clk)
			in_enableR = 1;
			while (! ((ram_addrR == im_width * im_height - 1)) ) begin
				@(posedge clk)
				if(out_enableR)
					$fwrite(fo,"%d\n",out_dataR);
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule