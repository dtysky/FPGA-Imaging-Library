//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
Shear

:Function
Shearing an image by your given sh. 
Give the first output after 1 cycle while the frame input ready.

:Module
Test bench

:Version
1.0

:Modified
2015-05-28

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
	bit [24 : 0] sh_uo;
	bit [24 : 0] sh_vo;
	bit signed[24 : 0] sh_u;
	bit signed[24 : 0] sh_v;
	bit in_enable;
	bit frame_in_ready;
	bit[data_width - 1 : 0] frame_in_data;
	bit frame_enable;
	bit[im_width_bits - 1 : 0] frame_out_count_x;
	bit[im_width_bits - 1 : 0] frame_out_count_y;
	bit out_ready;
	bit[data_width - 1 : 0] out_data;
endinterface

interface TBInterfaceFC (input bit clk, input bit rst_n);
	parameter color_width = 8;
	parameter addr_width = 18;
	bit in_enable;
	bit[color_width - 1 : 0] in_data;
	bit out_ready;
	bit[color_width - 1 : 0] out_data;
	bit[addr_width - 1 : 0] ram_addr;
endinterface

interface TBInterfaceFC2 (input bit clk, input bit rst_n);
	parameter data_width = 8;
	parameter addr_width = 18;
	bit[data_width - 1 : 0] in_data;
	bit[addr_width - 1 : 0] ram_addr;
endinterface

