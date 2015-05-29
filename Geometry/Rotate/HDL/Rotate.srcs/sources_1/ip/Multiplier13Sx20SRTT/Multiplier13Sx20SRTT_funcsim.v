// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Fri May 29 20:15:13 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/Master/Geometry/Rotate/HDL/Rotate.srcs/sources_1/ip/Multiplier13Sx20SRTT/Multiplier13Sx20SRTT_funcsim.v
// Design      : Multiplier13Sx20SRTT
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "Multiplier13Sx20SRTT,mult_gen_v12_0,{}" *) 
(* core_generation_info = "Multiplier13Sx20SRTT,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=zynq,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=13,C_A_TYPE=0,C_B_WIDTH=20,C_B_TYPE=0,C_OUT_HIGH=32,C_OUT_LOW=0,C_MULT_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=0,C_B_VALUE=10000001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module Multiplier13Sx20SRTT
   (CLK,
    A,
    B,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [12:0]A;
  input [19:0]B;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [32:0]P;

  wire [12:0]A;
  wire [19:0]B;
  wire CLK;
  wire [32:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "0" *) 
   (* C_A_WIDTH = "13" *) 
   (* C_B_TYPE = "0" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "20" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "32" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier13Sx20SRTT_mult_gen_v12_0__parameterized0 U0
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
(* C_HAS_SCLR = "1" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "13" *) 
(* C_A_TYPE = "0" *) (* C_B_WIDTH = "20" *) (* C_B_TYPE = "0" *) 
(* C_OUT_HIGH = "32" *) (* C_OUT_LOW = "0" *) (* C_MULT_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "0" *) (* C_B_VALUE = "10000001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Multiplier13Sx20SRTT_mult_gen_v12_0__parameterized0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [12:0]A;
  input [19:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [32:0]P;
  output [47:0]PCASC;

  wire [12:0]A;
  wire [19:0]B;
  wire CE;
  wire CLK;
  wire [32:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "0" *) 
   (* C_A_WIDTH = "13" *) 
   (* C_B_TYPE = "0" *) 
   (* C_B_VALUE = "10000001" *) 
   (* C_B_WIDTH = "20" *) 
   (* C_CCM_IMP = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "1" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "32" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   Multiplier13Sx20SRTT_mult_gen_v12_0_viv__parameterized0 i_mult
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
pQ9784or/rftcmxu9SeZePL1Xu1yyh2HXu1otSYVPuXczyiRlwJCmXf5eMimCDbXTIsQhvM4eZgy
B1yViOiKEA/6ROPShl+yBZJfgnkED+RWXxruzs976AvUTjw9fHtGjLHezqkC2/1h+sJKzzqvHDkb
kHG/Xg4430fMWq4pMLsI1jT/dj3IOQVNDOt+PhYvqJuoeV+HU+0P5vv0aRE8eWnliDFLQHmB2SIE
tQUN/efk6bRGWCZovRhB+5W3QPetoyzWriD1wgJZ0HvC9I8Rq8n4QxEOkZuEE72h0pMWjgnJ2fjB
fWIpFIHTRwDI8tzVAtt6TeJmzSwgcBBFZEyhNg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
oye7kd9k7j+6leanFpsQcydmNiEXCEbBthTx7Dmx+uNiIA+oIX2G4nlyuirR4z+SuEp6xkYw9FDw
LTmGVWQnvKgFlEq65yOl2x/fecA2DoXFwSNpAhOwpzYejaIJds3etfsCRKProXZVwvdAhjVzXF/S
qSRt3bg+3TA6vzMpxe3rOLagXwQe8tFRcxFr57tnF/aOmtg7Ou6F3fpEqDG0cIx4RtlP/rMBKVc9
ZDytUdlTXvojYBw7V3i2cOkVzDa0r+Z7xq6s4S4f1Kcw5QlRAQpIoIVbvJz4VwxJqgW+9dltT83i
26noQnHG8HzI3/cC/ctd9i6kgkDw4XwetJZQTQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7296)
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
