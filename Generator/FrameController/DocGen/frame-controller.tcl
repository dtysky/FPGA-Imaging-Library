proc init_gui { IPINST } {
ipgui::add_param $IPINST -name "Component_Name"
#Adding Page
set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Parameters}]
set_property tooltip {Parameters} ${Page_0}
ipgui::add_param $IPINST -name "work_mode" -parent ${Page_0}
ipgui::add_param $IPINST -name "wr_mode" -parent ${Page_0}
ipgui::add_param $IPINST -name "color_width" -parent ${Page_0}
ipgui::add_param $IPINST -name "im_width" -parent ${Page_0}
ipgui::add_param $IPINST -name "im_height" -parent ${Page_0}
ipgui::add_param $IPINST -name "addr_width" -parent ${Page_0}
ipgui::add_param $IPINST -name "ram_read_latency" -parent ${Page_0}
ipgui::add_param $IPINST -name "row_init" -parent ${Page_0}
ipgui::add_static_text $IPINST -name "Par_Discriptions" -parent ${Page_0} -text {


work_mode:
unsigned.
Description: This module's working mode.

wr_mode:
unsigned.
Description: This module's WR mode.

color_width:
unsigned.
Description: Color's bit width.

im_width:
unsigned.
Description: Width of image.

im_height:
unsigned.
Description: Height of image.

addr_width:
unsigned.
Description: Address bit width of a ram for storing this image.

ram_read_latency:
unsigned.
Description: RL of RAM, in xilinx 7-series device, it is 2.

row_init:
unsigned.
Description: The first row you want to storing, used for eliminating offset.

}
#Adding Page
set Ports [ipgui::add_page $IPINST -name "Ports"]
set_property tooltip {Ports} ${Ports}
ipgui::add_static_text $IPINST -name "Discriptions" -parent ${Ports} -text {
clk:
unsigned.
Description: Clock.
Range: None

rst_n:
unsigned.
Description: Reset, active low.
Range: None

in_enable:
unsigned.
Description: Input data enable, in pipeline mode, it works as another rst_n, in req-ack mode, only it is high will in_data can be really changes.
Range: None

in_data:
unsigned.
Description: Input data, it must be synchronous with in_enable.
Range: color_width - 1 : 0

out_ready:
unsigned.
Description: Output data ready, in both two mode, it will be high while the out_data can be read.
Range: None

out_data:
unsigned.
Description: Output data, it will be synchronous with out_ready.
Range: color_width - 1 : 0

ram_addr:
unsigned.
Description: Address for ram.
Range: addr_width - 1 : 0

}
#Adding Page
set Help [ipgui::add_page $IPINST -name "Help"]
set_property tooltip {Help} ${Help}
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