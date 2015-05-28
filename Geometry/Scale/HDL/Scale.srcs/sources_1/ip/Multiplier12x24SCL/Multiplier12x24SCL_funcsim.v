// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Thu May 28 19:32:19 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/Master/Geometry/Scale/HDL/Scale.srcs/sources_1/ip/Multiplier12x24SCL/Multiplier12x24SCL_funcsim.v
// Design      : Multiplier12x24SCL
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier12x24SCL,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier12x24SCL,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=12,C_A_TYPE=1,C_B_WIDTH=24,C_B_TYPE=1,C_OUT_HIGH=35,C_OUT_LOW=17,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier12x24SCL
   (CLK,
    A,
    B,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [11:0]A;
  input [23:0]B;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [18:0]P;

  wire [11:0]A;
  wire [23:0]B;
  wire CLK;
  wire [18:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "24" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "35" *) 
   (* C_OUT_LOW = "17" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier12x24SCL_mult_gen_v12_0__parameterized0 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* ORIG_REF_NAME = "mult_gen_v12_0" *) (* C_VERBOSITY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_OPTIMIZE_GOAL = "1" *) (* C_XDEVICEFAMILY = "zynq" *) (* C_HAS_CE = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "12" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "24" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "35" *) (* C_OUT_LOW = "17" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier12x24SCL_mult_gen_v12_0__parameterized0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [11:0]A;
  input [23:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [18:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [23:0]B;
  wire CE;
  wire CLK;
  wire [18:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "24" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "35" *) 
   (* C_OUT_LOW = "17" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier12x24SCL_mult_gen_v12_0_viv__parameterized0 i_mult
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
PepJREI+dGxuztuKKJX1Ue6xLjhQ4pEUTdaQOg2gjgjUtX/37YuAko+vjwWAlpZGg1Uj8qRBLVcI
h7DeTPm3DlkuGE92XWodXVpkagpG4we4xulfV5wMr1XD5GEqYlF8IAkGF7aZguNbS1onv3PUFdSP
C6tFe1X/PMxxFOcN5B81kdowMnsLJ8DluB+ahhySHuqjdqQjUB+48WyZgrHLQ7599GDoFhviw2HH
cW27iW4fwwQ5s67RskQorXnZk/1TzIdWOM/KBbwTKlDGAi1mxlWnzHKO1uKOCQYiDNvQQbJy7byT
fKRwW3JFUGL59b8Nq8LHe3PrdpHeCKzOhOcHOw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
je4MsKAvSVPD9g5QTnQvggTDGi9Vmw55/u/1x9lTgkvY4+4XtpCOzsMdcOz9sautcHsIJ3d7vlq5
7L859cdE9E8LJ8XLzE31QuKDZqhAm1atOAvbyus/p0q+QR3WII6Dw+v9G0hsTo9/bMv5qDRsdAMm
WgIyhr+J2Kp49ZNe8JjcdjMI2myqzSLQ74S48SMz7mJ+MdgpEbeDaEbi+5wmQDFuWXfK0npFZlMg
VVijwzcSuFzci2PdPl4o9HY0Df3HJZfuavWOG6/7ajQK8y4RQzCcEK3Rim9zyojnAp/B9oswqrRA
Sf20uR9/oiY0Jf4C+arMQ/PD63nYkLykvfWCAg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8768)
`pragma protect data_block
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
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
