
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/RankFifter_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
  ipgui::add_param $IPINST -name "work_mode" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "window_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "sum_stage" -parent ${Page_0}
  ipgui::add_param $IPINST -name "full_win_bits" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {

work_mode:
unsigned.
Description: This module's working mode.

window_width:
unsigned.
Description: The width(and height) of window.

color_width:
unsigned.
Description: Color's bit wide.

sum_stage:
unsigned.
Description: Stage of sum.

full_win_bits:
unsigned.
Description: Width bits of full size of window.

}

  #Adding Page
  set Ports [ipgui::add_page $IPINST -name "Ports"]
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {
clk:
unsigned.
Description: Clock.
Range: None

rst_n:
unsigned.
Description: Reset, active low.
Range: None

in_enable:
unsigned.
Description: Input data enable, in pipeeeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
Range: None

in_data:
unsigned.
Description: Input data, it must be synchronous with in_enable.
Range: color_width * window_width * window_width - 1 : 0

out_ready:
unsigned.
Description: Output data ready, in both two mode, it will be high while the out_data can be read.
Range: None

out_data:
unsigned.
Description: Output data, it will be synchronous with out_ready.
Range: color_width - 1 : 0

}

  #Adding Page
  set Help [ipgui::add_page $IPINST -name "Help"]
  ipgui::add_static_text $IPINST -name "Copyright" -parent ${Help} -text {
Homepage for this project:
http://fil.dtysky.moe

Sources for this project:
https://github.com/dtysky/FPGA-Imaging-Library

My e-mail:
dtysky@outlook.com

My blog:
http://dtysky.moe

Copyright 2015, Tianyu Dai(dtysky). All Rights Reserved.
This project is free software and released under the GNU Lesser General Public License (LGPL).
}


}

proc update_PARAM_VALUE.full_win_bits { PARAM_VALUE.full_win_bits PARAM_VALUE.window_width PARAM_VALUE.full_win_bits } {
	# Procedure called to update full_win_bits when any of the dependent parameters in the arguments change
	
	set full_win_bits ${PARAM_VALUE.full_win_bits}
	set window_width ${PARAM_VALUE.window_width}
	set values(window_width) [get_property value $window_width]
	set values(full_win_bits) [get_property value $full_win_bits]
	set_property value [gen_USERPARAMETER_full_win_bits_VALUE $values(window_width) $values(full_win_bits)] $full_win_bits
}

proc validate_PARAM_VALUE.full_win_bits { PARAM_VALUE.full_win_bits } {
	# Procedure called to validate full_win_bits
	return true
}

proc update_PARAM_VALUE.sum_stage { PARAM_VALUE.sum_stage PARAM_VALUE.sum_stage PARAM_VALUE.window_width } {
	# Procedure called to update sum_stage when any of the dependent parameters in the arguments change
	
	set sum_stage ${PARAM_VALUE.sum_stage}
	set window_width ${PARAM_VALUE.window_width}
	set values(sum_stage) [get_property value $sum_stage]
	set values(window_width) [get_property value $window_width]
	set_property value [gen_USERPARAMETER_sum_stage_VALUE $values(sum_stage) $values(window_width)] $sum_stage
}

proc validate_PARAM_VALUE.sum_stage { PARAM_VALUE.sum_stage } {
	# Procedure called to validate sum_stage
	return true
}

proc update_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to update color_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to validate color_width
	return true
}

proc update_PARAM_VALUE.window_width { PARAM_VALUE.window_width } {
	# Procedure called to update window_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.window_width { PARAM_VALUE.window_width } {
	# Procedure called to validate window_width
	return true
}

proc update_PARAM_VALUE.work_mode { PARAM_VALUE.work_mode } {
	# Procedure called to update work_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.work_mode { PARAM_VALUE.work_mode } {
	# Procedure called to validate work_mode
	return true
}


proc update_MODELPARAM_VALUE.work_mode { MODELPARAM_VALUE.work_mode PARAM_VALUE.work_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.work_mode}] ${MODELPARAM_VALUE.work_mode}
}

proc update_MODELPARAM_VALUE.window_width { MODELPARAM_VALUE.window_width PARAM_VALUE.window_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.window_width}] ${MODELPARAM_VALUE.window_width}
}

proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width PARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.color_width}] ${MODELPARAM_VALUE.color_width}
}

proc update_MODELPARAM_VALUE.sum_stage { MODELPARAM_VALUE.sum_stage PARAM_VALUE.sum_stage } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.sum_stage}] ${MODELPARAM_VALUE.sum_stage}
}

proc update_MODELPARAM_VALUE.full_win_bits { MODELPARAM_VALUE.full_win_bits PARAM_VALUE.full_win_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.full_win_bits}] ${MODELPARAM_VALUE.full_win_bits}
}

