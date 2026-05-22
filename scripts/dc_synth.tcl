set TOP asy_fifo_top
set STD_DB "/home/synopsys/stdcell/tcbn28hpcplusbwp12t30p140_190a/tcbn28hpcplusbwp12t30p140_180a_ccs/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn28hpcplusbwp12t30p140_180a/tcbn28hpcplusbwp12t30p140tt0p9v25c_ccs.db"

set SDC_F [file normalize ../sdc/asy_fifo.sdc]
set RPT_D [file normalize ./reports]
set OUT_D [file normalize ./outputs]
file mkdir $RPT_D $OUT_D WORK

set_app_var target_library $STD_DB
set_app_var link_library   "* $STD_DB"
set_app_var hdlin_enable_vpp true

define_design_lib WORK -path ./WORK
set_app_var search_path [list .. [file normalize ../rtl]]

analyze -format sverilog -library WORK [file normalize ../rtl/fifo_mem.sv]
analyze -format sverilog -library WORK [file normalize ../rtl/fifo_wr_ctrl.sv]
analyze -format sverilog -library WORK [file normalize ../rtl/fifo_rd_ctrl.sv]
analyze -format sverilog -library WORK [file normalize ../rtl/asy_fifo_top.sv]

elaborate $TOP -library WORK
current_design $TOP
link

source $SDC_F
check_design > $RPT_D/check_design.rpt

compile_ultra -gate_clock

report_area   -hierarchy > $RPT_D/${TOP}.area.rpt
report_timing -max -nworst 20 > $RPT_D/${TOP}.timing.rpt
report_clock  > $RPT_D/${TOP}.clock.rpt

write -format ddc -hierarchy -output $OUT_D/${TOP}.ddc
write -format verilog -hierarchy -output $OUT_D/${TOP}.syn.v

exit