# ==========================================
# Makefile — asy_FIFO 仿真 + 综合
# ==========================================

VCS_FLAGS = -full64 -fsdb -kdb -lca -sverilog -timescale=1ns/1ps -debug_access+all

# ---------- 仿真 ----------
comp:
	vcs $(VCS_FLAGS) -f filelist.f | tee compile.log

sim:
	./simv | tee sim.log

wave:
	verdi -f filelist.f -ssf tb_fifo.fsdb &

# ---------- 综合（在 scripts 目录执行 dc_shell）----------
syn:
	cd scripts && dc_shell-t -f dc_synth.tcl | tee synth.log

# ---------- 清理 ----------
# 只清仿真产物
clean:
	rm -rf simv simv.daidir csrc compile.log sim.log
	rm -rf *.fsdb novas* verdiLog ucli.key DVEfiles

# 只清综合产物（报告/网表/日志/临时库）
clean_syn:
	rm -rf scripts/WORK scripts/synth.log
	rm -rf syn/WORK syn/alib-* syn/reports syn/outputs
	mkdir -p syn/reports syn/outputs

# 仿真 + 综合一起清
clean_all: clean clean_syn

.PHONY: comp sim wave syn clean clean_syn clean_all
