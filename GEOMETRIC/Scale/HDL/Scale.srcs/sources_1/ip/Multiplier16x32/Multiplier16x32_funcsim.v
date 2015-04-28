// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Tue Apr 28 17:42:32 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               B:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Scale/HDL/Scale.srcs/sources_1/ip/Multiplier16x32/Multiplier16x32_funcsim.v
// Design      : Multiplier16x32
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier16x32,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier16x32,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=4,C_A_WIDTH=16,C_A_TYPE=1,C_B_WIDTH=32,C_B_TYPE=1,C_OUT_HIGH=47,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier16x32
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [15:0]A;
  input [31:0]B;
  output [47:0]P;

  wire [15:0]A;
  wire [31:0]B;
  wire CLK;
  wire [47:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "16" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "32" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "4" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "47" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier16x32_mult_gen_v12_0__parameterized0 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* ORIG_REF_NAME = "mult_gen_v12_0" *) (* C_VERBOSITY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_OPTIMIZE_GOAL = "1" *) (* C_XDEVICEFAMILY = "zynq" *) (* C_HAS_CE = "0" *) 
(* C_HAS_SCLR = "0" *) (* C_LATENCY = "4" *) (* C_A_WIDTH = "16" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "32" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier16x32_mult_gen_v12_0__parameterized0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [31:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [47:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [31:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "16" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "32" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "4" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "47" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier16x32_mult_gen_v12_0_viv__parameterized0 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
UyXQwkUObVrGCrQeWBRDzNzHSmxz0+tXmCDiikEzuwG7p+MOvi5now6c6XhFQHhRDLZqrTCJWGVY
uVMi7GoGag==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
i5kFZPoOW4AbrHICVt04gLioHJ/lXQCVR+36ZomPa7Uhk2VGKJwiH+6I59ia5ib443IW5VCbmy/r
gnO5lAmOjOXrf+28RyOfxhyCRgHKh6mRiH0tlgZUxbFCb24jFd8F2ON6eZARrIbx4Vu5v/7L6X5o
oTd41gw6CHpypaHAd88=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
d4UDVzST4F/GIUQK7Q/mgyckJ8hrUJmJYmR7IrVlH2X6hv2uAAk4gpmfB6E2dVAnuOOE4STY1OeO
4QqPqvp/zC7S/aYld/u+eRjgH778AqwHmdMBU3BX1e3j2lWzDCoDQianx13lD0Ihcvv2hpUg3My9
R2dUGaAs/YrnckB0Xsyif1gPs12BFskCvSBa0HZidrW6UXqeUc5Y+Y18oAX2L10OimzYS3Jo+han
FbcTbpApf4PkFyRzckA+yzqct0XOkXLsuWu6dE34gxuaUw9BCMtj5rnbQ0G0Xote0ldMp+AIN/vj
bJafuR2HkqxTvqwCTed3PqEy4xVdmr/ecywIlw==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
ZzJe3CosxBQtdtXIXPjUB1PIjPHRzRe+TcPVuazVXoOV6QQ4DY8D8TRP6/DZEeIUzxe5gMRXz2yf
RclEq20zSfPMaB3h6L9uECxIUPiPZJ03aglicg+QjHFDLo1XgOo1ItxSaGSam80SUko6TFrRjWV7
DlVH8SFB0gTLxJpXLeU=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
k0pB4lrRLLpdtNnVRXv7qxU15dyKF9BuJVYUlIA955FRzEtgaMMCmzDybCNTUJh5QGLsvLYdRVSK
VcBOlgtImwe2FJEsDE/buKE8+W7HPOSiP0Elo4jDRWfwpueOq6VQ4zL5XMAGi+70gMxxGQr7Z5E8
4lvDxjOzkqAIn3EC1esPBOdcmzCt1V55YsxrHdN/eAnUWBvEPaGJfoZKGT4IZ1fx0hJCdrrnel+V
0HuJqYSPOCB8SJpuoB2p3Y1d93yF5xcy8wSWeVWgM3E2z++VHQIjT4DTFlyqNFbe2YxMhMTY8SGk
pV+7oyzvQjUyYpAt0GiJuzwTVRTBCgpo3qFmbw==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
mZKHwr5abPt7j1+bSUJ0qKlSmOWKKTNqucXmutPWJRe1NdAODsL10Nk2UXtog5btHqF3KmVhu8n0
lbgWfENaHdzoUbsNVeXk1WbDblC3HogwpQ40Sdb3c+QPUJKKQ7CR892vFl/j4aryijB3T46n4Vj3
vN8u/Thsh24qEoi5+jENsBr3axOmyXJ8JZiZhw6toHvJrCt2Ys81QLkB88oWEcuhQonWOdDuwJKF
Z3jH/ZcvM6zBgHGjMJHmuEHsh23M1SUG/DTli8KQEdzkEDw7o56U1U934TYRKb38HKrZGEHyI7MR
YzNsfk5MjsZ/GxCxWP5JzF4f0epohPOtqZaQJQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
Zwr+DegQmWtpnXZR1CpnkM5df6MLdS3V31M7pJlAJhZURv+wr4BfOgN7IxRA2Ku0oDR0AhRDoAUh
elyPqT1pfEXWK/QOelpyERiautxuLTi8Ktyxe9qFDAxsHOqrHlvkT5EZMzSZOarOlaKhRXEQtSiu
tShdvGuoUPYPPiK7a7Xcj8YLwxTKVbkWG2LoX7dZlJlTzyP80fcz8RdKpxL1bW0gZYOIoWDyD+I+
O5ANvOWd0EU1/eI+YlCVXKkhBrU3NweoYxZ5xZ1xStMiD+Ah1sHjmTUJwzfe+3D01uJuLf2HxNrJ
KEsW5mnXyeu5//Wv4s05o/0gbbfC87Iy74LWHg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19008)
`pragma protect data_block
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
vCH1IUMSX1FW07uf0+45W7uMS1HL9daqYBxx
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
