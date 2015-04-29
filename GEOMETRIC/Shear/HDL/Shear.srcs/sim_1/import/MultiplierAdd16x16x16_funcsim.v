// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed Apr 29 02:32:04 2015
// Host        : Dtysky running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/FrameController2/HDL/FrameController2.srcs/sources_1/ip/MultiplierAdd16x16x16/MultiplierAdd16x16x16_funcsim.v
// Design      : MultiplierAdd16x16x16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "MultiplierAdd16x16x16,xbip_multadd_v3_0,{}" *) 
(* core_generation_info = "MultiplierAdd16x16x16,xbip_multadd_v3_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=xbip_multadd,x_ipVersion=3.0,x_ipCoreRevision=5,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=zynq,C_A_WIDTH=16,C_B_WIDTH=16,C_C_WIDTH=16,C_A_TYPE=1,C_B_TYPE=1,C_C_TYPE=1,C_CE_OVERRIDES_SCLR=0,C_AB_LATENCY=-1,C_C_LATENCY=-1,C_OUT_HIGH=47,C_OUT_LOW=0,C_USE_PCIN=0,C_TEST_CORE=0}" *) 
(* NotValidForBitStream *)
module MultiplierAdd16x16x16
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  input [15:0]A;
  input [15:0]B;
  input [15:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) input SUBTRACT;
  output [47:0]P;
  output [47:0]PCOUT;

  wire [15:0]A;
  wire [15:0]B;
  wire [15:0]C;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

