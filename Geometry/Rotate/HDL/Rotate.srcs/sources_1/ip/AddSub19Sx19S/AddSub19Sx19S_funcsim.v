// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed Apr 29 03:10:47 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Rotate/HDL/Rotate.srcs/sources_1/ip/AddSub19Sx19S/AddSub19Sx19S_funcsim.v
// Design      : AddSub19Sx19S
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "AddSub19Sx19S,c_addsub_v12_0,{}" *) 
(* core_generation_info = "AddSub19Sx19S,c_addsub_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=5,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=zynq,C_IMPLEMENTATION=0,C_A_WIDTH=19,C_B_WIDTH=19,C_OUT_WIDTH=19,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=0,C_B_TYPE=0,C_LATENCY=2,C_ADD_MODE=0,C_B_CONSTANT=0,C_B_VALUE=0000000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=0,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) 
(* NotValidForBitStream *)
module AddSub19Sx19S
   (A,
    B,
    CLK,
    S);
  input [18:0]A;
  input [18:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  output [18:0]S;

  wire [18:0]A;
  wire [18:0]B;
  wire CLK;
  wire [18:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

(* C_AINIT_VAL = "0" *) 
   (* C_BORROW_LOW = "1" *) 
   (* C_CE_OVERRIDES_BYPASS = "1" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_SINIT = "0" *) 
   (* C_HAS_SSET = "0" *) 
   (* C_IMPLEMENTATION = "0" *) 
   (* C_SCLR_OVERRIDES_SSET = "1" *) 
   (* C_SINIT_VAL = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* c_a_type = "0" *) 
   (* c_a_width = "19" *) 
   (* c_add_mode = "0" *) 
   (* c_b_constant = "0" *) 
   (* c_b_type = "0" *) 
   (* c_b_value = "0000000000000000000" *) 
   (* c_b_width = "19" *) 
   (* c_bypass_low = "0" *) 
   (* c_has_bypass = "0" *) 
   (* c_has_c_in = "0" *) 
   (* c_has_c_out = "0" *) 
   (* c_latency = "2" *) 
   (* c_out_width = "19" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   AddSub19Sx19S_c_addsub_v12_0__parameterized0 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* ORIG_REF_NAME = "c_addsub_v12_0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* C_IMPLEMENTATION = "0" *) (* C_A_WIDTH = "19" *) (* C_B_WIDTH = "19" *) 
(* C_OUT_WIDTH = "19" *) (* C_CE_OVERRIDES_SCLR = "0" *) (* C_A_TYPE = "0" *) 
(* C_B_TYPE = "0" *) (* C_LATENCY = "2" *) (* C_ADD_MODE = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_VALUE = "0000000000000000000" *) (* C_AINIT_VAL = "0" *) 
(* C_SINIT_VAL = "0" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_SCLR_OVERRIDES_SSET = "1" *) (* C_HAS_C_IN = "0" *) (* C_HAS_C_OUT = "0" *) 
(* C_BORROW_LOW = "1" *) (* C_HAS_CE = "0" *) (* C_HAS_BYPASS = "0" *) 
(* C_HAS_SCLR = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_SINIT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module AddSub19Sx19S_c_addsub_v12_0__parameterized0
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [18:0]A;
  input [18:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [18:0]S;

  wire [18:0]A;
  wire ADD;
  wire [18:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [18:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

(* C_AINIT_VAL = "0" *) 
   (* C_BORROW_LOW = "1" *) 
   (* C_CE_OVERRIDES_BYPASS = "1" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "0" *) 
   (* C_HAS_SINIT = "0" *) 
   (* C_HAS_SSET = "0" *) 
   (* C_IMPLEMENTATION = "0" *) 
   (* C_SCLR_OVERRIDES_SSET = "1" *) 
   (* C_SINIT_VAL = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* c_a_type = "0" *) 
   (* c_a_width = "19" *) 
   (* c_add_mode = "0" *) 
   (* c_b_constant = "0" *) 
   (* c_b_type = "0" *) 
   (* c_b_value = "0000000000000000000" *) 
   (* c_b_width = "19" *) 
   (* c_bypass_low = "0" *) 
   (* c_has_bypass = "0" *) 
   (* c_has_c_in = "0" *) 
   (* c_has_c_out = "0" *) 
   (* c_latency = "2" *) 
   (* c_out_width = "19" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   AddSub19Sx19S_c_addsub_v12_0_viv__parameterized0 xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
EqeSQPTUNoqpnK4nVrjuhvpLxxZNDJh+LNRK2Fq61au3XOscZMNjSdFnJGIReM9px3jwUK8mWPLM
l2UaT6RoRA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
R/e+Ejlqih+TSvlnIKg+dwq51h4kWd54YlCFFQy9zsheFzRESBkYAJVBQ7ILZxlIabXB9j1aVu6K
8Z9+zFqLmyMQsSIYA+K5QWIYU2Bb4Y+4ItYi3jvYDfr5JSmpj9QxtO4XgJ2RtY9KcYuWgf5gOHOo
CGJBYbRGF6KlMQNiZY0=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
FGR8zuciZ/8sVVU6xCRWgmdIMjc8uYI3UHET2BNcz8IsAUWDmcL0tHzNeDqJZtYR/mBKgtwk0FS0
brG7VZIqCDc60xU944GI813RKjn7gNR95WmCXI3nLE6zFyuG7nEwz+kAG0QnJAUKcptSnEuOtyAp
G00TZRjEgSp1ngjItSeOkXIl9iSRoxIf+ulU26wM4Qi1rpPrWbvRFwbKQXF2hKnapTa5m+QuyFQl
8oXI091D6DZJd3LchJrs+hfSyVU4LRCEhxLK35ziohIVbp02lMS2TU4VaCvVQ5W+PV//KDSpOXb5
rBSZZfGWP10mmogiFuBlCAiom0an10D3fyeyPg==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
ZlqiLdBEo9HlWl8m539vAKUx5Fn/ByKjL7kE2TM/hrLGdwE3ZteynKlE3PVhPzI/rAjvwS7dUWJx
A1N5W7f+UYJsQ1elVQIeuHDqtbs7RZnlbev9ajKV9Zt3Z/WSjOprvHNPsZgKUtaI8RvScZB/fcq1
oXqq1F7MyeI4y80ngnI=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
W9ppzRUYPhAWiZbvV6lVSv7DCAhtgisXW0N4BwCumnHvuoB5HOtawlTREf8gdVeyetpMVVyautFU
zrKAQZN0HUwBMy4hmHFt9BxCWeiaePF4YxGslc2uxKsVjTCjrSPjd1ftP+z2FG37n3xJqaJCrDQC
5Fyz1CwqyuLnsCcUfiXGobQLQEAwWPpJ5OMiWCh0pRv5U7ZildaDd/W1yQAfdQ4qgDUPes7HV/yr
bOse6nbEPbWW/7zlGjNWrNnVDHAgljR3ggdQlQMXqjkaYS66ItrqNf5UZjFaEdWHlmxH3j3f9J2Z
6DYkLL8cKeUmFtTLEhGydAnLHmEpCwTNXRGFnA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
HhohIYFt7wXY2SEamPC32xxl6VXE46/Z1kLOW4QJ49FVl5NmqTPScqLKvzQshftDE9JtAsfnQu87
BZswz/JRhOIidN5NkliWt4e663EURnNyAkH0NGWSBy5JBw/mR5eBUo8/mMpodiAkR5fcf5CiOL+B
QWS/4CftqueNDVe1yqGN6wwrwv0D9nclPo8hMZxN6sjnTKIrSfSP86kehqsAHkLyjxPnhnbvsZlL
Uf4qpnnubI0+ak292mKbR9a1V02pGwZx7HMHugZU3utg3WiqfeinzvyqGyzYe3YWJmLi8HHhQeKS
DNUs+0MzEREcJdZNz+MMrv5fFvo21X4hg2gkWA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
lkK1sV+WKezrxdGi4xXE0gS+uUkZhvc2XL5DyiKfpzsXYgbkHVGbW3/2fAykwKqQ7ut21nGEHPkZ
gyK8sE4nwLwPRh3pUz4GIo88YbKL9XJUFFggJqvToMjjhNkHDO7twbuAhJz22xNnBJFrqp4P5r8F
j06rwJIA4VMLDX03Lopwc5uwPLmp5HmiuKZY1ussN/0h6OxMutpUAJGS9ul2ZDh+zRL+4Ac+BHMg
R33Gr1ziw1jr7PHnIng8JQcnD7fEi2jGxXqcKsXnVyZ08eYbvnWQUInsfDE26yWOkEkxIZeR0SKM
gKFozYnf7FYI6vMwQ6rO/nN6iIkKPX585z/dDw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21248)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
EqeSQPTUNoqpnK4nVrjuhvpLxxZNDJh+LNRK2Fq61au3XOscZMNjSdFnJGIReM9px3jwUK8mWPLM
l2UaT6RoRA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
R/e+Ejlqih+TSvlnIKg+dwq51h4kWd54YlCFFQy9zsheFzRESBkYAJVBQ7ILZxlIabXB9j1aVu6K
8Z9+zFqLmyMQsSIYA+K5QWIYU2Bb4Y+4ItYi3jvYDfr5JSmpj9QxtO4XgJ2RtY9KcYuWgf5gOHOo
CGJBYbRGF6KlMQNiZY0=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
FGR8zuciZ/8sVVU6xCRWgmdIMjc8uYI3UHET2BNcz8IsAUWDmcL0tHzNeDqJZtYR/mBKgtwk0FS0
brG7VZIqCDc60xU944GI813RKjn7gNR95WmCXI3nLE6zFyuG7nEwz+kAG0QnJAUKcptSnEuOtyAp
G00TZRjEgSp1ngjItSeOkXIl9iSRoxIf+ulU26wM4Qi1rpPrWbvRFwbKQXF2hKnapTa5m+QuyFQl
8oXI091D6DZJd3LchJrs+hfSyVU4LRCEhxLK35ziohIVbp02lMS2TU4VaCvVQ5W+PV//KDSpOXb5
rBSZZfGWP10mmogiFuBlCAiom0an10D3fyeyPg==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
ZlqiLdBEo9HlWl8m539vAKUx5Fn/ByKjL7kE2TM/hrLGdwE3ZteynKlE3PVhPzI/rAjvwS7dUWJx
A1N5W7f+UYJsQ1elVQIeuHDqtbs7RZnlbev9ajKV9Zt3Z/WSjOprvHNPsZgKUtaI8RvScZB/fcq1
oXqq1F7MyeI4y80ngnI=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
W9ppzRUYPhAWiZbvV6lVSv7DCAhtgisXW0N4BwCumnHvuoB5HOtawlTREf8gdVeyetpMVVyautFU
zrKAQZN0HUwBMy4hmHFt9BxCWeiaePF4YxGslc2uxKsVjTCjrSPjd1ftP+z2FG37n3xJqaJCrDQC
5Fyz1CwqyuLnsCcUfiXGobQLQEAwWPpJ5OMiWCh0pRv5U7ZildaDd/W1yQAfdQ4qgDUPes7HV/yr
bOse6nbEPbWW/7zlGjNWrNnVDHAgljR3ggdQlQMXqjkaYS66ItrqNf5UZjFaEdWHlmxH3j3f9J2Z
6DYkLL8cKeUmFtTLEhGydAnLHmEpCwTNXRGFnA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
HhohIYFt7wXY2SEamPC32xxl6VXE46/Z1kLOW4QJ49FVl5NmqTPScqLKvzQshftDE9JtAsfnQu87
BZswz/JRhOIidN5NkliWt4e663EURnNyAkH0NGWSBy5JBw/mR5eBUo8/mMpodiAkR5fcf5CiOL+B
QWS/4CftqueNDVe1yqGN6wwrwv0D9nclPo8hMZxN6sjnTKIrSfSP86kehqsAHkLyjxPnhnbvsZlL
Uf4qpnnubI0+ak292mKbR9a1V02pGwZx7HMHugZU3utg3WiqfeinzvyqGyzYe3YWJmLi8HHhQeKS
DNUs+0MzEREcJdZNz+MMrv5fFvo21X4hg2gkWA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
lkK1sV+WKezrxdGi4xXE0gS+uUkZhvc2XL5DyiKfpzsXYgbkHVGbW3/2fAykwKqQ7ut21nGEHPkZ
gyK8sE4nwLwPRh3pUz4GIo88YbKL9XJUFFggJqvToMjjhNkHDO7twbuAhJz22xNnBJFrqp4P5r8F
j06rwJIA4VMLDX03Lopwc5uwPLmp5HmiuKZY1ussN/0h6OxMutpUAJGS9ul2ZDh+zRL+4Ac+BHMg
R33Gr1ziw1jr7PHnIng8JQcnD7fEi2jGxXqcKsXnVyZ08eYbvnWQUInsfDE26yWOkEkxIZeR0SKM
gKFozYnf7FYI6vMwQ6rO/nN6iIkKPX585z/dDw==


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
