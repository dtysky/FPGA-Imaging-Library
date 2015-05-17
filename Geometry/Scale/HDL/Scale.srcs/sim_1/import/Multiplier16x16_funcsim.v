// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Mon Apr 27 16:50:02 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/FrameController2/HDL/FrameController2.srcs/sources_1/ip/Multiplier16x16/Multiplier16x16_funcsim.v
// Design      : Multiplier16x16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier16x16,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier16x16,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=0,C_LATENCY=3,C_A_WIDTH=16,C_A_TYPE=1,C_B_WIDTH=16,C_B_TYPE=1,C_OUT_HIGH=31,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier16x16
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [15:0]A;
  input [15:0]B;
  output [31:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "16" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "16" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "31" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier16x16_mult_gen_v12_0__parameterized0 U0
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
(* C_HAS_SCLR = "0" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "16" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "16" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "31" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier16x16_mult_gen_v12_0__parameterized0
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
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [31:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [31:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "16" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "16" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "31" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier16x16_mult_gen_v12_0_viv__parameterized0 i_mult
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
ScV+kqjnW6GLkXPWxPKJaj5gmJsVHPFiJFFHbbypTqss4AHNsx2imnVDUdoR9lGXyY1d3DQaQ6tj
X0B8yvz0zVYN0lG3EZ/PeCv/5DXDL4Y3l/WsvR1/pemkoJUz4Wx4gNZFPEdI7RZpjIBiMrIKjs59
xx43aW8mC6rtQBwGfq0EZUkbeEHRq+t5l9QE/BP1jyfI9U/u+2hBUrK736He9k4C4xYKa9WPiXeO
f+WtaCDMAXh6BNw2DSvAqoRIGdmIM/QxDOEn7CAP440b6k+A8UEcW5fpb3Y+LzIV9r/wdZ6WCd6N
IkBVoMEpijrMD0fH9Qmlqv/RAxwybCfHkswzDA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
vnirXgxmH3+7VL6K6P4M4KbPfjmG6Q3aI4oLh2go4fiRHH/fPita0cq2G/grkKX0VC3fHVK0/R7+
Dqdz0KdlfCblfjnf2VyU1MlKM3ZFaUAfr75oWcx41yj+AWUvadfCX/pNdd1UVQux/ybNPsYTowhZ
sT9BQHxZfGhvYIBncHBcN43k01FcLkHx6PKRw00wZfMm9fiTNagw4BHS700G4eofHJfoD+Cf220J
CpZ09HG7XCBZGz4VM74pzhbQUP+Z/L3fvyPbLyGLUEQhfv0v5KBA/AzdU15JWFzZrwXJ1SkKXLAR
Z7AyN6ui4boeB+cdAwSoxW5Wjgyvg4M6Z/NMMw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7200)
`pragma protect data_block
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
mlixg8DJyAQj/W6tRa4fAMeO
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