(* C_AB_LATENCY = "-1" *) 
   (* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "16" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_WIDTH = "16" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_C_LATENCY = "-1" *) 
   (* C_C_TYPE = "1" *) 
   (* C_C_WIDTH = "16" *) 
   (* C_OUT_HIGH = "47" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_TEST_CORE = "0" *) 
   (* C_USE_PCIN = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* DONT_TOUCH *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MultiplierAdd16x16x16_xbip_multadd_v3_0__parameterized0 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* ORIG_REF_NAME = "xbip_multadd_v3_0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* C_A_WIDTH = "16" *) (* C_B_WIDTH = "16" *) (* C_C_WIDTH = "16" *) 
(* C_A_TYPE = "1" *) (* C_B_TYPE = "1" *) (* C_C_TYPE = "1" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_AB_LATENCY = "-1" *) (* C_C_LATENCY = "-1" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_USE_PCIN = "0" *) 
(* C_TEST_CORE = "0" *) (* downgradeipidentifiedwarnings = "yes" *) 
module MultiplierAdd16x16x16_xbip_multadd_v3_0__parameterized0
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [15:0]A;
  input [15:0]B;
  input [15:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [47:0]P;
  output [47:0]PCOUT;

  wire [15:0]A;
  wire [15:0]B;
  wire [15:0]C;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

(* C_AB_LATENCY = "-1" *) 
   (* C_A_TYPE = "1" *) 
   (* C_A_WIDTH = "16" *) 
   (* C_B_TYPE = "1" *) 
   (* C_B_WIDTH = "16" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_C_LATENCY = "-1" *) 
   (* C_C_TYPE = "1" *) 
   (* C_C_WIDTH = "16" *) 
   (* C_OUT_HIGH = "47" *) 
   (* C_OUT_LOW = "0" *) 
   (* C_TEST_CORE = "0" *) 
   (* C_USE_PCIN = "0" *) 
   (* C_VERBOSITY = "0" *) 
   (* C_XDEVICEFAMILY = "zynq" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   MultiplierAdd16x16x16_xbip_multadd_v3_0_viv__parameterized0 i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
IsOvzbC3k95FgNmiQRrhfj/YRv+loDHrYfBYOUrwAe4BdGOkHSjQSO47/WP9N2bLdlN51vJGuA8P
Lm9xtrNmhg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
OzvzKNgjn/v6ki8dQUWBLoo6iLAIoEc7pJW7Jzqj5rcbTzMYzDmhljgrYUWVyx6FBY8oXG3OJe7x
8yRZwEnmOXaHvrOEOkFIMDiZaMVivz2QeMsf86iAGZx9drOWYddBNnMnhazLZdyUDROZwAkKhrtv
lH6GC38Dktbsimiqxoc=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
gluZfIqPb5wdZpYzCSpC5Bfh2ivX0wle3reeN1ATbb6THlSlDW69iqye4BIGfqjktymrV7ukV9LN
HaIh1KJ3LwZsvLQcC24ZK/THPjuSWHHJGSPion3vlxo9TmuwwE+n/jbFOR9X9wmTUdKDeupRPO9f
L2+PvwWkhofgogBX7gua5uczSWOiqcObOa+pj0C9q/C8+v6qkUIKdZCbC08J7MhII/vxnIwVINzd
5kmZVpJR9G1kRs0sOCkV73EVVHwOrrXMhqqznm8Vp2sFYTHWJZv1BdPzmE8P+QIaNQc3RtqMU2bF
H7ABz79wfsV8MB8+4Le5ON/AOQkxksZtKJW31g==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
yJGxxTnDMjLUTWaV3Qmz7LDYoCvu1c10c4s2AR/3ood62WLpZ61zhFD7u3Kq7ABrLG7HadUifnAb
hQjTvmchw0auYNvIybeCQyLkyRTtHV7RXMgXlw/V3XapuDsVZwtuC4Jd3/4ysDJUn+m/14vSrwaO
mxWTSeBb8+aGiYi675s=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
WPJafWGnitjqrQl/4fkkf4Owwrn1epgXngudvcOeeWbb4fTEuY04w8YttyATgZBtutlkHcaadNDW
99KgMcFRVbJ2lMs2na7X2F2AroYp7Z7GWjEef4NCorOIOrXizS/hKe/UWFYMntxNLYy2hgy5VC8I
rCx5aXYBDZniWBjS242meLBepabsZOBijHFzuj5SBzz6J9CRhxyRD7UDxrZZMkPCEQwPWT6FJjpM
xm+3IWUQlcxACKq0LgABCdoAf7z6emLOQyjvht8xSjNVjY0+ODI+93f9nz78TseWhNWPdOhGAKc9
ZaYrmTa1pwbe0armcZD+peMipIBN1uIQvXeoTg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
kByoEBWFaAeEL49PCbvzWDtA4NhjUB2vZ3WFc2JN0vzSOhxtg43v0dvdOfqWCqghqerNzN9Mbdm9
KdR+CwOdWyu9vVkunDMxc3IxDpdyO3LH1rt4D3yDXHbc6UMFbfgb68e234QaN0cub5HfArJAw87R
95SsjXvcy/PbXS7NAEIjfNL7aK2iZn86YSuSint4bXylb2RTSn7kxanLw64p01cRCZZa8ojyfcus
gmTh6n2nnUmbjm9XGOM4HhJND1sY8/HgUtL2h1+aijAsxtM6SKaFgFSxlgwVTIIRkVhEol9rqmXV
ARVP62ylPbJW+kNiTpu9J1bRbsDG3aQM/88yQg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
OK/BbPr7d08b2f61HG/5zMXSyXnhub8zxeBBddbXjlSEMLsP+5qNv1A8ADTgH1n632aQTq8QDmBi
N2ppg06dkr5v/rHkeDtuYPgrSBYVotd09Sgmfj7DUf5qZYf5f5M6aKx6aig/QFSoF1HVcbB+q242
5awUVJDBoV3YivWw6ELqEcYj3G0zRx/0StBzPRHshUiPaXSz7F/JM3iLYiXNoMuyOWUi7cRPtku0
mQQ2gnTHa2Ega3FtWTYFKMoPWGWvdHMCgAztNUJ8gA3/8sgGP7EtLRHdEvCSwFK0itTTCNTWgOEL
km96leIyB92tu9iGVqw/S5rS9rps80+HmGD0MQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2048)
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
IsOvzbC3k95FgNmiQRrhfj/YRv+loDHrYfBYOUrwAe4BdGOkHSjQSO47/WP9N2bLdlN51vJGuA8P
Lm9xtrNmhg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
OzvzKNgjn/v6ki8dQUWBLoo6iLAIoEc7pJW7Jzqj5rcbTzMYzDmhljgrYUWVyx6FBY8oXG3OJe7x
8yRZwEnmOXaHvrOEOkFIMDiZaMVivz2QeMsf86iAGZx9drOWYddBNnMnhazLZdyUDROZwAkKhrtv
lH6GC38Dktbsimiqxoc=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
gluZfIqPb5wdZpYzCSpC5Bfh2ivX0wle3reeN1ATbb6THlSlDW69iqye4BIGfqjktymrV7ukV9LN
HaIh1KJ3LwZsvLQcC24ZK/THPjuSWHHJGSPion3vlxo9TmuwwE+n/jbFOR9X9wmTUdKDeupRPO9f
L2+PvwWkhofgogBX7gua5uczSWOiqcObOa+pj0C9q/C8+v6qkUIKdZCbC08J7MhII/vxnIwVINzd
5kmZVpJR9G1kRs0sOCkV73EVVHwOrrXMhqqznm8Vp2sFYTHWJZv1BdPzmE8P+QIaNQc3RtqMU2bF
H7ABz79wfsV8MB8+4Le5ON/AOQkxksZtKJW31g==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
yJGxxTnDMjLUTWaV3Qmz7LDYoCvu1c10c4s2AR/3ood62WLpZ61zhFD7u3Kq7ABrLG7HadUifnAb
hQjTvmchw0auYNvIybeCQyLkyRTtHV7RXMgXlw/V3XapuDsVZwtuC4Jd3/4ysDJUn+m/14vSrwaO
mxWTSeBb8+aGiYi675s=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
WPJafWGnitjqrQl/4fkkf4Owwrn1epgXngudvcOeeWbb4fTEuY04w8YttyATgZBtutlkHcaadNDW
99KgMcFRVbJ2lMs2na7X2F2AroYp7Z7GWjEef4NCorOIOrXizS/hKe/UWFYMntxNLYy2hgy5VC8I
rCx5aXYBDZniWBjS242meLBepabsZOBijHFzuj5SBzz6J9CRhxyRD7UDxrZZMkPCEQwPWT6FJjpM
xm+3IWUQlcxACKq0LgABCdoAf7z6emLOQyjvht8xSjNVjY0+ODI+93f9nz78TseWhNWPdOhGAKc9
ZaYrmTa1pwbe0armcZD+peMipIBN1uIQvXeoTg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
kByoEBWFaAeEL49PCbvzWDtA4NhjUB2vZ3WFc2JN0vzSOhxtg43v0dvdOfqWCqghqerNzN9Mbdm9
KdR+CwOdWyu9vVkunDMxc3IxDpdyO3LH1rt4D3yDXHbc6UMFbfgb68e234QaN0cub5HfArJAw87R
95SsjXvcy/PbXS7NAEIjfNL7aK2iZn86YSuSint4bXylb2RTSn7kxanLw64p01cRCZZa8ojyfcus
gmTh6n2nnUmbjm9XGOM4HhJND1sY8/HgUtL2h1+aijAsxtM6SKaFgFSxlgwVTIIRkVhEol9rqmXV
ARVP62ylPbJW+kNiTpu9J1bRbsDG3aQM/88yQg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
OK/BbPr7d08b2f61HG/5zMXSyXnhub8zxeBBddbXjlSEMLsP+5qNv1A8ADTgH1n632aQTq8QDmBi
N2ppg06dkr5v/rHkeDtuYPgrSBYVotd09Sgmfj7DUf5qZYf5f5M6aKx6aig/QFSoF1HVcbB+q242
5awUVJDBoV3YivWw6ELqEcYj3G0zRx/0StBzPRHshUiPaXSz7F/JM3iLYiXNoMuyOWUi7cRPtku0
mQQ2gnTHa2Ega3FtWTYFKMoPWGWvdHMCgAztNUJ8gA3/8sgGP7EtLRHdEvCSwFK0itTTCNTWgOEL
km96leIyB92tu9iGVqw/S5rS9rps80+HmGD0MQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5888)
`pragma protect data_block
0FVIPdsNDQsDBtN9hLZuNUNGfdt6fi8+ESCt3rQsRfRzzWEFFmWBgZqgBwBT0EIa+uxljdZLcoSK
xKq61f25SDQAle+dZ1AECurwtlyvpq1VI4NFnxao915tNz/fcV55+8XbBGcLhvpmeeXqzvrm28q2
c/+giKL8EUFiEwsMAUOXODJz5pDFwFu1H5Mq0z0AMyKUszCgGJWKvycDItGct//BTQYKb4a9+DPX
X2Mw/ec+L6PSRlMM9Pl8Fsi7Ks8kdOyNov72HEfYD0yR1FGV/Js7cVXd81sOAL46dMTaZUmge36w
002nM/5OA12cpUlZ/OdUTQL5AAUcK+NA4ZU+7WT1GfV/bKkl6W+0b6E4P4LUh6nCHjzbhMc2P1Ax
fD3Xwu5BR71IOO3wD0K+uDzvQ6I3l1xS/dulIpkL2JHssQy6YmTdnPqBVTNljyfeHaJDgWh+h/tX
u7ignUYxfnpOTETR0i4Vk1pFPyidPsCOXvk7njaulHgUpLaRGIFLIfRV5MSflMNpyvazUDdSNB7l
nFIVj2AGQrhA6Ph8DHLYAeDmbfIo4Rayqqj2k00DMgNnoMEDHLLJHb2J0KFJyXnt3T/9V59Y9CH8
scStdAEyibtoJfdaJJFpS5dRW61fWTfV1u13yJZ2sUvU5dBa0P0iri64jSWJblXE/aJcmPLMvaS6
y/12wBfYEEjbUMrWnVqZcN9sX2JKKMHWnqWX9p8XWBmjsgCpr+YakWWLsimnMoBYQjzBhytCyF8Q
7iwtPurzS4hYSkUq78Ntzfu7nsWPMOcGDJl7QwGNFq96aIpOi7asZL8/zIGbn+tiaHjPk8KMmHfZ
jZK62FE1Cjfhcs33k6C01DM/grBpiozhFwPxwpEPAXTSg4RZypiurnrQMOYshr1ZPFo6iNDX/iMz
kCi4IloFKGrEYoAY8bbDeLQ2Gt5TnoMWfS18tVCkBa9EScCPhSgvg1TN3Smg3HiJ+erd+5PoRma5
Awh5L5d7Jh4KwdMdDwWqND5Z8h6UBhULEQZojZafmL1KHuNXUNEQ3n+NKGodx1G/1UkXGfw8lH1V
1nG8kH3ICoheNPeeIjoxredNnnjIavsJq97j2l2QwIc5VJ2MuSn06iZ4oro8RTVU6UAl2V1ehCRZ
kVLrTJ8mt32/6jwuIi1cKNcr46MBM+U77UqtncqgX1GLWCd7ucTcA+S8G9FAvWyjusGB+6RiUk9+
fID8ilLBLXowS8FnxPX+hWCYZjC1AONRS9/m7I7PQaZyyd3BOTYOmuuNvajqcOuhJY5v1ovT8MUd
3+b5rcPU/wPQpPtVCkZ+TldVMc3MD1IqmXiskxsWP3FCuImLQy7AZQVcgXgNjvVMceKOsJ2GMGKv
Yb18WzjG5hpHDLdkGkb3KNa4MLtlIawcSpV+AVUIy+qvGR3rVqGzaCFKuDqah7BgiV24NoPPH0Up
ixp8qZRxjYsB+G5qgP8YTEcA15YlfSokOMcay0PcYzH9qoHQbt/l3yDUs4wEZFb6Jjnh4Shvoc5Z
zGe0MGTOPp7QoL/i9+MIpGyLt9RtOtY4R+tWCGtCE8s/i5JOXlrIyp1nnL18u1tmzaaY/qyERyAr
jXgBwvf5xUkttQjOqzKIeN0Et8qAD++qcuOrLD98JUE/khqT8okqHlCBTiDzL0I2QCA1UcVz60TX
cp97A0n+LX6JSXYZhza+bcUjRKeWVScDpB7ogii/EG8uRDLXH3F+D+tTWLbeyuM0b2ZowLNIixI5
hGcMeulajgE7rrlVcF+NKwnyI15wQjxY78iVu1liCWGhiHXM/+DGg3U5rz5BsuH4ZpGjigjPBPTM
PghcZzseO90OvoUZW/rTuRatHBUwCciQwmdPYXrVGQQ32qZsRSpdt2aY1eZs3stBYe9bnCY+sfYx
yJrxWev+4jM1tT2kncD85bpZFARDY9UDsZSJr+LqG3agv/CFKrTls0131WZ+pSQNxuRACh7+EHBB
B6tDxyoGrN1I49NcXpYquBFU7uakR3nknC1TJNx+sCdxeqDt6/FoG/9I0t4ZrsH5z9lIXMY5+3ax
osRdEO10Et9DNTLrGswiqLNxc5h3efveeVWI3CEwhMOyObLn+e7PRw7t67OqP6MZu+oHV0fVgv3K
ccsV0Y7bB9oi4Y1Izhhv/izdw9fIRIRRkcoS/o1FUxvllXhIkHuIPAPC8F5bibUguY7TUFwphrkR
/h3DzbxvggyxIvfhBDFS2uCFB6s8LaXUtUl2b6jZqJ1XbsKQUW0O6oixELXDUFu47yNYjPqymUSj
6gGCShEdeC980iAYkPYiAPiIsibA3GGLH9DiWfOht+j9zAxA4bX4VKad78+UsClSArq9bmy7Obws
K6MXXYtidN5K6egJPBy4ackYu9xtNS2g9pPGHemqHBKVR0U4kD4pyieYxwMKrPSCtDSC1wnVTGvQ
eAqrqc64HbGz6oyo0CKi4w+61W9C5Hk9rOfC6RtAqbSV/61rTuWdIjDb6ndl5QsIu+GftO0iKOd0
EmM/X7EnZVkDTEofCMSjrkaMw58lPlkxCOzCSCXrtTdoYGdPcRU87H+vxrIoY68AN6Mw0jwr8QHm
/XEQcR9/L4KczlTMqP54Iz0nK2MeC9b2PDyrJnvRgbcJpF0WWY/7K1n2KtPGpSXJ2c8jeOOwE6jw
sW6d2feM6cEHwrCH3476CmAqY1L277Utj/1itPnO7joscIXVIgK5mVbTkIVXMiZzktoqUaCFMvmt
DRqvPp3sgNkZzVnvVug2/3WF7KM8oZOtW47NhE8C1omoF/GHAPYtcmbQWsNyffA0bo/dkELGd38d
JPyEEQYPEO6kpON2F7+VpSvEVeDKspUZbaYuNihlzF/ZBiCDTqDu9laa7TePsMs1Tb4tmRAwQLsH
FtV/KFl+FGPlUr8nwwwRjxXC/RTIoT2z2MDd2bkRFbjhCn2ZkRNHZrke9LuYCaTa056A7aK8nnxi
W0TNUWyzGzSQa4ecWkn1uNgA8djocVh8Ob9GIogdLwl9oJzMZbaXIqR3SZUNUO1Wngj4XgcioWKr
czDSjAMQ7i7PSBqbZJor+2hgkjRmJtVxMmD+affADXOhxKo480gWnYY80yExR+gx1TpnZl82+Rp2
vLqb8mFlA9XkmTZ8zMFCy6oA6zruKPJWpRStuegZkQxzZ5zhp2gDVTtzW9vW9+zkEMo3uk/SSTBN
0fmM+pE2y1tXPmSpOPrTqhFO2G9pGx/pDepr2I7IAAQbo4XyKwCmOPrA3IkgPj8Kznnddd1T9zWi
fcD3WGuNJZu1Ovefs9i+0QS5Th2U9CoWw6SrJlba786fj8kUNSkjCGISol+QrzL3FkuFtNSmqGv0
pCYwIw9xwxh5ePoV1IzxdXlmO+Xx6+MPKfvH2cqL1tAOpaAY9SaWsCPFpkkSxVnc4xmH+lF4S0qM
sCWNCeFt/NsVKKM7tFnxRpMUM86PbSwvPrW+tuc4bl7cG3KndghmrUUUoY+TBa9j8bd1xbWku5ql
wVv6YSEOeaO7JgL3P5wGRE2+VcWbvBwWpdgQY0YFd5TBOjXrzL1Z4izqtgbft9EIMctugZ0mdlxc
F4mQSwJOT6a3GIKlwi2niKmwZqlBR5lMBe1/sLIjDw7tb4/bTzjbScy4an7AUFkmcSPmlUPpkxOR
V7YRdAY0o9hlhV0q6SDdhBit7r80PldLhl8tLZwW+IawSgX0SlPsEBI2SxjrIr/xi5Ar0tDRRej7
aF90g/jI7EKiW1b+SoTDx29AUVQiK9ZBCI67pSyRqaaUNrll3b+H8s6lcPSj9dEFyo/orZf4u21t
6U2OrFjhWS8qoser6WFC8Gk5GPsFCiY+066NxwL4TZrsjw1srjf6YnryNRO+7o1zqNqWYN8b833K
wclRyADzcPebaBawjHca0MCRfr0Vdw/IDR7s7uJdV4+aKzwmiNqGd0pD4refcnOIWzJCowMWArz8
BJdSGAGXgHU9TmEAMWbY2Ij2SOzZ3Kxmb//kNS911z0qOo3LK6zriPOVL7XixKOgY2yVHCg5/GZt
akPoiB4npWsjF5q/dbRH5aEMYBVdAcl224A35CXiSkeZ5WUkTjb1n7imC/DAH0gCzMf3th+brfi9
CizkaozSQFp67Wn9df95ft1tRTtbtC66qpDp0LQakgHepvJN/rbNhAUR3R5llSFUIn1kP8W4uaKN
kUuGCjvJXN53mMkfOlsrXGBmznvotdNghSiLgycGoUxNZPg/bTLrjf2TfksX62OJRm3pMB5XomYs
KlGo8XPntRHVIpVrrsCIEHkr4NQRMmvmXGjL2vzwnQNkMz4rtpiT70PdAPj4rwEZFuhxY/yuEeHy
wIsMQ8x4Z8Fk3si1Dh49/Xa11G4pjTdbIB1vzyfurmF07TbWra+asfM1pjSJw+tf93EKLJBO37Ws
4gVxg9RJPbWz+UgDxzbO8xPM/ZwhGWOIUmgDN4pAOWlMaz/Aq8VQnrwO3jxstNpD/jCyL+05rNnb
BBARl7bCD8xkGJe2DdzvWmpyfs5nrytkTAFNVMYcQOdiUiTsWGPr9mdCD5zR0pD5Ajk1mnwEQ0Y/
uMVxrdert9txdfUWiPJ5PcbmQHJKbKP2SMaJ6bAB4QcbiW/KmLCoegfRoQR++MIStAbR74lt4Pob
1yzIHF/BUf64dlgqbhOnFLLfRERxglGrsEvMEoS8xs9cSLzwmoEpY7r70yP2JFvRaBqzJQandxiD
fHbZLLaO5WRZBTQsfucNSW9PCWEX5CjGKuX010fUwEi7T7EIlsQFs/y4ShP1GKLMKWhOJpalS30S
5PCRyePhYDNd/FkndUkmwtfnp9PFT3/Akc4tvLi7uM7+RXZGs96ZNxnTxelj0SopBeWLbx9moLdQ
ImiaaFRnJwxtQb0UcDNn0wP1NM1kBZ6k1f8p7EtBWDWz0zXlBLQN2CP5qF+7VmphYeywnfQkW3zu
837QNqh35yaYWsTFs8aK4Zus2CCxNjWA8vVYXkgTF3AKAXvbkcKT/mJJTMM/Z8Duw8p/VF2nzlLW
93F6BNbxJ/Yr9HOmjmbt5nOlRGRTlutZbTt7tfsI4wP9h1Rk/orpHPt8kEgfAOoorVivTC2YwHFj
jauuQaTUlsPo6KNYzZtS2q5htf8K2+9ikxz6kV11Y/iHwnGKc7Qe4rBHn5rdb6s6ZtpGSdJmp9Nt
eZZjzAC/q2LcnKWiAQZ4/fYqkVc3Mzf6lEMY13C+xbmbS3viiMwC0finv5gUYDcbmLrDAOvhXX6J
kDhabh4LYm+7avg02MUfCy30OshZXo0lWmWApWGEkHzpUPTTbF7O4lDHYz9n2SDPWT/XkWZpyMJY
aJ63tKUhiyELdbYTmMM48v2yyWcaviCsyk5SoBd5OOGOuRIDOZSuhI8AshSqkYsdkGgRJXLE9RyN
6mjpc/zTGdzT++eRGjF4LnhZeHBUx4GHfdWZ+xtWagabmReZfRQIrd0iaNHh+drVy4XybPTVbKvo
zRptQYJLEdgR1HXlWN71PjHR6fGlfX2AQ8f2CZJRNjTybaHHzxWpRbp3l/SshTy6ah3PCfVon6mx
HEbGtPgFELkcEOJuBmZCaTGa6pUY3WGF9g3FuxOiEGOvo6n1k7Lr8lyI30TGf135WsQ7ZkzXAzFy
brDP4toLY30qJFx9E6n+qzOpaKF7sC6qvCUH2mwvmaacKN5FiMyTtl/QgO86EKQgkf2C1iuKoD0i
FmWFM2nSRGgQchqCRacRCwffkem2WH+kJNtbS46xxryfh2nCIe9xqSKe3dKPOokVhatuAlwkz7GB
WPe6KtaFPnchN1a6gB66bolikhCqCjsQCGEQNX8TiVxiYPWilcpDqK/6CIakGsYbt0yrW2/l4erN
sZ1GgEhjBqfgw+fEEGMGImzY/nhTgRezaPTb/7XXUsNK82KMM/0FOSqdcRwa2rxq+Y4JOJaQNsyy
6FD3/ishDJyxPV3HajLk2rRk0gHP/I7otX/aYMa/jgrlitSwMLqYLs/GmQkaGSPeSQo+gOZ1MLX/
j6e7tO8Qt7pDWDbdOuIsY5ZrXXstf5Z0j3OCmSBJgnXIGZHpHNgiV+DySJP9EQCMT3hXtGXAcHsJ
MkXKBAjreKfC2YoEAEZi5rvepT1UyYw3ZyerMYRjkfV63aZRu3LIOghDBt9aUENZl8FMCU3+0SAf
gBzFK4ycnqaEFXhaByx3tQ/wUQn/10foRPxnj7Kmam2TOc2qHHLpPnOZXDAbwMJcBtMw1oxeA8a/
w9zJXf42Yix54FB3PU71eemjRq0BoX9ZLwITNSATqxuB51/jScJmgUa4o1KTIWHfYNg7rGYaA1m6
vT1l6WaQaVUGXQsqDYKmI3RXMvbdIDeFXCmYtc2Y6Nr/g/ClCkOBBWXkp5uWVh4tw7GA5YLdoOxM
pbS0KbOuiA5CHv7NW9Kykkx24ft6sufrH8v7oiQtEoO2XWG8UdW+Qoul4Mw/b7WmLckikEnmjNvX
zpCYp+asmJw8Wgr6Qf9CP0A8xlclbADTZ4mVkJ7qwdsIs14svYXKTeuW+0N3c6CbQMPZGdHf6su2
djz6awU6OyTH2Ib2/9++UV7rH+iKDdAsvByihk0HvVypsii70+6/hEBdlTO2f4lggggMIy9Keyrz
Auet4oWkF5p06xQM921u4ISneflbtT86YHfUtF2LY979zngXp48g7Ip7WWnhXT+lDE6HnUsGhFp6
371HzWVlPD/l0LyU5BwJOHGF5cejyYARRyava2wL53zkZbjOcNTnYs0zB5rhMN04e/le5HCTLUK3
QTGEK7ocHikldkYMlNazNTKCV8Z07EkeoscuIyGyKogIHWgGpcy5myM5wZiuxVRndw9KigW5xUOy
dCfOL/TBW/ifz7j9Cvr3rDGoeBdxKXJjViesFDkIUwkwZLnhQSa4vGlEmA7ffL2gHtN0JnvoQ17q
5w6izYiyxcKreehZiERHcFbS1D7/ikOXu43gH7PviNGDy0uJway8mpoPD7b8DW08lU7nu/1BIF2D
LrapSRzcEYqBlvNbgfQWaxiRh5e2fb94aYinUQOd+EBAnC5+ah3Ma6RvJMdf5Fp54Fe/1C0Zf22e
vwYzZqnR6p5mm4/X9iS3OPxU4TCEAYbNet0d9zUIiXhH8O19kOSQSocjqdCvoM1IcNon0QC1WRTo
/INmYtuZ0xoOBbmQuNe5JJtDxX5yXZW0JzUbxy8huJRejbo3O0lXsv9Wgtt3F3vihiC0AXRSnOAo
+fsOF1nxdgdHfuF5TsTsyI6I3FIWM9h+F1WBWCGkhA+KOFc7qNYqgksvR8fQUDdvJ9hz5vmrd5e1
RyiGReZUJmVXaBCtv75u+2H7+GbebwjZz0md2NmzQ33nR83DNF/7bdR+3gSEtM0VV8pBM+KqIoGy
C91p657q28LBBqe3o2DA0pJSkE8DVNAw5DxUFT5OdtCGA6IqOKFE5iTVrgSFxKd3v4U5f58FBuuA
gl6ck/E8oU0DTumAU16HUrHg9y1acySn5ZFrkwUkDRqFaG9Ru9kP8wmQEY9R/QcxLIBLrKLiF0JG
0Pup0BlSZT8WfLIt0rzUiAmD3DQnuA1KJK0L9U/fwg68oATYwWbVGXSO9kaOcnnfe+25LV2qObve
zDNzxfqlqwXwchRul1/V8EdPyIXKA9xX0sCknKK6ksqrvLVCaaZZ3ykoMn9kUf53+A118hYPAHca
XrAFZ1vR3//wLtKaxbaBSlW74TpL0MmK1n8HdgqNLHD6gM8sPlKZvHVVtLTI65xkGrljaqxvEr4o
kOZ+N78IYHj/LZBk2lLAqnBD9fplLTj5xltlWF6hwcKWVC9fJw+gTAdtj0C5BLpZOtQGxyY/ZSUX
GHQ/Z0SwGnr/PU7KvvADJ48=
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
IsOvzbC3k95FgNmiQRrhfj/YRv+loDHrYfBYOUrwAe4BdGOkHSjQSO47/WP9N2bLdlN51vJGuA8P
Lm9xtrNmhg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
OzvzKNgjn/v6ki8dQUWBLoo6iLAIoEc7pJW7Jzqj5rcbTzMYzDmhljgrYUWVyx6FBY8oXG3OJe7x
8yRZwEnmOXaHvrOEOkFIMDiZaMVivz2QeMsf86iAGZx9drOWYddBNnMnhazLZdyUDROZwAkKhrtv
lH6GC38Dktbsimiqxoc=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
gluZfIqPb5wdZpYzCSpC5Bfh2ivX0wle3reeN1ATbb6THlSlDW69iqye4BIGfqjktymrV7ukV9LN
HaIh1KJ3LwZsvLQcC24ZK/THPjuSWHHJGSPion3vlxo9TmuwwE+n/jbFOR9X9wmTUdKDeupRPO9f
L2+PvwWkhofgogBX7gua5uczSWOiqcObOa+pj0C9q/C8+v6qkUIKdZCbC08J7MhII/vxnIwVINzd
5kmZVpJR9G1kRs0sOCkV73EVVHwOrrXMhqqznm8Vp2sFYTHWJZv1BdPzmE8P+QIaNQc3RtqMU2bF
H7ABz79wfsV8MB8+4Le5ON/AOQkxksZtKJW31g==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
yJGxxTnDMjLUTWaV3Qmz7LDYoCvu1c10c4s2AR/3ood62WLpZ61zhFD7u3Kq7ABrLG7HadUifnAb
hQjTvmchw0auYNvIybeCQyLkyRTtHV7RXMgXlw/V3XapuDsVZwtuC4Jd3/4ysDJUn+m/14vSrwaO
mxWTSeBb8+aGiYi675s=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
WPJafWGnitjqrQl/4fkkf4Owwrn1epgXngudvcOeeWbb4fTEuY04w8YttyATgZBtutlkHcaadNDW
99KgMcFRVbJ2lMs2na7X2F2AroYp7Z7GWjEef4NCorOIOrXizS/hKe/UWFYMntxNLYy2hgy5VC8I
rCx5aXYBDZniWBjS242meLBepabsZOBijHFzuj5SBzz6J9CRhxyRD7UDxrZZMkPCEQwPWT6FJjpM
xm+3IWUQlcxACKq0LgABCdoAf7z6emLOQyjvht8xSjNVjY0+ODI+93f9nz78TseWhNWPdOhGAKc9
ZaYrmTa1pwbe0armcZD+peMipIBN1uIQvXeoTg==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
kByoEBWFaAeEL49PCbvzWDtA4NhjUB2vZ3WFc2JN0vzSOhxtg43v0dvdOfqWCqghqerNzN9Mbdm9
KdR+CwOdWyu9vVkunDMxc3IxDpdyO3LH1rt4D3yDXHbc6UMFbfgb68e234QaN0cub5HfArJAw87R
95SsjXvcy/PbXS7NAEIjfNL7aK2iZn86YSuSint4bXylb2RTSn7kxanLw64p01cRCZZa8ojyfcus
gmTh6n2nnUmbjm9XGOM4HhJND1sY8/HgUtL2h1+aijAsxtM6SKaFgFSxlgwVTIIRkVhEol9rqmXV
ARVP62ylPbJW+kNiTpu9J1bRbsDG3aQM/88yQg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
OK/BbPr7d08b2f61HG/5zMXSyXnhub8zxeBBddbXjlSEMLsP+5qNv1A8ADTgH1n632aQTq8QDmBi
N2ppg06dkr5v/rHkeDtuYPgrSBYVotd09Sgmfj7DUf5qZYf5f5M6aKx6aig/QFSoF1HVcbB+q242
5awUVJDBoV3YivWw6ELqEcYj3G0zRx/0StBzPRHshUiPaXSz7F/JM3iLYiXNoMuyOWUi7cRPtku0
mQQ2gnTHa2Ega3FtWTYFKMoPWGWvdHMCgAztNUJ8gA3/8sgGP7EtLRHdEvCSwFK0itTTCNTWgOEL
km96leIyB92tu9iGVqw/S5rS9rps80+HmGD0MQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 1536)
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
