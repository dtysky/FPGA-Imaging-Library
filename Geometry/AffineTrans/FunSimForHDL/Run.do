vsim work.glbl -voptargs=+acc -L unisims_ver work.AffineTrans_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /AffineTrans_TB/clk
add wave -noupdate -radix unsigned /AffineTrans_TB/rst_n
add wave -noupdate -radix decimal /AffineTrans_TB/axu_o
add wave -noupdate -radix decimal /AffineTrans_TB/axv_o
add wave -noupdate -radix decimal /AffineTrans_TB/ayu_o
add wave -noupdate -radix decimal /AffineTrans_TB/ayv_o
add wave -noupdate -radix decimal /AffineTrans_TB/ax_o
add wave -noupdate -radix decimal /AffineTrans_TB/ay_o
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/axu
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/axv
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/ayu
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/ayv
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/ax
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/ay
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/in_enable
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/frame_in_enable
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/frame_in_data
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/frame_out_enable
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/frame_out_count_x
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/frame_out_count_y
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/out_enable
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/out_data
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/count_u
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/count_v
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/mul_x_p1
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/mul_x_p2
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/mul_y_p1
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/mul_y_p2
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/mul_x_r1
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/mul_x_r2
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/mul_y_r1
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/mul_y_r2
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/add_x_r1
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/add_y_r1
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/add_x_r2
add wave -noupdate -radix decimal /AffineTrans_TB/AT1/add_y_r2
add wave -noupdate -radix unsigned /AffineTrans_TB/AT1/con_mul_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6963855 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 163
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
WaveRestoreZoom {6961675 ps} {6965635 ps}
run -all