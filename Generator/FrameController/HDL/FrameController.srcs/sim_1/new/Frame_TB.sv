`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: None
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/04/06 16:25:33
// Design Name: Frame
// Module Name: Frame_TB
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
	
	always #(5ns) begin
		clk = ~clk;
	end

endmodule

module Frame_TB();

	//For Frame
	parameter im_width = 320;
	parameter im_height = 240;
	parameter addr_width = 17;
	parameter ram_read_latency = 1;
	//For Window
	parameter window_size = 5;
	//Can't be changed in this IP.
	parameter color_width = 8;

	bit clk,rst_n;
	bit in_enableW;
	bit[color_width - 1 : 0] in_dataW;
	bit out_enableW;
	bit[color_width - 1 : 0] out_dataW;
	bit[addr_width - 1 : 0] ram_addrW;
	bit in_enableR;
	bit[color_width - 1 : 0] in_dataR;
	bit out_enableR;
	bit[color_width - 1 : 0] out_dataR;
	bit[addr_width - 1 : 0] ram_addrR;

	CLOCK CLOCK1(clk);
	Frame #(0, color_width, im_width, im_height, addr_width, ram_read_latency)
		FrameWrite (clk, rst_n, in_enableW, in_dataW, out_enableW, out_dataW, ram_addrW);
	Frame #(1, color_width, im_width, im_height, addr_width, ram_read_latency)
		FrameRead (clk, rst_n, in_enableR, in_dataR, out_enableR, out_dataR, ram_addrR);
	//Write clock must be in the middle of data and address !
	BRam BRam1(~clk, out_enableW, ram_addrW, out_dataW, clk, ram_addrR, in_dataR);

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