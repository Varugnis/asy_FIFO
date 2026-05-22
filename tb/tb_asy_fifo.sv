`timescale 1ns / 1ps

module tb_asy_fifo();

    // 参数定义
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 3; // 深度 8

    // 信号声明
    reg  w_clk, r_clk;
    reg  w_rst, r_rst;
    reg  w_en, r_en;
    reg  [DATA_WIDTH-1:0] w_data;
    
    wire FULL, EMPTY;
    wire [DATA_WIDTH-1:0] r_data;

    // 例化顶层模块
    asy_fifo_top #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) u_fifo_top (
        .w_clk  (w_clk),
        .r_clk  (r_clk),
        .w_data (w_data),
        .r_en   (r_en),
        .w_en   (w_en),
        .r_rst  (r_rst),
        .w_rst  (w_rst),
        .FULL   (FULL),
        .EMPTY  (EMPTY),
        .r_data (r_data)
    );

    //=============================================
    // 1. 时钟生成 (模拟异步：快写慢读)
    //=============================================
    initial begin
        w_clk = 0;
        forever #5 w_clk = ~w_clk;   // 写时钟 100MHz (周期 10ns)
    end

    initial begin
        r_clk = 0;
        forever #13 r_clk = ~r_clk;  // 读时钟约 38MHz (周期 26ns，故意错开)
    end

    //=============================================
    // 2. 激励施加
    //=============================================
    initial begin
        // 初始化信号
        w_rst = 0; r_rst = 0;
        w_en = 0;  r_en = 0;
        w_data = 0;

        // 系统复位释放 (异步复位，给足时间)
        #30; 
        w_rst = 1; r_rst = 1;
        #30;

        // --- 场景 1：疯狂写入，直到写满 ---
        @(negedge w_clk); // 对齐时钟下降沿给激励，防止建立时间违例
        $display("--- Start Writing ---");
        while (!FULL) begin
            w_en = 1;
            w_data = w_data + 1;
            @(negedge w_clk);
        end
        w_en = 0; // 写满后停止
        $display("--- FIFO is FULL ---");
        #50;

        // --- 场景 2：疯狂读取，直到读空 ---
        @(negedge r_clk);
        $display("--- Start Reading ---");
        while (!EMPTY) begin
            r_en = 1;
            @(negedge r_clk);
        end
        r_en = 0; // 读空后停止
        $display("--- FIFO is EMPTY ---");
        #50;

        // --- 场景 3：同时读写测试 ---
        $display("--- Concurrent Read/Write ---");
        w_en = 1; r_en = 1;
        repeat(20) begin
            w_data = $random; // 塞入随机数据
            @(negedge w_clk);
        end
        w_en = 0; r_en = 0;

        #100;
        $display("--- Simulation Finished ---");
        $finish;
    end

    //=============================================
    // 3. VCS + Verdi 波形 Dump 专属代码
    //=============================================
    initial begin
        $fsdbDumpfile("tb_fifo.fsdb");      // 指定输出波形的名字
        $fsdbDumpvars(0, tb_asy_fifo);      // 抓取本 module 下的所有变量
        $fsdbDumpMDA();                     // 极其关键：抓取多维数组(即 RAM 内部的存储矩阵)
    end

endmodule