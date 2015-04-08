# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "init_delay" -parent ${Page_0}
  ipgui::add_param $IPINST -name "harris_th_p" -parent ${Page_0}


}

proc update_PARAM_VALUE.harris_th_p { PARAM_VALUE.harris_th_p } {
	# Procedure called to update harris_th_p when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.harris_th_p { PARAM_VALUE.harris_th_p } {
	# Procedure called to validate harris_th_p
	return true
}

proc update_PARAM_VALUE.init_delay { PARAM_VALUE.init_delay } {
	# Procedure called to update init_delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.init_delay { PARAM_VALUE.init_delay } {
	# Procedure called to validate init_delay
	return true
}


proc update_MODELPARAM_VALUE.init_delay { MODELPARAM_VALUE.init_delay PARAM_VALUE.init_delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.init_delay}] ${MODELPARAM_VALUE.init_delay}
}

proc update_MODELPARAM_VALUE.harris_th_p { MODELPARAM_VALUE.harris_th_p PARAM_VALUE.harris_th_p } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.harris_th_p}] ${MODELPARAM_VALUE.harris_th_p}
}

