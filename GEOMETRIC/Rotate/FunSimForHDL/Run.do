vsim work.glbl -voptargs=+acc -L unisims_ver work.Scale_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
quietly virtual signal -install /Scale_TB/Scale1 {/Scale_TB/Scale1/scale_x[31:16]} xsacle_r
quietly virtual signal -install /Scale_TB/Scale1 {/Scale_TB/Scale1/scale_x[15:0]} xsacle_d
quietly virtual signal -install /Scale_TB/Scale1 {/Scale_TB/Scale1/scale_y[31:16]} ysacle_r
quietly virtual signal -install /Scale_TB/Scale1 {/Scale_TB/Scale1/scale_y[15:0]} ysacle_d
add wave -noupdate -radix unsigned /Scale_TB/Scale1/clk
add wave -noupdate -radix unsigned /Scale_TB/Scale1/rst_n
add wave -noupdate -radix unsigned /Scale_TB/Scale1/xsacle_r
add wave -noupdate -radix unsigned /Scale_TB/Scale1/xsacle_d
add wave -noupdate -radix unsigned /Scale_TB/Scale1/ysacle_r
add wave -noupdate -radix unsigned /Scale_TB/Scale1/ysacle_d
add wave -noupdate -radix unsigned /Scale_TB/Scale1/in_enable
add wave -noupdate -radix unsigned /Scale_TB/Scale1/frame_in_enable
add wave -noupdate -radix unsigned /Scale_TB/Scale1/frame_in_data
add wave -noupdate -radix unsigned /Scale_TB/Scale1/frame_out_enable
add wave -noupdate -radix unsigned /Scale_TB/Scale1/frame_out_count_x
add wave -noupdate -radix unsigned /Scale_TB/Scale1/frame_out_count_y
add wave -noupdate -radix unsigned /Scale_TB/Scale1/out_enable
add wave -noupdate -radix unsigned /Scale_TB/Scale1/out_data
add wave -noupdate -radix unsigned /Scale_TB/Scale1/reg_count_x
add wave -noupdate -radix unsigned /Scale_TB/Scale1/reg_count_y
add wave -noupdate -radix unsigned /Scale_TB/Scale1/count_x
add wave -noupdate -radix unsigned /Scale_TB/Scale1/count_y
add wave -noupdate -radix unsigned /Scale_TB/Scale1/mul_x_p
add wave -noupdate -radix unsigned /Scale_TB/Scale1/mul_y_p
add wave -noupdate -radix unsigned /Scale_TB/Scale1/con_mul_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {96012181 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 268
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
WaveRestoreZoom {96008687 ps} {96015903 ps}
run -all