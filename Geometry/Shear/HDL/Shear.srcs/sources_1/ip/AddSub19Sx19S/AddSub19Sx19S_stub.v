// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed Apr 29 17:49:22 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Shear/HDL/Shear.srcs/sources_1/ip/AddSub19Sx19S/AddSub19Sx19S_stub.v
// Design      : AddSub19Sx19S
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0,Vivado 2014.4" *)
module AddSub19Sx19S(A, B, CLK, S)
/* synthesis syn_black_box black_box_pad_pin="A[18:0],B[18:0],CLK,S[18:0]" */;
  input [18:0]A;
  input [18:0]B;
  input CLK;
  output [18:0]S;
endmodule
