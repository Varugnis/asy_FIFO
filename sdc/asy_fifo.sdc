# =============================================================================
#  SDC 时序约束 — asy_fifo_top（异步 FIFO）
#  在 Design Compiler / PrimeTime 中 source 本文件
# =============================================================================

# -----------------------------------------------------------------------------
# 1. 时钟定义
# -----------------------------------------------------------------------------

# 写时钟：周期 10 ns => 目标频率 100 MHz（与 TB 中 w_clk 一致）
set WR_PERIOD 10.0
create_clock -name w_clk -period $WR_PERIOD [get_ports w_clk]

# 读时钟：周期 25 ns => 40 MHz（与 TB 中 r_clk 约 26ns 接近，略保守）
set RD_PERIOD 25.0
create_clock -name r_clk -period $RD_PERIOD [get_ports r_clk]

# 时钟不确定性：预留抖动 + 偏斜，使综合结果更保守、更接近芯片
set WR_UNCERT 0.20
set RD_UNCERT 0.20
set_clock_uncertainty -setup $WR_UNCERT [get_clocks w_clk]
set_clock_uncertainty -setup $RD_UNCERT [get_clocks r_clk]
set_clock_uncertainty -hold  0.10 [get_clocks w_clk]
set_clock_uncertainty -hold  0.10 [get_clocks r_clk]

# 声明两时钟异步：工具不把 w_clk 与 r_clk 当作同步关系来修 setup
set_clock_groups -asynchronous \
    -group [get_clocks w_clk] \
    -group [get_clocks r_clk]

# -----------------------------------------------------------------------------
# 2. 跨时钟域 (CDC) — 格雷码同步链
# -----------------------------------------------------------------------------

# 进入对方时钟域「第一级同步寄存器」的路径，限制最大延时
# 经验值：略小于源时钟周期，保证同步器在 1 个源时钟周期内采样稳定
set CDC_MAX_DELAY 8.0

# 写域 w_addr_grey -> 读域 READ1 第一级同步 D 端
set_max_delay $CDC_MAX_DELAY -from [get_clocks w_clk] \
    -to [get_pins -hierarchical *w_addr_grey_d1_reg*/D] -datapath_only

# 读域 r_addr_grey -> 写域 WRITE1 第一级同步 D 端
set_max_delay $CDC_MAX_DELAY -from [get_clocks r_clk] \
    -to [get_pins -hierarchical *r_addr_grey_d1_reg*/D] -datapath_only

# 其余跨时钟路径（双口 RAM 数据、异步握手等）不做常规 setup 分析
# 功能正确性由格雷指针 + 仿真验证
set_false_path -from [get_clocks w_clk] -to [get_clocks r_clk]
set_false_path -from [get_clocks r_clk] -to [get_clocks w_clk]

# -----------------------------------------------------------------------------
# 3. 复位
# -----------------------------------------------------------------------------

# 异步复位有效沿：不做 setup/hold 分析（复位拉低时立即生效）
set_false_path -from [get_ports w_rst]
set_false_path -from [get_ports r_rst]

# -----------------------------------------------------------------------------
# 4. 输入延时 — 写时钟域端口
# -----------------------------------------------------------------------------

# 假设：片外逻辑在 w_clk 上升沿之前，数据已稳定约 2 ns（max）
#       并保持至少 0.5 ns（min，用于 hold 检查）
set W_IN_MAX 2.0
set W_IN_MIN 0.5

set_input_delay -clock w_clk -max $W_IN_MAX \
    [get_ports {w_data w_en}]
set_input_delay -clock w_clk -min $W_IN_MIN \
    [get_ports {w_data w_en}]

# -----------------------------------------------------------------------------
# 5. 输入延时 — 读时钟域端口
# -----------------------------------------------------------------------------

set R_IN_MAX 2.0
set R_IN_MIN 0.5

set_input_delay -clock r_clk -max $R_IN_MAX [get_ports r_en]
set_input_delay -clock r_clk -min $R_IN_MIN [get_ports r_en]

# -----------------------------------------------------------------------------
# 6. 输出延时 — 写时钟域端口
# -----------------------------------------------------------------------------

# 假设：片外在上游时钟沿后 2 ns 内采样 FULL（max）
set W_OUT_MAX 2.0
set W_OUT_MIN 0.5

set_output_delay -clock w_clk -max $W_OUT_MAX [get_ports FULL]
set_output_delay -clock w_clk -min $W_OUT_MIN [get_ports FULL]

# -----------------------------------------------------------------------------
# 7. 输出延时 — 读时钟域端口
# -----------------------------------------------------------------------------

set R_OUT_MAX 2.0
set R_OUT_MIN 0.5

set_output_delay -clock r_clk -max $R_OUT_MAX [get_ports {EMPTY r_data}]
set_output_delay -clock r_clk -min $R_OUT_MIN [get_ports {EMPTY r_data}]

# -----------------------------------------------------------------------------
# 8. 端口驱动与负载（可选，使模型更完整）
# -----------------------------------------------------------------------------

# 输入端口等效驱动强度（单位与库一致，常用 0 表示直接由时钟域寄存器驱动）
set_drive 0 [get_ports {w_data w_en r_en}]

# 输出端口等效负载电容 (pF)，可按接口手册修改
set_load 0.05 [get_ports {FULL EMPTY r_data}]
