//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
LightnessTransform

:Function
Change the lightness of an image. 
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
	parameter color_channels = 3;
	parameter[3: 0] color_width = 8;
	bit signed [color_width : 0] lm_gain;
	bit signed [color_width : 0] lm_gain_comp;
	bit in_enable;
	bit[color_channels * color_width - 1 : 0] in_data;
	bit out_ready;
	bit[color_channels * color_width - 1 : 0] out_data;
endinterface

module LightnessTransform_TB();

	integer fi,fo;
	string fname[$];
	string ftmp, imconf;
	int fsize;
	bit now_start;
	int fst;

	bit clk, rst_n;
	TBInterface #(3, 8) RGBPipeline(clk, rst_n);
	TBInterface #(3, 8) RGBReqAck(clk, rst_n);
	TBInterface #(1, 8) GrayPipeline(clk, rst_n);
	TBInterface #(1, 8) GrayReqAck(clk, rst_n);
	CLOCK CLOCK1 (clk);
	True2Comp #(1, 9) TCRGBPipeline(RGBPipeline.lm_gain, RGBPipeline.lm_gain_comp);
	True2Comp #(1, 9) TCRGBReqAck(RGBReqAck.lm_gain, RGBReqAck.lm_gain_comp);
	True2Comp #(1, 9) TCGrayPipeline(GrayPipeline.lm_gain, GrayPipeline.lm_gain_comp);
	True2Comp #(1, 9) TCGrayReqAck(GrayReqAck.lm_gain, GrayReqAck.lm_gain_comp);
	LightnessTransform #(0, 3, 8) 
		LTRGBPipeline(RGBPipeline.clk, RGBPipeline.rst_n, RGBPipeline.lm_gain_comp, 
			RGBPipeline.in_enable, RGBPipeline.in_data, RGBPipeline.out_ready, RGBPipeline.out_data);
	LightnessTransform #(1, 3, 8) 
		LTRGBReqAck(RGBReqAck.clk, RGBReqAck.rst_n, RGBReqAck.lm_gain_comp, 
			RGBReqAck.in_enable, RGBReqAck.in_data, RGBReqAck.out_ready, RGBReqAck.out_data);
	LightnessTransform #(0, 1, 8) 
		LTGrayPipeline(GrayPipeline.clk, GrayPipeline.rst_n, GrayPipeline.lm_gain_comp, 
			GrayPipeline.in_enable, GrayPipeline.in_data, GrayPipeline.out_ready, GrayPipeline.out_data);
	LightnessTransform #(1, 1, 8) 
		LTGrayReqAck(GrayReqAck.clk, GrayReqAck.rst_n, GrayReqAck.lm_gain_comp, 
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
			fst = $fscanf(fi, "%b", RGBPipeline.lm_gain);
			RGBReqAck.lm_gain = RGBPipeline.lm_gain;
		end else if(imconf == "L") begin
			fst = $fscanf(fi, "%b", GrayPipeline.lm_gain);
			GrayReqAck.lm_gain = GrayPipeline.lm_gain;
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
	endtask : init_signal

	task work_pipeline();
		@(posedge clk);
		if(imconf == "RGB") begin
			RGBPipeline.in_enable = 1;
			fst = $fscanf(fi, "%b", RGBPipeline.in_data);
		end else if(imconf == "L") begin
			GrayPipeline.in_enable = 1;
			fst = $fscanf(fi, "%b", GrayPipeline.in_data);
		end
		if(RGBPipeline.out_ready | GrayPipeline.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipeline working start !", $time, ftmp);
			now_start = 1;
			if(imconf == "RGB")
				$fwrite(fo, "%0d %0d %0d\n", 
					RGBPipeline.out_data[23 : 16], RGBPipeline.out_data[15 : 8], RGBPipeline.out_data[7 : 0]);
			else if(imconf == "L")
				$fwrite(fo, "%0d\n", GrayPipeline.out_data);
		end
	endtask : work_pipeline

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