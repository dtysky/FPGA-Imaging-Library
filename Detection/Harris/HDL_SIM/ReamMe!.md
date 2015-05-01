Using these to simulate:  

    vsim work.glbl -voptargs=+acc -L unisims_ver work.Harris_TB
    add wave -position end  sim:/Harris_TB/Harris1/diff_th
    add wave -position end  sim:/Harris_TB/Harris1/in_data
    add wave -position end  sim:/Harris_TB/Harris1/out_data
    add wave -position end  sim:/Harris_TB/Harris1/top
    add wave -position end  sim:/Harris_TB/Harris1/left
    add wave -position end  sim:/Harris_TB/Harris1/right
    add wave -position end  sim:/Harris_TB/Harris1/bottom
    add wave -position end  sim:/Harris_TB/Harris1/now
    add wave -position end  sim:/Harris_TB/Harris1/diff_top
    add wave -position end  sim:/Harris_TB/Harris1/diff_left
    add wave -position end  sim:/Harris_TB/Harris1/diff_right
    add wave -position end  sim:/Harris_TB/Harris1/diff_bottom
    add wave -position end  sim:/Harris_TB/Harris1/en_top
    add wave -position end  sim:/Harris_TB/Harris1/en_left
    add wave -position end  sim:/Harris_TB/Harris1/en_right
    add wave -position end  sim:/Harris_TB/Harris1/en_bottom
    add wave -position end  sim:/Harris_TB/win_enable
    run -all

    vsim work.glbl -L unisims_ver work.Harris_TB
    run -all
    