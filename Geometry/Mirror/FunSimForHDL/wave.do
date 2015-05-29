onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBPipeline/clk
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBPipeline/rst_n
add wave -noupdate -radix binary /Mirror_TB/MRRGBPipeline/mode
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBPipeline/in_enable
add wave -noupdate -radix hexadecimal /Mirror_TB/MRRGBPipeline/in_data
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBPipeline/in_count_x
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBPipeline/in_count_y
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBPipeline/out_ready
add wave -noupdate -radix hexadecimal /Mirror_TB/MRRGBPipeline/out_data
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBPipeline/out_count_x
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBPipeline/out_count_y
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBReqAck/clk
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBReqAck/rst_n
add wave -noupdate -radix binary /Mirror_TB/MRRGBReqAck/mode
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBReqAck/in_enable
add wave -noupdate -radix hexadecimal /Mirror_TB/MRRGBReqAck/in_data
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBReqAck/in_count_x
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBReqAck/in_count_y
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBReqAck/out_ready
add wave -noupdate -radix hexadecimal /Mirror_TB/MRRGBReqAck/out_data
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBReqAck/out_count_x
add wave -noupdate -radix unsigned /Mirror_TB/MRRGBReqAck/out_count_y
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayPipeline/clk
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayPipeline/rst_n
add wave -noupdate -radix binary /Mirror_TB/MRGrayPipeline/mode
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayPipeline/in_enable
add wave -noupdate -radix hexadecimal /Mirror_TB/MRGrayPipeline/in_data
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayPipeline/in_count_x
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayPipeline/in_count_y
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayPipeline/out_ready
add wave -noupdate -radix hexadecimal /Mirror_TB/MRGrayPipeline/out_data
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayPipeline/out_count_x
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayPipeline/out_count_y
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayReqAck/clk
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayReqAck/rst_n
add wave -noupdate -radix binary /Mirror_TB/MRGrayReqAck/mode
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayReqAck/in_enable
add wave -noupdate -radix hexadecimal /Mirror_TB/MRGrayReqAck/in_data
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayReqAck/in_count_x
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayReqAck/in_count_y
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayReqAck/out_ready
add wave -noupdate -radix hexadecimal /Mirror_TB/MRGrayReqAck/out_data
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayReqAck/out_count_x
add wave -noupdate -radix unsigned /Mirror_TB/MRGrayReqAck/out_count_y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1052 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 288
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
WaveRestoreZoom {0 ps} {7115 ps}
