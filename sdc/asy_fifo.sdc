# ========== 时钟 ==========
create_clock -name w_clk -period 10.0 [get_ports w_clk]
create_clock -name r_clk -period 10.0 [get_ports r_clk]

set_clock_groups -asynchronous \
    -group [get_clocks w_clk] \
    -group [get_clocks r_clk]

# ========== 复位 ==========
set_false_path -from [get_ports w_rst]
set_false_path -from [get_ports r_rst]

# ========== IO（示例值，可按课程修改）==========
set_input_delay  -clock w_clk -max 2.0 \
  [remove_from_collection [all_inputs] [list w_clk r_clk w_rst r_rst]]
set_input_delay  -clock r_clk -max 2.0 [get_ports {r_en r_rst}]
set_output_delay -clock w_clk -max 2.0 [get_ports FULL]
set_output_delay -clock r_clk -max 2.0 [get_ports {EMPTY r_data}]

# ========== 跨时钟域 ==========
set_false_path -from [get_clocks w_clk] -to [get_clocks r_clk]
set_false_path -from [get_clocks r_clk] -to [get_clocks w_clk]