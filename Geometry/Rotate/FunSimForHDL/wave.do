onerror {resume}
quietly virtual signal -install /Rotate_TB/Rotate1 { /Rotate_TB/Rotate1/mul_x_p1[34:16]} mul_x_p01
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/clk
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/rst_n
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/angle
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/in_enable
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/frame_in_enable
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/frame_in_data
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/frame_out_enable
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/frame_out_count_x
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/frame_out_count_y
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/out_enable
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/out_data
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/reg_count_u
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/reg_count_v
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/count_u
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/count_v
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/sina
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/cosa
add wave -noupdate /Rotate_TB/Rotate1/mul_x_p01
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/mul_x_p2
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/mul_y_p1
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/mul_y_p2
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/reg_frame_count_x
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/reg_frame_count_y
add wave -noupdate -radix unsigned /Rotate_TB/Rotate1/con_mul_enable
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/mul_x_b1
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/mul_x_b2
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/mul_y_b1
add wave -noupdate -radix decimal /Rotate_TB/Rotate1/mul_y_b2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32226000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 296
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
WaveRestoreZoom {32224244 ps} {32227757 ps}
