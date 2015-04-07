# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "mode" -parent ${Page_0}
  ipgui::add_param $IPINST -name "row_init" -parent ${Page_0}
  ipgui::add_param $IPINST -name "addr_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_height" -parent ${Page_0}
  ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ram_read_latency" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Page_0} -text {

Discriptions:

Mode: 0 for writing, 1 for reading.

Ram Read Latency: Depend on the number of registers by your Block Ram setting.

Row Init: Only acvtive in write mode, the first row you want to write, for correcting rows cache.



clk: colck.

rst_n: Reset, active low.

in_enable: Input enable, must enable with the same time as the first input data.

in_data: Input data.

out_enable: Output enable, will be high when the first output data output.

out_data: Output data.

ram_addr: Address for Block Ram.}


}

proc update_PARAM_VALUE.addr_width { PARAM_VALUE.addr_width } {
	# Procedure called to update addr_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.addr_width { PARAM_VALUE.addr_width } {
	# Procedure called to validate addr_width
	return true
}

proc update_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to update color_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to validate color_width
	return true
}

proc update_PARAM_VALUE.im_height { PARAM_VALUE.im_height } {
	# Procedure called to update im_height when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.im_height { PARAM_VALUE.im_height } {
	# Procedure called to validate im_height
	return true
}

proc update_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to update im_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to validate im_width
	return true
}

proc update_PARAM_VALUE.mode { PARAM_VALUE.mode } {
	# Procedure called to update mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.mode { PARAM_VALUE.mode } {
	# Procedure called to validate mode
	return true
}

proc update_PARAM_VALUE.ram_read_latency { PARAM_VALUE.ram_read_latency } {
	# Procedure called to update ram_read_latency when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ram_read_latency { PARAM_VALUE.ram_read_latency } {
	# Procedure called to validate ram_read_latency
	return true
}

proc update_PARAM_VALUE.row_init { PARAM_VALUE.row_init } {
	# Procedure called to update row_init when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.row_init { PARAM_VALUE.row_init } {
	# Procedure called to validate row_init
	return true
}


proc update_MODELPARAM_VALUE.mode { MODELPARAM_VALUE.mode PARAM_VALUE.mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.mode}] ${MODELPARAM_VALUE.mode}
}

proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width PARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.color_width}] ${MODELPARAM_VALUE.color_width}
}

proc update_MODELPARAM_VALUE.im_width { MODELPARAM_VALUE.im_width PARAM_VALUE.im_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_width}] ${MODELPARAM_VALUE.im_width}
}

proc update_MODELPARAM_VALUE.im_height { MODELPARAM_VALUE.im_height PARAM_VALUE.im_height } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_height}] ${MODELPARAM_VALUE.im_height}
}

proc update_MODELPARAM_VALUE.addr_width { MODELPARAM_VALUE.addr_width PARAM_VALUE.addr_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.addr_width}] ${MODELPARAM_VALUE.addr_width}
}

proc update_MODELPARAM_VALUE.ram_read_latency { MODELPARAM_VALUE.ram_read_latency PARAM_VALUE.ram_read_latency } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ram_read_latency}] ${MODELPARAM_VALUE.ram_read_latency}
}

proc update_MODELPARAM_VALUE.row_init { MODELPARAM_VALUE.row_init PARAM_VALUE.row_init } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.row_init}] ${MODELPARAM_VALUE.row_init}
}

