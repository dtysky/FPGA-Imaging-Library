vsim -voptargs=+acc -L unisims_ver work.ErosionDilationBin_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/clk
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/rst_n
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/mode
add wave -noupdate -radix binary -childformat {{{/ErosionDilationBin_TB/EDBBinPipelinex3/template[8]} -radix binary} {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[7]} -radix binary} {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[6]} -radix binary} {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[5]} -radix binary} {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[4]} -radix binary} {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[3]} -radix binary} {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[2]} -radix binary} {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[1]} -radix binary} {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[0]} -radix binary}} -subitemconfig {{/ErosionDilationBin_TB/EDBBinPipelinex3/template[8]} {-radix binary} {/ErosionDilationBin_TB/EDBBinPipelinex3/template[7]} {-radix binary} {/ErosionDilationBin_TB/EDBBinPipelinex3/template[6]} {-radix binary} {/ErosionDilationBin_TB/EDBBinPipelinex3/template[5]} {-radix binary} {/ErosionDilationBin_TB/EDBBinPipelinex3/template[4]} {-radix binary} {/ErosionDilationBin_TB/EDBBinPipelinex3/template[3]} {-radix binary} {/ErosionDilationBin_TB/EDBBinPipelinex3/template[2]} {-radix binary} {/ErosionDilationBin_TB/EDBBinPipelinex3/template[1]} {-radix binary} {/ErosionDilationBin_TB/EDBBinPipelinex3/template[0]} {-radix binary}} /ErosionDilationBin_TB/EDBBinPipelinex3/template
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/in_enable
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/in_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/out_ready
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/out_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/reg_in_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex3/con_enable
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/clk
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/rst_n
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/mode
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/template
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/in_enable
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/in_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/out_ready
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/out_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/reg_in_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx3/con_enable
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/clk
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/rst_n
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/mode
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/template
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/in_enable
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/in_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/out_ready
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/out_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/reg_in_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinPipelinex5/con_enable
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/clk
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/rst_n
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/mode
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/template
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/in_enable
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/in_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/out_ready
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/out_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/reg_in_data
add wave -noupdate -radix binary /ErosionDilationBin_TB/EDBBinReqAckx5/con_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2502287900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 322
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
WaveRestoreZoom {2502284548 ps} {2502291445 ps}
run -all