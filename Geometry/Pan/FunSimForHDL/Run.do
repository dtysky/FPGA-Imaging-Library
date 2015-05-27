vsim -voptargs=+acc -L unisims_ver work.Pan_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/clk
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/rst_n
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/offset_x
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/offset_y
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/in_enable
add wave -noupdate -radix hexadecimal /Pan_TB/PanRGBPipeline/in_data
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/in_count_x
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/in_count_y
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/out_ready
add wave -noupdate -radix hexadecimal /Pan_TB/PanRGBPipeline/out_data
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/out_count_x
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/out_count_y
add wave -noupdate -radix unsigned /Pan_TB/PanRGBPipeline/con_enable
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/clk
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/rst_n
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/offset_x
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/offset_y
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/in_enable
add wave -noupdate -radix hexadecimal /Pan_TB/PanRGBReqAck/in_data
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/in_count_x
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/in_count_y
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/out_ready
add wave -noupdate -radix hexadecimal /Pan_TB/PanRGBReqAck/out_data
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/out_count_x
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/out_count_y
add wave -noupdate -radix unsigned /Pan_TB/PanRGBReqAck/con_enable
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/clk
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/rst_n
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/offset_x
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/offset_y
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/in_enable
add wave -noupdate -radix hexadecimal /Pan_TB/PanGrayPipeline/in_data
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/in_count_x
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/in_count_y
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/out_ready
add wave -noupdate -radix hexadecimal /Pan_TB/PanGrayPipeline/out_data
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/out_count_x
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/out_count_y
add wave -noupdate -radix unsigned /Pan_TB/PanGrayPipeline/con_enable
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/clk
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/rst_n
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/offset_x
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/offset_y
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/in_enable
add wave -noupdate -radix hexadecimal /Pan_TB/PanGrayReqAck/in_data
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/in_count_x
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/in_count_y
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/out_ready
add wave -noupdate -radix hexadecimal /Pan_TB/PanGrayReqAck/out_data
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/out_count_x
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/out_count_y
add wave -noupdate -radix unsigned /Pan_TB/PanGrayReqAck/con_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {757 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {7378 ps}
run -all