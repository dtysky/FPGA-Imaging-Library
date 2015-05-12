# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "mode" -parent ${Page_0} -widget comboBox
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Page_0} -text {
Discriptions:
Mode: For selecting which kind of thresholding you want, "Base" is for normal binarization from th1, "Contour" is for  contour detection threshold, "Ternary" is for ternary threshold.

clk: Clock.
rst_n: Reset, active low.
th1: First threshold.
th1: second threshold.
in_enable: Input enable.
in_data: Input data, the first data must be given in the same time with in_enable enabling.
out_enable: Output enable, low -> high when the first data can be read.
out_data: Output data.}


}

proc update_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to update color_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.color_width { PARAM_VALUE.color_width } {
	# Procedure called to validate color_width
	return true
}

proc update_PARAM_VALUE.mode { PARAM_VALUE.mode } {
	# Procedure called to update mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.mode { PARAM_VALUE.mode } {
	# Procedure called to validate mode
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

