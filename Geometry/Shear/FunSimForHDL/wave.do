onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /Shear_TB/Shear1/clk
add wave -noupdate -radix unsigned /Shear_TB/Shear1/rst_n
add wave -noupdate -radix unsigned /Shear_TB/Shear1/sh_u
add wave -noupdate -radix unsigned /Shear_TB/Shear1/sh_v
add wave -noupdate -radix unsigned /Shear_TB/Shear1/in_enable
add wave -noupdate -radix unsigned /Shear_TB/Shear1/frame_in_enable
add wave -noupdate -radix unsigned /Shear_TB/Shear1/frame_in_data
add wave -noupdate -radix unsigned /Shear_TB/Shear1/frame_out_enable
add wave -noupdate -radix unsigned /Shear_TB/Shear1/frame_out_count_x
add wave -noupdate -radix unsigned /Shear_TB/Shear1/frame_out_count_y
add wave -noupdate -radix unsigned /Shear_TB/Shear1/out_enable
add wave -noupdate -radix unsigned /Shear_TB/Shear1/out_data
add wave -noupdate -radix unsigned /Shear_TB/Shear1/reg_count_u
add wave -noupdate -radix unsigned /Shear_TB/Shear1/reg_count_v
add wave -noupdate -radix unsigned /Shear_TB/Shear1/count_u
add wave -noupdate -radix unsigned /Shear_TB/Shear1/count_v
add wave -noupdate -radix decimal /Shear_TB/Shear1/sh_uc
add wave -noupdate -radix decimal /Shear_TB/Shear1/sh_vc
add wave -noupdate -radix decimal /Shear_TB/Shear1/mul_x_p
add wave -noupdate -radix decimal /Shear_TB/Shear1/mul_y_p
add wave -noupdate -radix decimal /Shear_TB/Shear1/mul_x_r
add wave -noupdate -radix decimal /Shear_TB/Shear1/mul_y_r
add wave -noupdate -radix decimal /Shear_TB/Shear1/reg_mul_x_c
add wave -noupdate -radix decimal /Shear_TB/Shear1/reg_mul_y_c
add wave -noupdate -radix decimal /Shear_TB/Shear1/mul_x_c
add wave -noupdate -radix decimal /Shear_TB/Shear1/mul_y_c
add wave -noupdate -radix unsigned /Shear_TB/Shear1/con_mul_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24182524 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
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
WaveRestoreZoom {24179737 ps} {24185257 ps}
