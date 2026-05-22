// ==========================================
// filelist.f for LIF Neuron Simulation
// ==========================================

// --- Verilog Source Files ---
//RTL 源码
./rtl/fifo_mem.sv
./rtl/fifo_rd_ctrl.sv
./rtl/fifo_wr_ctrl.sv
./rtl/asy_fifo_top.sv

// 测试文件
./tb/tb_asy_fifo.sv


// --- VCS Compile Options ---
-sverilog                // 开启 SystemVerilog 支持
-full64                  // 64位模式
-timescale=1ns/1ps       // 设置全局时间精度
-debug_access+all        // 开启最高级别的调试权限 (生成 fsdb 必须)
-kdb                     // 生成 Verdi 所需的 KDB 数据库 (极其重要，可以在Verdi里看代码和跨模块追线)
-lca                     // 开启 Synopsys 限制级特性 (配合 kdb 使用)