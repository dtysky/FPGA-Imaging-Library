vsim -voptargs=+acc -L unisims_ver work.Threshold_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/clk
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/rst_n
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/th_mode
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/th1
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/th2
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/in_enable
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/in_data
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/out_ready
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/out_data
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/reg_out_ready
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYPipeline/reg_out_data
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/clk
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/rst_n
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/th_mode
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/th1
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/th2
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/in_enable
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/in_data
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/out_ready
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/out_data
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/reg_out_ready
add wave -noupdate -radix unsigned  sim:/Threshold_TB/GYReqAck/reg_out_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {786643537 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {76639450 ps} {76647450 ps}
run -all