# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "window_size" -parent ${Page_0}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Page_0} -text {Discriptions:



template: The template you want to match.

in_data: Input data from window, the first data must be given in the same time with in_enable enabling.

out_data: Output data.}


}

proc update_PARAM_VALUE.window_size { PARAM_VALUE.window_size } {
	# Procedure called to update window_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.window_size { PARAM_VALUE.window_size } {
	# Procedure called to validate window_size
	return true
}


proc update_MODELPARAM_VALUE.window_size { MODELPARAM_VALUE.window_size PARAM_VALUE.window_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.window_size}] ${MODELPARAM_VALUE.window_size}
}

