# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
   #Adding Page
  set Ports [ipgui::add_page $IPINST -name "Ports"]
  set_property tooltip {Ports} ${Ports}
  ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {

rgb24:

unsigned.

Description: 24bits-RGB data.

Range : 23 : 0



vga:

unsigned.

Description: VGA data.

Range: 15 : 0}

  #Adding Page
  set Help [ipgui::add_page $IPINST -name "Help"]
  set_property tooltip {Help} ${Help}
  ipgui::add_static_text $IPINST -name "Copyright" -parent ${Help} -text {Homepage for this project:

http://fil.dtysky.moe



Sources for this project:

https://github.com/dtysky/FPGA-Imaging-Library



My e-mail:

dtysky@outlook.com



My blog:

http://dtysky.moe



Copyright  2015, Tianyu Dai(dtysky). All Rights Reserved.

This project is free software and released under the GNU Lesser General Public License (LGPL).}


}


}


