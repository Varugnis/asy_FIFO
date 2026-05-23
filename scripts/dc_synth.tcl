# =============================================================================
#  Design Compiler 逻辑综合脚本 — asy_fifo_top
#  用法（在 scripts 目录下）:
#    dc_shell-t -f dc_synth.tcl | tee synth.log
# =============================================================================

# -----------------------------------------------------------------------------
# 1. 基本变量：顶层设计名、工艺库、路径
# -----------------------------------------------------------------------------

# 顶层模块名，必须与 RTL 里 module 名一致
set TOP asy_fifo_top

# 标准单元库 (.db)。优先读环境变量 STD_DB，否则用下面默认路径
# 换服务器时可在命令行:  setenv STD_DB /你的路径/xxx.db
if {[info exists env(STD_DB)]} {
    set STD_DB $env(STD_DB)
} else {
    set STD_DB "/home/synopsys/stdcell/tcbn28hpcplusbwp12t30p140_190a/tcbn28hpcplusbwp12t30p140_180a_ccs/TSMCHOME/digital/Front_End/timing_power_noise/CCS/tcbn28hpcplusbwp12t30p140_180a/tcbn28hpcplusbwp12t30p140tt0p9v25c_ccs.db"
}

# SDC 约束文件、报告目录、输出网表目录（相对 scripts 目录）
set SDC_F [file normalize ../sdc/asy_fifo.sdc]
set RPT_D [file normalize ./reports]
set OUT_D [file normalize ./outputs]

# 若目录不存在则创建（reports / outputs / 临时库 WORK）
file mkdir $RPT_D $OUT_D WORK

# -----------------------------------------------------------------------------
# 2. 库与综合环境
# -----------------------------------------------------------------------------

# target_library: 映射时选用的目标工艺库
set_app_var target_library $STD_DB

# link_library: 链接设计时搜索的库，"*" 表示当前设计自身
set_app_var link_library "* $STD_DB"

# 允许读入 SystemVerilog（function、logic 等）
set_app_var hdlin_enable_vpp true

# 工作库，综合中间结果放在 ./WORK
define_design_lib WORK -path ./WORK

# RTL 搜索路径
set_app_var search_path [list .. [file normalize ../rtl]]

# -----------------------------------------------------------------------------
# 3. 读入 RTL 并展开层次
# -----------------------------------------------------------------------------

analyze -format sverilog -library WORK [file normalize ../rtl/fifo_mem.sv]
analyze -format sverilog -library WORK [file normalize ../rtl/fifo_wr_ctrl.sv]
analyze -format sverilog -library WORK [file normalize ../rtl/fifo_rd_ctrl.sv]
analyze -format sverilog -library WORK [file normalize ../rtl/asy_fifo_top.sv]

# elaborate: 按 TOP 名建立设计层次
elaborate $TOP -library WORK
current_design $TOP
link

# 必须在 elaborate/link 之后执行
# DC 2016: 用 -library 指定 corner，不要写 [current_design]（会报 CMD-012）
set LIB_NAME tcbn28hpcplusbwp12t30p140tt0p9v25c_ccs
set_operating_conditions tt0p9v25c -library $LIB_NAME

# 线负载模型：综合阶段估算连线延时
set_wire_load_mode top

# -----------------------------------------------------------------------------
# 4. 设计规则约束（DRC，防止单元过大/过慢）
# -----------------------------------------------------------------------------

# 最大转换时间 (ns)，信号跳变不能太慢
set_max_transition 0.5 [current_design]

# 最大扇出，一个输出不能驱动过多输入
set_max_fanout 32 [current_design]

# -----------------------------------------------------------------------------
# 5. 加载 SDC 时序约束（在 compile 之前）
# -----------------------------------------------------------------------------

source $SDC_F

# 综合前检查：未连接端口、多驱动等
check_design > $RPT_D/check_design.pre.rpt

# -----------------------------------------------------------------------------
# 6. 逻辑综合
# -----------------------------------------------------------------------------

# compile_ultra: 较高质量的综合
# -gate_clock: 对 RAM 使能等自动插时钟门控以降低功耗
compile_ultra -gate_clock

# -----------------------------------------------------------------------------
# 7. 综合后检查与报告
# -----------------------------------------------------------------------------

check_design > $RPT_D/check_design.post.rpt
check_timing   > $RPT_D/check_timing.rpt

# 所有约束违例汇总（max/min）
report_constraint -all_violators > $RPT_D/${TOP}.constraint.rpt

# 建立时间 (setup) 最坏路径
report_timing -delay max -max_paths 20 > $RPT_D/${TOP}.timing_setup.rpt

# 保持时间 (hold) 最坏路径（初学者也建议看一眼）
report_timing -delay min -max_paths 20 > $RPT_D/${TOP}.timing_hold.rpt

# 面积（层次）
report_area -hierarchy > $RPT_D/${TOP}.area.rpt

# 时钟定义与关系
report_clock > $RPT_D/${TOP}.clock.rpt

# QoR 总览
report_qor > $RPT_D/${TOP}.qor.rpt

# 兼容旧文件名：保留一份 timing.rpt 指向 setup
report_timing -delay max -max_paths 20 > $RPT_D/${TOP}.timing.rpt

# -----------------------------------------------------------------------------
# 8. 输出文件
# -----------------------------------------------------------------------------

# DDC: DC 数据库，供后续优化/导出
write -format ddc -hierarchy -output $OUT_D/${TOP}.ddc

# 门级 Verilog 网表
write -format verilog -hierarchy -output $OUT_D/${TOP}.syn.v

# SDF 延时文件，供门级仿真 back-annotation（可选）
write_sdf -version 1.0 $OUT_D/${TOP}.sdf

puts "========================================"
puts " Synthesis finished: $TOP"
puts " Reports : $RPT_D"
puts " Outputs : $OUT_D"
puts "========================================"

exit
