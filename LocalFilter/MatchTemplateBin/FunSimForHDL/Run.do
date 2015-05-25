vsim -voptargs=+acc -L unisims_ver work.MatchTemplateBin_TB
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/clk
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/rst_n
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/template
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/in_enable
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/in_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/out_ready
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/out_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/reg_out_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex3/reg_out_ready
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/clk
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/rst_n
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/template
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/in_enable
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/in_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/out_ready
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/out_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/reg_out_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx3/reg_out_ready
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/clk
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/rst_n
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/template
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/in_enable
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/in_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/out_ready
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/out_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/reg_out_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinPipelinex5/reg_out_ready
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/clk
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/rst_n
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/template
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/in_enable
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/in_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/out_ready
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/out_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/reg_out_data
add wave -noupdate -radix binary /MatchTemplateBin_TB/MTBBinReqAckx5/reg_out_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {404500 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 333
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
WaveRestoreZoom {401087 ps} {407913 ps}
run -all