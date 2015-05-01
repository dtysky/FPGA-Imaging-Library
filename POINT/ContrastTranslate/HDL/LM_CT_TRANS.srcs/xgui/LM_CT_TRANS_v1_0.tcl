# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_static_text $IPINST -name "Port discriptions" -parent ${Page_0} -text {Port discriptions:



lm : luminance, a signed number.

ct : CT, a unsigned number, high 8bits are integers,low 8bit are decimals.

ci : Source data, one channel of a point. 

mul_r : Multiplier's output.

co : Result data.

mul_a: Multiplier's input.

mul_b: Multiplier's input.}


}


