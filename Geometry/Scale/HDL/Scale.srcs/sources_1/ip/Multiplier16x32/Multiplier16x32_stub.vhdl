-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
-- Date        : Tue Apr 28 17:42:32 2015
-- Host        : Dtysky running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               B:/Complex_Mind/FPGA-Imaging-Library/GEOMETRIC/Scale/HDL/Scale.srcs/sources_1/ip/Multiplier16x32/Multiplier16x32_stub.vhdl
-- Design      : Multiplier16x32
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier16x32 is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    P : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );

end Multiplier16x32;

architecture stub of Multiplier16x32 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[15:0],B[31:0],P[47:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "mult_gen_v12_0,Vivado 2014.4";
begin
end;
