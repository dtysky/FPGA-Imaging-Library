//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
ContrastTransform

:Function
Change the contrast of an image.
Give the first output after 3 or 5 cycles while the input enable, depends on work_mode.

:Module
Testbench

:Version
1.0

:Modified
2015-05-05

Copyright (C) 2015  Tianyu Dai (dtysky)

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

Homepage for this project:
	http://fil.dtysky.moe

Sources for this project:
	https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
	dtysky@outlook.com

My blog:
	http://dtysky.moe

*/

`timescale 1ns / 1ps

module CLOCK (
	output bit clk
	);
	
	always #(100ps) begin
		clk = ~clk;
	end

endmodule

interface TBInterface (input bit clk, input bit rst_n);
	parameter color_mode = 3;
	parameter[3: 0] color_width = 8;
	bit[23 : 0] ct_scale;
	bit in_enable;
	bit[color_mode * color_width - 1 : 0] in_data;
	bit out_ready;
	bit[color_mode * color_width - 1 : 0] out_data;
endinterface

module ContrastTransform_TB();

	integer fi,fo;
	string fname[$];
	string ftmp, imconf;
	int fsize;
	bit now_start;
	int fst;

	bit clk, rst_n;
	TBInterface #(3, 8) RGBPipline(clk, rst_n);
	TBInterface #(3, 8) RGBReqAck(clk, rst_n);
	TBInterface #(1, 8) GrayPipline(clk, rst_n);
	TBInterface #(1, 8) GrayReqAck(clk, rst_n);
	CLOCK CLOCK1 (clk);
	ContrastTransform #(0, 0, 3, 8) 
		CTRGBPipline(RGBPipline.clk, RGBPipline.rst_n, RGBPipline.ct_scale, 
			RGBPipline.in_enable, RGBPipline.in_data, RGBPipline.out_ready, RGBPipline.out_data);
	ContrastTransform #(1, 0, 3, 8) 
		CTRGBReqAck(RGBReqAck.clk, RGBReqAck.rst_n, RGBReqAck.ct_scale, 
			RGBReqAck.in_enable, RGBReqAck.in_data, RGBReqAck.out_ready, RGBReqAck.out_data);
	ContrastTransform #(0, 0, 1, 8) 
		CTGrayPipline(GrayPipline.clk, GrayPipline.rst_n, GrayPipline.ct_scale, 
			GrayPipline.in_enable, GrayPipline.in_data, GrayPipline.out_ready, GrayPipline.out_data);
	ContrastTransform #(1, 0, 1, 8) 
		CTGrayReqAck(GrayReqAck.clk, GrayReqAck.rst_n, GrayReqAck.ct_scale, 
			GrayReqAck.in_enable, GrayReqAck.in_data, GrayReqAck.out_ready, GrayReqAck.out_data);

	task init_file();
		//Keep conf
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		if(imconf == "RGB") begin
			fst = $fscanf(fi, "%b", RGBPipline.ct_scale);
			RGBReqAck.ct_scale = RGBPipline.ct_scale;
		end else if(imconf == "L") begin
			fst = $fscanf(fi, "%b", GrayPipline.ct_scale);
			GrayReqAck.ct_scale = GrayPipline.ct_scale;
		end
	endtask : init_file

	task init_signal();
		rst_n = 0;
		now_start = 0;
		RGBPipline.in_enable = 0;
		RGBReqAck.in_enable = 0;
		GrayPipline.in_enable = 0;
		GrayReqAck.in_enable = 0;
		repeat(10) @(posedge clk);
		rst_n = 1;
	endtask : init_signal

	task work_pipline();
		@(posedge clk);
		if(imconf == "RGB") begin
			RGBPipline.in_enable = 1;
			fst = $fscanf(fi, "%b", RGBPipline.in_data);
		end else if(imconf == "L") begin
			GrayPipline.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayPipline.in_data);
		end
		if(RGBPipline.out_ready | GrayPipline.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipline working start !", $time, ftmp);
			now_start = 1;
			if(imconf == "RGB")
				$fwrite(fo, "%0d %0d %0d\n", 
					RGBPipline.out_data[23 : 16], RGBPipline.out_data[15 : 8], RGBPipline.out_data[7 : 0]);
			else if(imconf == "L")
				$fwrite(fo, "%0d\n", GrayPipline.out_data);
		end
	endtask : work_pipline

	task work_regack();
		@(posedge clk);
		if(imconf == "RGB") begin
			RGBReqAck.in_enable = 1;
			fst = $fscanf(fi, "%b", RGBReqAck.in_data);
		end else if(imconf == "L") begin
			GrayReqAck.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayReqAck.in_data);
		end
		while (~(RGBReqAck.out_ready | GrayReqAck.out_ready))
			@(posedge clk);
		if(~now_start)
			$display("%m: at time %0t ps , %s-reqack working start !", $time, ftmp);
		now_start = 1;
		if(imconf == "RGB")
			$fwrite(fo, "%0d %0d %0d\n", 
				RGBReqAck.out_data[23 : 16], RGBReqAck.out_data[15 : 8], RGBReqAck.out_data[7 : 0]);
		else if(imconf == "L")
			$fwrite(fo, "%0d\n", GrayReqAck.out_data);
		RGBReqAck.in_enable = 0;
		GrayReqAck.in_enable = 0;
	endtask : work_regack

	initial begin
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			fst = $fscanf(fi, "%s", ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		repeat(1000) @(posedge clk);
		for (int i = 0; i < fsize; i++) begin;
			ftmp = fname.pop_back();
			fi = $fopen({ftmp, ".dat"}, "r");
			fo = $fopen({ftmp, "-pipline.res"}, "w");
			init_file();
			init_signal();
			while (!$feof(fi)) begin 
				work_pipline();
			end
			fi = $fopen({ftmp, ".dat"}, "r");
			fo = $fopen({ftmp, "-reqack.res"}, "w");
			init_file();
			init_signal();
			while (!$feof(fi)) begin 
				work_regack();
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule