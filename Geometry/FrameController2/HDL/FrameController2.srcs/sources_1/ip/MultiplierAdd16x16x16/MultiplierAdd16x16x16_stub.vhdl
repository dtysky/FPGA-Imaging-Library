-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
-- Date        : Wed Apr 29 02:32:04 2015
-- Host        : Dtysky running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               b:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/FrameController2/HDL/FrameController2.srcs/sources_1/ip/MultiplierAdd16x16x16/MultiplierAdd16x16x16_stub.vhdl
-- Design      : MultiplierAdd16x16x16
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplierAdd16x16x16 is
  Port ( 
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    C : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SUBTRACT : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 47 downto 0 );
    PCOUT : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );

end MultiplierAdd16x16x16;

architecture stub of MultiplierAdd16x16x16 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,CE,SCLR,A[15:0],B[15:0],C[15:0],SUBTRACT,P[47:0],PCOUT[47:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xbip_multadd_v3_0,Vivado 2014.4";
begin
end;
