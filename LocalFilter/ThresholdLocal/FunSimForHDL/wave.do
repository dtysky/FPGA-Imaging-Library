onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/clk
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/rst_n
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/in_enable
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/in_data
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/ref_enable
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/ref_data
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/out_ready
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/out_data
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/con_out
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/reg_out_ready
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayPipeline/reg_out_data
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/clk
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/rst_n
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/in_enable
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/in_data
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/ref_enable
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/ref_data
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/out_ready
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/out_data
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/con_out
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/reg_out_ready
add wave -noupdate -radix unsigned /ThresholdLocal_TB/THLGrayReqAck/reg_out_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1642 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 297
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
WaveRestoreZoom {0 ps} {7057 ps}
