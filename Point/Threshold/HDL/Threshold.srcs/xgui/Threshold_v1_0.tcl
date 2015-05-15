# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
  ipgui::add_param $IPINST -name "work_mode" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {

work_mode:
unsigned.
Description: This module's working mode.

color_width:
unsigned.
Description: Color's bit width.

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

th_mode:
unsigned.
Description: The method to processing.
Range: //0 for Base, 1 for Contour

th1:
unsigned.
Description: First thorshold, used for all methods.
Range: color_width - 1 : 0

th2:
unsigned.
Description: First thorshold, only used for "Contour" method.
Range: color_width - 1 : 0

in_enable:
unsigned.
Description: Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be changes.
Range: None

in_data:
unsigned.
Description: Input data, it must be synchronous with in_enable.
Range: color_width - 1 : 0

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

proc update_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to update color_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to validate color_width
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

proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width PARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.color_width}] ${MODELPARAM_VALUE.color_width}
}

