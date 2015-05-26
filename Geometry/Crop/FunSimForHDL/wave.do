onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/clk
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/rst_n
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/top
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/bottom
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/left
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/right
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/in_count_x
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/in_count_y
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/in_enable
add wave -noupdate -radix hexadecimal /Crop_TB/CPRGBPipeline/in_data
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/out_ready
add wave -noupdate -radix hexadecimal /Crop_TB/CPRGBPipeline/out_data
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/out_count_x
add wave -noupdate -radix unsigned /Crop_TB/CPRGBPipeline/out_count_y
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/clk
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/rst_n
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/top
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/bottom
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/left
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/right
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/in_count_x
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/in_count_y
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/in_enable
add wave -noupdate -radix hexadecimal /Crop_TB/CPRGBReqAck/in_data
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/out_ready
add wave -noupdate -radix hexadecimal /Crop_TB/CPRGBReqAck/out_data
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/out_count_x
add wave -noupdate -radix unsigned /Crop_TB/CPRGBReqAck/out_count_y
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/clk
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/rst_n
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/top
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/bottom
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/left
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/right
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/in_count_x
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/in_count_y
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/in_enable
add wave -noupdate -radix hexadecimal /Crop_TB/CPGrayPipeline/in_data
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/out_ready
add wave -noupdate -radix hexadecimal /Crop_TB/CPGrayPipeline/out_data
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/out_count_x
add wave -noupdate -radix unsigned /Crop_TB/CPGrayPipeline/out_count_y
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/clk
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/rst_n
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/top
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/bottom
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/left
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/right
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/in_count_x
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/in_count_y
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/in_enable
add wave -noupdate -radix hexadecimal /Crop_TB/CPGrayReqAck/in_data
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/out_ready
add wave -noupdate -radix hexadecimal /Crop_TB/CPGrayReqAck/out_data
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/out_count_x
add wave -noupdate -radix unsigned /Crop_TB/CPGrayReqAck/out_count_y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {202898 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 240
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
WaveRestoreZoom {201144 ps} {204856 ps}
