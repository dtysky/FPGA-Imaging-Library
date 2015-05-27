//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Mirror

:Function
Getting a mirror of your given image. 
Give the first output after 1 cycle while the input enable.

:Module
Test bench

:Version
1.0

:Modified
2015-05-26

Copyright (C) 2015  Tianyu Dai (dtysky) <dtysky@outlook.com>

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
	parameter data_width = 8;
	parameter im_width_bits = 9;
	bit signed[1 : 0] mode;
	bit[im_width_bits - 1 : 0] in_count_x;
	bit[im_width_bits - 1 : 0] in_count_y;
	bit in_enable;
	bit[data_width - 1 : 0] in_data;
	bit out_ready;
	bit[data_width - 1 : 0] out_data;
	bit[im_width_bits - 1 : 0] out_count_x;
	bit[im_width_bits - 1 : 0] out_count_y;
endinterface

module Mirror_TB();

	//For Frame
	//Can't be changed in this test
	parameter im_width = 512;
	parameter im_height = 512;
	parameter im_width_bits = 9;

	integer fi,fo;
	string fname[$];
	string ftmp, imconf;
	int fsize;
	bit now_start;
	int fst;

	bit clk,rst_n;
	TBInterface #(24, im_width_bits) RGBPipeline(clk, rst_n);
	TBInterface #(24, im_width_bits) RGBReqAck(clk, rst_n);
	TBInterface #(8, im_width_bits) GrayPipeline(clk, rst_n);
	TBInterface #(8, im_width_bits) GrayReqAck(clk, rst_n);
	CLOCK CLOCK1(clk);
	Mirror #(0, RGBPipeline.data_width, im_width, im_height, im_width_bits)
		MRRGBPipeline(
			RGBPipeline.clk, RGBPipeline.rst_n, RGBPipeline.mode, 
			RGBPipeline.in_enable, RGBPipeline.in_data, RGBPipeline.in_count_x, RGBPipeline.in_count_y, 
			RGBPipeline.out_ready, RGBPipeline.out_data, RGBPipeline.out_count_x, RGBPipeline.out_count_y
			);
	Mirror #(1, RGBReqAck.data_width, im_width, im_height, im_width_bits)
		MRRGBReqAck(
			RGBReqAck.clk, RGBReqAck.rst_n, RGBReqAck.mode, 
			RGBReqAck.in_enable, RGBReqAck.in_data, RGBReqAck.in_count_x, RGBReqAck.in_count_y, 
			RGBReqAck.out_ready, RGBReqAck.out_data, RGBReqAck.out_count_x, RGBReqAck.out_count_y
			);
	Mirror #(0, GrayPipeline.data_width, im_width, im_height, im_width_bits)
		MRGrayPipeline(
			GrayPipeline.clk, GrayPipeline.rst_n, GrayPipeline.mode, 
			GrayPipeline.in_enable, GrayPipeline.in_data, GrayPipeline.in_count_x, GrayPipeline.in_count_y, 
			GrayPipeline.out_ready, GrayPipeline.out_data, GrayPipeline.out_count_x, GrayPipeline.out_count_y
			);
	Mirror #(1, GrayReqAck.data_width, im_width, im_height, im_width_bits)
		MRGrayReqAck(
			GrayReqAck.clk, GrayReqAck.rst_n, GrayReqAck.mode, 
			GrayReqAck.in_enable, GrayReqAck.in_data, GrayReqAck.in_count_x, GrayReqAck.in_count_y, 
			GrayReqAck.out_ready, GrayReqAck.out_data, GrayReqAck.out_count_x, GrayReqAck.out_count_y
			);

	task init_file();
		//Keep conf
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		if(imconf == "RGB") begin
			fst = $fscanf(fi, "%b", RGBPipeline.mode);
			RGBReqAck.mode = RGBPipeline.mode;
		end else if(imconf == "L") begin
			fst = $fscanf(fi, "%b", GrayPipeline.mode);
			GrayReqAck.mode = GrayPipeline.mode;
		end
	endtask : init_file

	task init_signal();
		rst_n = 0;
		now_start = 0;
		RGBPipeline.in_enable = 0;
		RGBReqAck.in_enable = 0;
		GrayPipeline.in_enable = 0;
		GrayReqAck.in_enable = 0;
		repeat(10) @(posedge clk);
		rst_n = 1;
		repeat(10) @(posedge clk);
	endtask : init_signal

	task work_pipeline();
		@(posedge clk);
		if(imconf == "RGB") begin
			RGBPipeline.in_enable = 1;
			fst = $fscanf(fi, "%b", RGBPipeline.in_count_x);
			fst = $fscanf(fi, "%b", RGBPipeline.in_count_y);
			fst = $fscanf(fi, "%b", RGBPipeline.in_data);
		end else if(imconf == "L") begin
			GrayPipeline.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayPipeline.in_count_x);
			fst = $fscanf(fi, "%b", GrayPipeline.in_count_y);
			fst = $fscanf(fi, "%b", GrayPipeline.in_data);
		end
		if(RGBPipeline.out_ready | GrayPipeline.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipeline working start !", $time, ftmp);
			now_start = 1;
			if(imconf == "RGB")
				$fwrite(fo, "%0d %0d %0d %0d %0d\n", 
					RGBPipeline.out_count_x, RGBPipeline.out_count_y, 
					RGBPipeline.out_data[23 : 16], RGBPipeline.out_data[15 : 8], RGBPipeline.out_data[7 : 0]);
			else if(imconf == "L")
				$fwrite(fo, "%0d %0d %0d\n", GrayPipeline.out_count_x, GrayPipeline.out_count_y, GrayPipeline.out_data);
		end
	endtask : work_pipeline

	task work_regack();
		@(posedge clk);
		if(imconf == "RGB") begin
			RGBReqAck.in_enable = 1;
			fst = $fscanf(fi, "%b", RGBReqAck.in_count_x);
			fst = $fscanf(fi, "%b", RGBReqAck.in_count_y);
			fst = $fscanf(fi, "%b", RGBReqAck.in_data);
		end else if(imconf == "L") begin
			GrayReqAck.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayReqAck.in_count_x);
			fst = $fscanf(fi, "%b", GrayReqAck.in_count_y);
			fst = $fscanf(fi, "%b", GrayReqAck.in_data);
		end
		while (~(RGBReqAck.out_ready | GrayReqAck.out_ready))
			@(posedge clk);
		if(~now_start)
			$display("%m: at time %0t ps , %s-reqack working start !", $time, ftmp);
		now_start = 1;
			if(imconf == "RGB")
				$fwrite(fo, "%0d %0d %0d %0d %0d\n", 
					RGBReqAck.out_count_x, RGBReqAck.out_count_y, 
					RGBReqAck.out_data[23 : 16], RGBReqAck.out_data[15 : 8], RGBReqAck.out_data[7 : 0]);
			else if(imconf == "L")
				$fwrite(fo, "%0d %0d %0d\n", GrayReqAck.out_count_x, GrayReqAck.out_count_y, GrayReqAck.out_data);
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
			fo = $fopen({ftmp, "-pipeline.res"}, "w");
			init_file();
			init_signal();
			while (!$feof(fi)) begin 
				work_pipeline();
			end
			$fclose(fi);
			$fclose(fo);
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