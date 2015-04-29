// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Tue Apr 28 17:42:31 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               B:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Scale/HDL/Scale.srcs/sources_1/ip/Multiplier16x32/Multiplier16x32_stub.v
// Design      : Multiplier16x32
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *)
module Multiplier16x32(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[15:0],B[31:0],P[47:0]" */;
  input CLK;
  input [15:0]A;
  input [31:0]B;
  output [47:0]P;
endmodule
