# ==========================================
# Makefile for SNN Hardware Simulation
# ==========================================

# 1. 把所有长长的编译选项都打包进一个变量里
VCS_FLAGS = -full64 -fsdb -kdb -lca -sverilog -timescale=1ns/1ps -debug_access+all

# 2. 编译目标 (make comp)
comp:
	vcs $(VCS_FLAGS) -f filelist.f | tee compile.log

# 3. 仿真目标 (make sim)
sim:
	./simv | tee sim.log

# 4. 看波形目标 (make wave)
wave:
	verdi -f filelist.f -ssf tb_fifo.fsdb &

# 5. 一键大扫除 (make clean) - 极其重要，清理仿真垃圾文件
clean:
	rm -rf simv simv.daidir csrc *.log *.fsdb novas* verdiLog ucli.key