# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "rows_width" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Page_0} -text {



Discriptions:
The lowest color_width-bits of out_data are the first row!


clk: Fifos clock.

rst_n: Reset all fifos, active low, at least 3 duty.

in_enable: Input start flag.

in_data: Image source data, 8bits, the first data must be given in the same time with in_enable enabling.

out_enable: A flag, it will be higgh if the rows can be used.

out_data: Output data.}


}

proc update_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to update im_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.im_width { PARAM_VALUE.im_width } {
	# Procedure called to validate im_width
	return true
}

proc update_PARAM_VALUE.rows_width { PARAM_VALUE.rows_width } {
	# Procedure called to update rows_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.rows_width { PARAM_VALUE.rows_width } {
	# Procedure called to validate rows_width
	return true
}


proc update_MODELPARAM_VALUE.im_width { MODELPARAM_VALUE.im_width PARAM_VALUE.im_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.im_width}] ${MODELPARAM_VALUE.im_width}
}

proc update_MODELPARAM_VALUE.rows_width { MODELPARAM_VALUE.rows_width PARAM_VALUE.rows_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.rows_width}] ${MODELPARAM_VALUE.rows_width}
}

proc update_MODELPARAM_VALUE.color_width { MODELPARAM_VALUE.color_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "color_width". Setting updated value from the model parameter.
set_property value 1 ${MODELPARAM_VALUE.color_width}
}

