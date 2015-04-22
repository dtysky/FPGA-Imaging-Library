/*
Image processing project : Threshold.

Function: Thresholding depend on two threshold,
convert the grayscale image to ternary or binary image.

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
	http://dtysky.github.io/
*/

`timescale 1ns / 1ps
module CLOCK (
	output bit clk
	);
	
	always #(100ps) begin
		clk = ~clk;
	end

endmodule

module Threshold_TB();
	//Can't be changed in this IP.
	parameter color_width = 8;

	bit clk,rst_n;
	bit in_enable;
	bit[color_width - 1 : 0] in_data;
	bit[color_width - 1 : 0] th1Base, th2Base;
	bit[color_width - 1 : 0] th1Ternary, th2Ternary;
	bit[color_width - 1 : 0] th1Contour, th2Contour;

	bit out_enableBase;
	bit out_enableTernary;
	bit out_enableContour;
	bit[1 : 0] out_dataBase;
	bit[1 : 0] out_dataTernary;
	bit[1 : 0] out_dataContour;

	CLOCK CLOCK1(clk);
	Threshold #(0, color_width) Th1(clk, rst_n, th1Base, th2Base, in_enable, in_data, out_enableBase, out_dataBase);
	Threshold #(2, color_width) Th2(clk, rst_n, th1Ternary, th2Ternary, in_enable, in_data, out_enableTernary, out_dataTernary);
	Threshold #(1, color_width) Th3(clk, rst_n, th1Contour, th2Contour, in_enable, in_data, out_enableContour, out_dataContour);

	integer fi,fob,fot,foc;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	bit now_start = 0;

	initial begin
		th1Base = 128;
		th2Base = 128;
		th1Ternary = 100;
		th2Ternary = 200;
		th1Contour = 100;
		th2Contour = 200;
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
		for (int i = 0; i < fsize; i++) begin;
			ftmp = fname.pop_back();
			fi = $fopen({ftmp,".dat"},"r");
			fob = $fopen({ftmp,"Base.res"},"w");
			fot = $fopen({ftmp,"Ternary.res"},"w");
			foc = $fopen({ftmp,"Contour.res"},"w");
			//Keep xsize and ysize
			$fscanf(fi,"%s",imsize);
			$fwrite(fob,"%s\n",imsize);
			$fwrite(fot,"%s\n",imsize);
			$fwrite(foc,"%s\n",imsize);
			$fscanf(fi,"%s",imsize);
			$fwrite(fob,"%s\n",imsize);
			$fwrite(fot,"%s\n",imsize);
			$fwrite(foc,"%s\n",imsize);
			rst_n = 0;
			in_enable = 0;
			now_start = 0;
			repeat(10) @(posedge clk);
			rst_n = 1;
			@(posedge clk);
			while (!$feof(fi)) begin 
				@(posedge clk);
				$fscanf(fi,"%b",in_data);
				in_enable = 1;
				if(out_enableBase) begin
					if(~now_start)
						$display("%m: at time %t ps , start%0d !", $time, i);
					now_start = 1;
					$fwrite(fob,"%d\n",out_dataBase);
					$fwrite(fot,"%d\n",out_dataTernary);
					$fwrite(foc,"%d\n",out_dataContour);
				end
			end
			$fclose(fi);
			$fclose(fob);
			$fclose(fot);
			$fclose(foc);
		end
		$finish;
	end

endmodule