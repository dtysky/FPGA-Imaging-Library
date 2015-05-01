# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "data_width_in" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_width_out" -parent ${Page_0}


}

proc update_PARAM_VALUE.data_width_in { PARAM_VALUE.data_width_in } {
	# Procedure called to update data_width_in when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_width_in { PARAM_VALUE.data_width_in } {
	# Procedure called to validate data_width_in
	return true
}

proc update_PARAM_VALUE.data_width_out { PARAM_VALUE.data_width_out } {
	# Procedure called to update data_width_out when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_width_out { PARAM_VALUE.data_width_out } {
	# Procedure called to validate data_width_out
	return true
}


proc update_MODELPARAM_VALUE.data_width_in { MODELPARAM_VALUE.data_width_in PARAM_VALUE.data_width_in } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_width_in}] ${MODELPARAM_VALUE.data_width_in}
}

proc update_MODELPARAM_VALUE.data_width_out { MODELPARAM_VALUE.data_width_out PARAM_VALUE.data_width_out } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_width_out}] ${MODELPARAM_VALUE.data_width_out}
}

