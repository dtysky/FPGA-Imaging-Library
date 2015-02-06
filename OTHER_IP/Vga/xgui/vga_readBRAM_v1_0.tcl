# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set vsync_active [ipgui::add_param $IPINST -parent $Page0 -name vsync_active]
	set hsync_active [ipgui::add_param $IPINST -parent $Page0 -name hsync_active]
	set vMaxCount [ipgui::add_param $IPINST -parent $Page0 -name vMaxCount]
	set vEndSync [ipgui::add_param $IPINST -parent $Page0 -name vEndSync]
	set vStartSync [ipgui::add_param $IPINST -parent $Page0 -name vStartSync]
	set vRez [ipgui::add_param $IPINST -parent $Page0 -name vRez]
	set hMaxCount [ipgui::add_param $IPINST -parent $Page0 -name hMaxCount]
	set hEndSync [ipgui::add_param $IPINST -parent $Page0 -name hEndSync]
	set hStartSync [ipgui::add_param $IPINST -parent $Page0 -name hStartSync]
	set hRez [ipgui::add_param $IPINST -parent $Page0 -name hRez]
}

proc update_PARAM_VALUE.vsync_active { PARAM_VALUE.vsync_active } {
	# Procedure called to update vsync_active when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vsync_active { PARAM_VALUE.vsync_active } {
	# Procedure called to validate vsync_active
	return true
}

proc update_PARAM_VALUE.hsync_active { PARAM_VALUE.hsync_active } {
	# Procedure called to update hsync_active when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hsync_active { PARAM_VALUE.hsync_active } {
	# Procedure called to validate hsync_active
	return true
}

proc update_PARAM_VALUE.vMaxCount { PARAM_VALUE.vMaxCount } {
	# Procedure called to update vMaxCount when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vMaxCount { PARAM_VALUE.vMaxCount } {
	# Procedure called to validate vMaxCount
	return true
}

proc update_PARAM_VALUE.vEndSync { PARAM_VALUE.vEndSync } {
	# Procedure called to update vEndSync when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vEndSync { PARAM_VALUE.vEndSync } {
	# Procedure called to validate vEndSync
	return true
}

proc update_PARAM_VALUE.vStartSync { PARAM_VALUE.vStartSync } {
	# Procedure called to update vStartSync when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vStartSync { PARAM_VALUE.vStartSync } {
	# Procedure called to validate vStartSync
	return true
}

proc update_PARAM_VALUE.vRez { PARAM_VALUE.vRez } {
	# Procedure called to update vRez when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.vRez { PARAM_VALUE.vRez } {
	# Procedure called to validate vRez
	return true
}

proc update_PARAM_VALUE.hMaxCount { PARAM_VALUE.hMaxCount } {
	# Procedure called to update hMaxCount when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hMaxCount { PARAM_VALUE.hMaxCount } {
	# Procedure called to validate hMaxCount
	return true
}

proc update_PARAM_VALUE.hEndSync { PARAM_VALUE.hEndSync } {
	# Procedure called to update hEndSync when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hEndSync { PARAM_VALUE.hEndSync } {
	# Procedure called to validate hEndSync
	return true
}

proc update_PARAM_VALUE.hStartSync { PARAM_VALUE.hStartSync } {
	# Procedure called to update hStartSync when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hStartSync { PARAM_VALUE.hStartSync } {
	# Procedure called to validate hStartSync
	return true
}

proc update_PARAM_VALUE.hRez { PARAM_VALUE.hRez } {
	# Procedure called to update hRez when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.hRez { PARAM_VALUE.hRez } {
	# Procedure called to validate hRez
	return true
}


proc update_MODELPARAM_VALUE.hRez { MODELPARAM_VALUE.hRez PARAM_VALUE.hRez } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hRez}] ${MODELPARAM_VALUE.hRez}
}

proc update_MODELPARAM_VALUE.hStartSync { MODELPARAM_VALUE.hStartSync PARAM_VALUE.hStartSync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hStartSync}] ${MODELPARAM_VALUE.hStartSync}
}

proc update_MODELPARAM_VALUE.hEndSync { MODELPARAM_VALUE.hEndSync PARAM_VALUE.hEndSync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hEndSync}] ${MODELPARAM_VALUE.hEndSync}
}

proc update_MODELPARAM_VALUE.hMaxCount { MODELPARAM_VALUE.hMaxCount PARAM_VALUE.hMaxCount } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hMaxCount}] ${MODELPARAM_VALUE.hMaxCount}
}

proc update_MODELPARAM_VALUE.vRez { MODELPARAM_VALUE.vRez PARAM_VALUE.vRez } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vRez}] ${MODELPARAM_VALUE.vRez}
}

proc update_MODELPARAM_VALUE.vStartSync { MODELPARAM_VALUE.vStartSync PARAM_VALUE.vStartSync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vStartSync}] ${MODELPARAM_VALUE.vStartSync}
}

proc update_MODELPARAM_VALUE.vEndSync { MODELPARAM_VALUE.vEndSync PARAM_VALUE.vEndSync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vEndSync}] ${MODELPARAM_VALUE.vEndSync}
}

proc update_MODELPARAM_VALUE.vMaxCount { MODELPARAM_VALUE.vMaxCount PARAM_VALUE.vMaxCount } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vMaxCount}] ${MODELPARAM_VALUE.vMaxCount}
}

proc update_MODELPARAM_VALUE.hsync_active { MODELPARAM_VALUE.hsync_active PARAM_VALUE.hsync_active } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.hsync_active}] ${MODELPARAM_VALUE.hsync_active}
}

proc update_MODELPARAM_VALUE.vsync_active { MODELPARAM_VALUE.vsync_active PARAM_VALUE.vsync_active } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.vsync_active}] ${MODELPARAM_VALUE.vsync_active}
}

