// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed Apr 29 02:32:04 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/FrameController2/HDL/FrameController2.srcs/sources_1/ip/MultiplierAdd16x16x16/MultiplierAdd16x16x16_stub.v
// Design      : MultiplierAdd16x16x16
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xbip_multadd_v3_0,Vivado 2014.4" *)
module MultiplierAdd16x16x16(CLK, CE, SCLR, A, B, C, SUBTRACT, P, PCOUT)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,SCLR,A[15:0],B[15:0],C[15:0],SUBTRACT,P[47:0],PCOUT[47:0]" */;
  input CLK;
  input CE;
  input SCLR;
  input [15:0]A;
  input [15:0]B;
  input [15:0]C;
  input SUBTRACT;
  output [47:0]P;
  output [47:0]PCOUT;
endmodule
