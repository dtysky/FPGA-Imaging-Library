vsim work.glbl -voptargs=+acc -L unisims_ver work.Scale_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/clk
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/rst_n
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/scale_x
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/scale_y
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/in_enable
add wave -noupdate -radix decimal /Scale_TB/SCLGrayPipeline/count_x
add wave -noupdate -radix decimal /Scale_TB/SCLGrayPipeline/count_y
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/mul_x_p
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/mul_y_p
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/mul_x_r
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/mul_y_r
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/con_mul_enable
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/frame_enable
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/frame_out_count_x
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/frame_out_count_y
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/frame_in_ready
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/frame_in_data
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/in_range_h
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/in_range_v
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/out_ready
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayPipeline/out_data
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/clk
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/rst_n
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/scale_x
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/scale_y
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/in_enable
add wave -noupdate -radix decimal /Scale_TB/SCLGrayReqAck/count_x
add wave -noupdate -radix decimal /Scale_TB/SCLGrayReqAck/count_y
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/mul_x_p
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/mul_y_p
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/mul_x_r
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/mul_y_r
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/con_mul_enable
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/frame_enable
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/frame_out_count_x
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/frame_out_count_y
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/frame_in_ready
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/frame_in_data
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/in_range_h
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/in_range_v
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/out_ready
add wave -noupdate -radix unsigned /Scale_TB/SCLGrayReqAck/out_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {52640408 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 276
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
WaveRestoreZoom {52639357 ps} {52646541 ps}
run -all