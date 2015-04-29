// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed Apr 29 17:43:35 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Shear/HDL/Shear.srcs/sources_1/ip/Multiplier18Sx17S/Multiplier18Sx17S_funcsim.v
// Design      : Multiplier18Sx17S
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier18Sx17S,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier18Sx17S,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=18,C_A_TYPE=0,C_B_WIDTH=17,C_B_TYPE=0,C_OUT_HIGH=34,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier18Sx17S
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [17:0]A;
  input [16:0]B;
  output [34:0]P;

  wire [17:0]A;
  wire [16:0]B;
  wire CLK;
  wire [34:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "0" *) 
   (* C_A_WIDTH = "18" *) 
   (* C_B_TYPE = "0" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "17" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "34" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier18Sx17S_mult_gen_v12_0__parameterized0 U0
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
(* C_HAS_SCLR = "0" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "18" *) 
(* C_A_TYPE = "0" *) (* C_B_WIDTH = "17" *) (* C_B_TYPE = "0" *) 
(* C_OUT_HIGH = "34" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier18Sx17S_mult_gen_v12_0__parameterized0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [17:0]A;
  input [16:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [34:0]P;
  output [47:0]PCASC;

  wire [17:0]A;
  wire [16:0]B;
  wire CE;
  wire CLK;
  wire [34:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "0" *) 
   (* C_A_WIDTH = "18" *) 
   (* C_B_TYPE = "0" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "17" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "34" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier18Sx17S_mult_gen_v12_0_viv__parameterized0 i_mult
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
htYYBgmZEn7jQ94/xTtcs2jyS+cwC5MeFbKrCGrCX9pXoLBdRpE+T/YXeqhzQqfDF551jJtjjzvE
8VBUDrgq2GefkYJYF598YWEi5RpIMriy8FTcQ6ZOZFUeCxjw2nrI1Jb6E6amzi0HPQNEs4Mzm4mO
ZJURblho8fYtWf7NrRg0xatsEskK38YuQ0RLhcxt2Ejbg33V3ct2dprcuLCO+TJT77G7L4juGkqy
EmGa8/xz+VsdwfH+KNmAAPwea61OCYfSApd1ofRBFTrSWkMpuzKkZ+h+3RT1LRYlv2msiDRMSQJ2
D/eBzxhHfMQgc9WhM21Ws/fpOmB4gQhCOuJmhA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
bHweZ1RXd/c0Gc6baGSGDt1U33aGB5QEXE4DgCpMXlrrSNcuE18OD9Rx7Dwnv+Z2iLAz32X7AoVg
Yrew2tDP4j/sKOr8WeSFALQ3yX/lNoW7aYhQyMl71snH/Lpq4lgbsTkzGsHLxa8kUG3hHyx+joeG
RpdswF7lFq2FrNefyCKCZbC7NanmZwqtJaKCoDluLemQtAjZujKMHXUfbtpjgh+6nooOoEUzrtu4
6lPGbd80G1+qStyU0txWmfbsYHZWucBjME7q62seVZPMcTfYXR2TKTJamReGQMD4h9EZVhmzai7T
rSmhw3THYxdAHx968+Y17+FmZ728ykoLjnoRNQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7200)
`pragma protect data_block
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
9XNSW5YFd3ynqmlDFZGbbgla
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
