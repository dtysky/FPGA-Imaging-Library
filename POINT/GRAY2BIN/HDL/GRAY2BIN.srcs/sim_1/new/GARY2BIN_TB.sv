`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Xilinx
// Engineer: Dai Tianyu (dtysky)
// 
// Create Date: 2015/01/31 21:04:14
// Design Name: GRAY2BIN
// Module Name: GRAY2BIN_TB
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

module GRAY2BIN_TB();

	bit clk;
	bit[7:0] th;
	bit in_enable;
	bit[7:0] in_data;
	bit out_enable;
	bit out_data;

	integer fi,fo;
	string fname[$];
	string ftmp,imsize;
	int fsize;

	CLOCK CLOCK1 (clk);
	GRAY2BIN GRAY2BIN1(th, in_enable, gray, out_enable, b);

	initial begin
		th = 128;
		in_enable = 0;
		fi = $fopen("imgindex.dat","r");
		while (!$feof(fi)) begin
			$fscanf(fi,"%s",ftmp);
			fname.push_front(ftmp);
		end
		$fclose(fi);
		fsize = fname.size();
		for (int i = 0; i < fsize; i++) begin;
			ftmp = fname.pop_back();
			fi = $fopen({ftmp,".dat"},"r");
			fo = $fopen({ftmp,".res"},"w");
			//Keep xsize and ysize
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$fscanf(fi,"%s",imsize);
			$fwrite(fo,"%s\n",imsize);
			$display("time %t ps start%0d!", $time, i);
			while (!$feof(fi)) begin 
				@(posedge clk);
				in_enable = 1;
				$fscanf(fi,"%b",in_data);
				if(out_enable)
					$fwrite(fo,"%d\n",out_data);
			end
			$fclose(fi);
			$fclose(fo);
		end
		$finish;
	end

endmodule