module Shear_TB();

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
	TBInterface #(8, im_width_bits) GrayPipeline(clk, rst_n);
	TBInterface #(8, im_width_bits) GrayReqAck(clk, rst_n);
	CLOCK CLOCK1(clk);
	True2Comp #(2, 25) TCPipeline({GrayPipeline.sh_uo, GrayPipeline.sh_vo}, {GrayPipeline.sh_u, GrayPipeline.sh_v});
	True2Comp #(2, 25) TCReqAck({GrayReqAck.sh_uo, GrayReqAck.sh_vo}, {GrayReqAck.sh_u, GrayReqAck.sh_v});
	Shear #(0, GrayPipeline.data_width, im_width, im_height, im_width_bits, 3, 6)
		SHRGrayPipeline(
			GrayPipeline.clk, GrayPipeline.rst_n, GrayPipeline.sh_u, GrayPipeline.sh_v, 
			GrayPipeline.in_enable, GrayPipeline.frame_in_ready, GrayPipeline.frame_in_data, GrayPipeline.frame_enable, 
			GrayPipeline.frame_out_count_x, GrayPipeline.frame_out_count_y, GrayPipeline.out_ready, GrayPipeline.out_data
			);
	Shear #(1, GrayReqAck.data_width, im_width, im_height, im_width_bits, 3, 6)
		SHRGrayReqAck(
			GrayReqAck.clk, GrayReqAck.rst_n, GrayReqAck.sh_u, GrayReqAck.sh_v, 
			GrayReqAck.in_enable, GrayReqAck.frame_in_ready, GrayReqAck.frame_in_data, GrayReqAck.frame_enable, 
			GrayReqAck.frame_out_count_x, GrayReqAck.frame_out_count_y, GrayReqAck.out_ready, GrayReqAck.out_data
			);
	TBInterfaceFC PipelineWrite1(clk, rst_n);
	TBInterfaceFC PipelineWrite2(clk, rst_n);
	FrameController #(0, 0, 8, im_width, im_height, 18, 1)
		FramePipelineWrite1(
			PipelineWrite1.clk, PipelineWrite1.rst_n, PipelineWrite1.in_enable, PipelineWrite1.in_data, 
			PipelineWrite1.out_ready, PipelineWrite1.out_data, PipelineWrite1.ram_addr
			);
	FrameController #(0, 0, 8, im_width, im_height, 18, 1)
		FramePipelineWrite2(
			PipelineWrite2.clk, PipelineWrite2.rst_n, PipelineWrite2.in_enable, PipelineWrite2.in_data, 
			PipelineWrite2.out_ready, PipelineWrite2.out_data, PipelineWrite2.ram_addr
			);
	TBInterfaceFC2 PipelineRead(clk, rst_n);
	TBInterfaceFC2 ReqAckRead(clk, rst_n);
	FrameController2 #(0, 1, 8, im_width, im_height, im_width_bits, 18, 1, 3)
		FramePipelineRead(
			clk, rst_n, GrayPipeline.frame_out_count_x, GrayPipeline.frame_out_count_y,  
			GrayPipeline.frame_enable, PipelineRead.in_data, GrayPipeline.frame_in_ready, GrayPipeline.frame_in_data, PipelineRead.ram_addr
			);
	FrameController2 #(1, 1, 8, im_width, im_height, im_width_bits, 18, 1, 3)
		FrameReqAckRead(
			clk, rst_n, GrayReqAck.frame_out_count_x, GrayReqAck.frame_out_count_y, 
			GrayReqAck.frame_enable, ReqAckRead.in_data, GrayReqAck.frame_in_ready, GrayReqAck.frame_in_data, ReqAckRead.ram_addr
			);
	BRam8x512x512 PipelineBRam(
		clk, PipelineWrite1.out_ready, PipelineWrite1.ram_addr, PipelineWrite1.out_data, 
		clk, PipelineRead.ram_addr, PipelineRead.in_data);
	BRam8x512x512 ReqAckBRam(
		clk, PipelineWrite2.out_ready, PipelineWrite2.ram_addr, PipelineWrite2.out_data, 
		clk, ReqAckRead.ram_addr, ReqAckRead.in_data);


	task init_file();
		//Keep conf
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%s", imconf);
		$fwrite(fo, "%s\n", imconf);
		fst = $fscanf(fi, "%b", GrayPipeline.sh_uo);
		GrayReqAck.sh_uo = GrayPipeline.sh_uo;
		fst = $fscanf(fi, "%b", GrayPipeline.sh_vo);
		GrayReqAck.sh_vo = GrayPipeline.sh_vo;
	endtask : init_file

	task init_signal();
		rst_n = 0;
		now_start = 0;
		GrayPipeline.in_enable = 0;
		GrayReqAck.in_enable = 0;
		PipelineWrite1.in_enable = 0;
		PipelineWrite2.in_enable = 0;
		repeat(10) @(posedge clk);
		rst_n = 1;
		repeat(10) @(posedge clk);
	endtask : init_signal

	task work_write();
		@(posedge clk);
		PipelineWrite1.in_enable = 1;
		PipelineWrite2.in_enable = 1;
		fst = $fscanf(fi, "%b", PipelineWrite1.in_data);
		PipelineWrite2.in_data = PipelineWrite1.in_data;
		if(PipelineWrite1.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipeline writing start !", $time, ftmp);
			now_start = 1;
		end
	endtask : work_write

	task work_pipeline();
		@(posedge clk);
		GrayPipeline.in_enable = 1;
		if(GrayPipeline.out_ready) begin
			if(~now_start)
				$display("%m: at time %0t ps , %s-pipeline working start !", $time, ftmp);
			now_start = 1;
			$fwrite(fo, "%0d\n",GrayPipeline.out_data);
		end
	endtask : work_pipeline

	task work_regack();
		@(posedge clk);
		GrayReqAck.in_enable = 1;
		while (~GrayReqAck.out_ready)
			@(posedge clk);
		if(~now_start)
			$display("%m: at time %0t ps , %s-reqack working start !", $time, ftmp);
		now_start = 1;
		$fwrite(fo, "%0d\n", GrayReqAck.out_data);
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
				work_write();
			end
			init_signal();
			for (int j = 0; j < im_width * im_height; j++) begin
				work_pipeline();
			end
			$fclose(fi);
			$fclose(fo);
			fi = $fopen({ftmp, ".dat"}, "r");
			fo = $fopen({ftmp, "-reqack.res"}, "w");
			init_file();
			init_signal();
			for (int j = 0; j < im_width * im_height; j++) begin
				work_regack();
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule