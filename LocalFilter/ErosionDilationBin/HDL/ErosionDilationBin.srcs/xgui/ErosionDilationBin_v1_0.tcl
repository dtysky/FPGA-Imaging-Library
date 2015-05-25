
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/ErosionDilationBin_v1_1.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
  ipgui::add_param $IPINST -name "work_mode" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "window_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "pipe_stage" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {

work_mode:
unsigned.
Description: This module's working mode.

window_width:
unsigned.
Description: The width(and height) of window.

pipe_stage:
unsigned.
Description: Stage of pipe.

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

mode:
unsigned.
Description: Reset, active low.
Range: None

template:
unsigned.
Description: Reset, active low.
Range: window_width * window_width - 1 : 0

in_enable:
unsigned.
Description: Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
Range: None

in_data:
unsigned.
Description: Input data, it must be synchronous with in_enable.
Range: window_width * window_width - 1 : 0

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

proc update_PARAM_VALUE.pipe_stage { PARAM_VALUE.pipe_stage PARAM_VALUE.pipe_stage PARAM_VALUE.window_width } {
	# Procedure called to update pipe_stage when any of the dependent parameters in the arguments change
	
	set pipe_stage ${PARAM_VALUE.pipe_stage}
	set window_width ${PARAM_VALUE.window_width}
	set values(pipe_stage) [get_property value $pipe_stage]
	set values(window_width) [get_property value $window_width]
	set_property value [gen_USERPARAMETER_pipe_stage_VALUE $values(pipe_stage) $values(window_width)] $pipe_stage
}

proc validate_PARAM_VALUE.pipe_stage { PARAM_VALUE.pipe_stage } {
	# Procedure called to validate pipe_stage
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

proc update_MODELPARAM_VALUE.pipe_stage { MODELPARAM_VALUE.pipe_stage PARAM_VALUE.pipe_stage } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.pipe_stage}] ${MODELPARAM_VALUE.pipe_stage}
}

