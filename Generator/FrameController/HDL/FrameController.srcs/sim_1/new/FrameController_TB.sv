//Com2DocHDL
/*
:Project
FPGA-Imaging-Library

:Design
ContrastTransform

:Function
For controlling a block ram from xilinx.
Give the first output after ram_read_latency cycles while the input enable.

:Module
Test bench

:Version
1.0

:Modified
2015-05-12

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
	
	always #(5ns) begin
		clk = ~clk;
	end

endmodule

interface TBInterface (input bit clk, input bit rst_n);
	parameter color_width = 8;
	parameter addr_width = 18;
	input clk;
	input rst_n;
	input in_enable;
	input[color_width - 1 : 0] in_data;
	output out_ready;
	output[color_width - 1 : 0] out_data;
	output[addr_width - 1 : 0] ram_addr;
endinterface

module Frame_TB();

	//For Frame
	//Can't be changed in this test
	parameter im_width = 512;
	parameter im_height = 512;
	parameter addr_width = 18;
	parameter ram_read_latency = 1;
	parameter color_width = 8;
	parameter row_init = 0;

	bit clk,rst_n;
	bit BRam_we;
	bit[color_width - 1 : 0] BRam_dataW, BRam_dataR;
	bit[addr_width - 1 : 0] BRam_addrW, BRam_dataR;
	TBInterface PipelineWrite(clk, rst_n);
	TBInterface PipelineRead(clk, rst_n);
	TBInterface ReqAckWrite(clk, rst_n);
	TBInterface ReqAckWrite(clk, rst_n);

	CLOCK CLOCK1(clk);
	FrameController #(0, 0, color_width, im_width, im_height, addr_width, ram_read_latency)
		FramePipelineWrite(
			PipelineWrite.clk, PipelineWrite.rst_n, PipelineWrite.in_enable, PipelineWrite.in_data, 
			PipelineWrite.out_ready, PipelineWrite.out_data, PipelineWrite.ram_addr
			);
	FrameController #(0, 1, color_width, im_width, im_height, addr_width, ram_read_latency)
		FramePipelineRead(
			PipelineRead.clk, PipelineRead.rst_n, PipelineRead.in_enable, PipelineRead.in_data, 
			PipelineRead.out_ready, PipelineRead.out_data, PipelineRead.ram_addr
			);
	FrameController #(1, 0, color_width, im_width, im_height, addr_width, ram_read_latency)
		FrameReqAckWrite(
			ReqAckWrite.clk, ReqAckWrite.rst_n, ReqAckWrite.in_enable, ReqAckWrite.in_data, 
			ReqAckWrite.out_ready, ReqAckWrite.out_data, ReqAckWrite.ram_addr
			);
	FrameController #(1, 1, color_width, im_width, im_height, addr_width, ram_read_latency)
		FrameReqAckRead(
			ReqAckRead.clk, ReqAckRead.rst_n, ReqAckRead.in_enable, ReqAckRead.in_data, 
			ReqAckRead.out_ready, ReqAckRead.out_data, ReqAckRead.ram_addr
			);
	//Write clock must be in the middle of data and address !
	BRam8x512x512 BRam(~clk, BRam_we, BRam_addrW, BRam_dataW, clk, BRam_addrR, BRam_dataR);

	integer fi,fo;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	bit now_start = 0;

	initial begin
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			$fscanf(fi,"%s",ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		for (int i = 0; i < fsize; i++) begin;
			rst_n = 0;
			in_enableW = 0;
			in_enableR = 0;
			in_dataW = 255;
			repeat(1000) @(posedge clk);
			rst_n = 1;
			in_enableR = 1;
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
				$fscanf(fi,"%b",in_dataW);
			end
			$display("%m: at time %t ps , frame%d read begin!", $time, i);
			in_enableW = 0;
			in_enableR = 0;
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