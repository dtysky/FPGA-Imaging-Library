onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/clk
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/rst_n
add wave -noupdate -radix decimal /Shear_TB/SHRGrayPipeline/sh_u
add wave -noupdate -radix decimal /Shear_TB/SHRGrayPipeline/sh_v
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/in_enable
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/count_u
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/count_v
add wave -noupdate -radix decimal /Shear_TB/SHRGrayPipeline/mul_x_p
add wave -noupdate -radix decimal /Shear_TB/SHRGrayPipeline/mul_y_p
add wave -noupdate -radix decimal /Shear_TB/SHRGrayPipeline/mul_x_r
add wave -noupdate -radix decimal /Shear_TB/SHRGrayPipeline/mul_y_r
add wave -noupdate -radix decimal /Shear_TB/SHRGrayPipeline/reg_frame_out_count_x
add wave -noupdate -radix decimal /Shear_TB/SHRGrayPipeline/reg_frame_out_count_y
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/frame_out_count_x
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/frame_out_count_y
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/frame_enable
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/frame_in_ready
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/frame_in_data
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/in_range_t
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/in_range_b
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/in_range_l
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/in_range_r
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/out_ready
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayPipeline/out_data
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/clk
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/rst_n
add wave -noupdate -radix decimal /Shear_TB/SHRGrayReqAck/sh_u
add wave -noupdate -radix decimal /Shear_TB/SHRGrayReqAck/sh_v
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/in_enable
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/count_u
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/count_v
add wave -noupdate -radix decimal /Shear_TB/SHRGrayReqAck/mul_x_p
add wave -noupdate -radix decimal /Shear_TB/SHRGrayReqAck/mul_y_p
add wave -noupdate -radix decimal /Shear_TB/SHRGrayReqAck/mul_x_r
add wave -noupdate -radix decimal /Shear_TB/SHRGrayReqAck/mul_y_r
add wave -noupdate -radix decimal /Shear_TB/SHRGrayReqAck/reg_frame_out_count_x
add wave -noupdate -radix decimal /Shear_TB/SHRGrayReqAck/reg_frame_out_count_y
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/frame_out_count_x
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/frame_out_count_y
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/frame_enable
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/frame_in_ready
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/frame_in_data
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/in_range_t
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/in_range_b
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/in_range_l
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/in_range_r
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/out_ready
add wave -noupdate -radix unsigned /Shear_TB/SHRGrayReqAck/out_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {104924654 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 307
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
WaveRestoreZoom {104923358 ps} {104930170 ps}
