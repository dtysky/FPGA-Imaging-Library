
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/ThresholdLocal_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
  ipgui::add_param $IPINST -name "work_mode" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "in_window_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "max_delay" -parent ${Page_0}
  ipgui::add_param $IPINST -name "max_delay_bits" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {

work_mode:
unsigned.
Description: This module's working mode.

in_window_width:
unsigned.
Description: The width(and height) of input window, if input is not a window, set it to 1.

color_width:
unsigned.
Description: Color's bit width.

max_delay:
unsigned.
Description: The possible max cycles from in_enable to ref_enable.

max_delay_bits:
unsigned.
Description: Width bits of max delay.

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
Description: Filter's rank, if half of full size of window, this module working as median filter, etc.
Range: None

in_data:
unsigned.
Description: Input data, it must be synchronous with in_enable.
Range: color_width * in_window_width * in_window_width - 1 : 0

ref_enable:
unsigned.
Description: Threshold enable.
Range: None

ref_data:
unsigned.
Description: Threshold, used as threshold for thresholding, it must be synchronous with ref_enable.
Range: color_width - 1 : 0

out_ready:
unsigned.
Description: Output data ready, in both two mode, it will be high while the out_data can be read.
Range: None

out_data:
unsigned.
Description: Output data, it will be synchronous with out_ready.
Range: None

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

proc update_PARAM_VALUE.max_delay_bits { PARAM_VALUE.max_delay_bits PARAM_VALUE.max_delay PARAM_VALUE.max_delay_bits } {
	# Procedure called to update max_delay_bits when any of the dependent parameters in the arguments change
	
	set max_delay_bits ${PARAM_VALUE.max_delay_bits}
	set max_delay ${PARAM_VALUE.max_delay}
	set values(max_delay) [get_property value $max_delay]
	set values(max_delay_bits) [get_property value $max_delay_bits]
	set_property value [gen_USERPARAMETER_max_delay_bits_VALUE $values(max_delay) $values(max_delay_bits)] $max_delay_bits
}

proc validate_PARAM_VALUE.max_delay_bits { PARAM_VALUE.max_delay_bits } {
	# Procedure called to validate max_delay_bits
	return true
}

proc update_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to update color_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to validate color_width
	return true
}

proc update_PARAM_VALUE.in_window_width { PARAM_VALUE.in_window_width } {
	# Procedure called to update in_window_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.in_window_width { PARAM_VALUE.in_window_width } {
	# Procedure called to validate in_window_width
	return true
}

proc update_PARAM_VALUE.max_delay { PARAM_VALUE.max_delay } {
	# Procedure called to update max_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.max_delay { PARAM_VALUE.max_delay } {
	# Procedure called to validate max_delay
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

proc update_MODELPARAM_VALUE.in_window_width { MODELPARAM_VALUE.in_window_width PARAM_VALUE.in_window_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.in_window_width}] ${MODELPARAM_VALUE.in_window_width}
}

proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width PARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.color_width}] ${MODELPARAM_VALUE.color_width}
}

proc update_MODELPARAM_VALUE.max_delay { MODELPARAM_VALUE.max_delay PARAM_VALUE.max_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.max_delay}] ${MODELPARAM_VALUE.max_delay}
}

proc update_MODELPARAM_VALUE.max_delay_bits { MODELPARAM_VALUE.max_delay_bits PARAM_VALUE.max_delay_bits } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.max_delay_bits}] ${MODELPARAM_VALUE.max_delay_bits}
}

