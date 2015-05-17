// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Fri May 15 19:43:54 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               B:/Complex_Mind/FPGA-Imaging-Library/Point/Graying/HDL/Graying.srcs/sources_1/ip/MultiplierGreenx0d587/MultiplierGreenx0d587_funcsim.v
// Design      : MultiplierGreenx0d587
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "MultiplierGreenx0d587,mult_gen_v12_0,{}" *) 
(* core_generation_info = "MultiplierGreenx0d587,mult_gen_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mult_gen,x_ipVersion=12.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_OPTIMIZE_GOAL=1,C_XDEVICEFAMILY=artix7,C_HAS_CE=0,C_HAS_SCLR=1,C_LATENCY=3,C_A_WIDTH=12,C_A_TYPE=1,C_B_WIDTH=24,C_B_TYPE=1,C_OUT_HIGH=35,C_OUT_LOW=24,C_MULT_TYPE=2,C_CE_OVERRIDES_SCLR=0,C_CCM_IMP=2,C_B_VALUE=100101100100010110100001,C_HAS_ZERO_DETECT=0,C_ROUND_OUTPUT=0,C_ROUND_PT=0}" *) 
(* NotValidForBitStream *)
module MultiplierGreenx0d587
   (CLK,
    A,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [11:0]P;

  wire [11:0]A;
  wire CLK;
  wire [11:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "100101100100010110100001" *) 
   (* C_B_WIDTH = "24" *) 
   (* C_CCM_IMP = "2" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "2" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "35" *) 
   (* C_OUT_LOW = "24" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MultiplierGreenx0d587_mult_gen_v12_0__parameterized0 U0
       (.A(A),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* ORIG_REF_NAME = "mult_gen_v12_0" *) (* C_VERBOSITY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_OPTIMIZE_GOAL = "1" *) (* C_XDEVICEFAMILY = "artix7" *) (* C_HAS_CE = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_LATENCY = "3" *) (* C_A_WIDTH = "12" *) 
(* C_A_TYPE = "1" *) (* C_B_WIDTH = "24" *) (* C_B_TYPE = "1" *) 
(* C_OUT_HIGH = "35" *) (* C_OUT_LOW = "24" *) (* C_MULT_TYPE = "2" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_CCM_IMP = "2" *) (* C_B_VALUE = "100101100100010110100001" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module MultiplierGreenx0d587_mult_gen_v12_0__parameterized0
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
  output [11:0]P;
  output [47:0]PCASC;

  wire [11:0]A;
  wire [23:0]B;
  wire CE;
  wire CLK;
  wire [11:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

(* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "12" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_VALUE = "100101100100010110100001" *) 
   (* C_B_WIDTH = "24" *) 
   (* C_CCM_IMP = "2" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_ZERO_DETECT = "0" *) 
   (* C_LATENCY = "3" *) 
   (* C_MODEL_TYPE = "0" *) 
   (* C_MULT_TYPE = "2" *) 
   (* C_OPTIMIZE_GOAL = "1" *) 
   (* C_OUT_HIGH = "35" *) 
   (* C_OUT_LOW = "24" *) 
   (* C_ROUND_OUTPUT = "0" *) 
   (* C_ROUND_PT = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MultiplierGreenx0d587_mult_gen_v12_0_viv__parameterized0 i_mult
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
gMlH8dF3MsrU4uZuaL22NdrRbEm7vKMokj3Y/CuDSuEAVk4JZX+SM+TSLYr/DAQ44PTXF9tebsp6
0Q2sl78Xt47lFfawxFFhYMs+FRA0mUlA7VBbLf4s0ySVHGw8hQvYB8CjRj1zS0bZB6i28vx8dAO+
Ax+4rbwgMenJMBUfO7iOyK1CCdsGRss6V/XzpxA1fzncTj66YGwDGxvfq/p96w0/4nZly/jKp5a1
ZFS7TCpRGrXHFS6rPdizHSfEf3cQes2Oab4JE0wCsQjoAnHiEiR46rfYBlp/yzNARAOJBVciAukX
WRkSUifE6d3sySVLVTLu4R3lGAHTkGw1Z/uNSA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
c+/Eo9u+LgOAuTRJQ5NblPu3tgvmo2bSlSZUwd0FWlburHxVkVak6UVuuEfgxlOutaf3EjNvdC2I
5wyPBiX2952wK+mrwvhS2Sl15hqqXHxTNT/iqYW+KedC024zNXOHNBHbAlODmkLDZu5f8B9AgXwM
vUkkAhMFGLlmdGNgqFYRr7LPgF4Q5AKGjF8zl8wh45NXAjbHBq//NiALNsKbrFK1chMAHXEWBdOO
kgM0igIyehLVz8zXz2Y85jYj4j2ccXMa+DWXuh5yAw/ORBLYNjMbwf/8Q9mJju6FdDHhBjXAenFt
+CDJef4MxmJXgUrieeQy9r4PzEkoMPGjJr6Bmw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9824)
`pragma protect data_block
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
5vBuYT621eOt386I0s5s4o8c41o=
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
