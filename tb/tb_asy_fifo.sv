`timescale 1ns / 1ps

module tb_asy_fifo;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 3;
    localparam DEPTH = 1 << ADDR_WIDTH;
    localparam SYNC_CYCLES = 5;

    reg  w_clk, r_clk;
    reg  w_rst, r_rst;
    reg  w_en, r_en;
    reg  [DATA_WIDTH-1:0] w_data;

    wire FULL, EMPTY;
    wire [DATA_WIDTH-1:0] r_data;

    int exp_q[$];
    int err_cnt;
    int test_id;
    reg [DATA_WIDTH-1:0] expected_byte;

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

    initial begin
        w_clk = 0;
        forever #5 w_clk = ~w_clk;
    end

    initial begin
        r_clk = 0;
        forever #13 r_clk = ~r_clk;
    end

    // 读成功时比对（在 r_clk 域采样 r_data）
    always @(posedge r_clk) begin
        if (r_rst && r_en && !EMPTY) begin
            #1step;
            if (exp_q.size() == 0) begin
                $error("[%0t] TEST%0d: read valid but scoreboard empty", $time, test_id);
                err_cnt++;
            end else begin
                expected_byte = exp_q.pop_front();
                if (r_data !== expected_byte) begin
                    $error("[%0t] TEST%0d: data mismatch, expect=0x%0h got=0x%0h",
                           $time, test_id, expected_byte, r_data);
                    err_cnt++;
                end
            end
        end
    end

    // 格雷指针跨域同步需要若干拍，判 FULL/EMPTY 前等待
    task automatic wait_sync;
        repeat (SYNC_CYCLES) @(posedge w_clk);
        repeat (SYNC_CYCLES) @(posedge r_clk);
    endtask

    task automatic report_err(input string msg);
        begin
            $error("[%0t] TEST%0d: %s", $time, test_id, msg);
            err_cnt++;
        end
    endtask

    task automatic reset_fifo;
        begin
            w_rst = 0;
            r_rst = 0;
            w_en  = 0;
            r_en  = 0;
            w_data = 0;
            exp_q.delete();
            #30;
            w_rst = 1;
            r_rst = 1;
            #30;
            wait_sync();
            if (EMPTY !== 1'b1)
                report_err("after reset EMPTY should be 1");
        end
    endtask

    // 阻塞写一笔；满则等待，不报错
    task automatic fifo_write(input [DATA_WIDTH-1:0] data);
        begin
            while (FULL) @(posedge w_clk);
            @(negedge w_clk);
            w_data = data;
            w_en   = 1;
            @(posedge w_clk);
            exp_q.push_back(data);
            @(negedge w_clk);
            w_en = 0;
        end
    endtask

    // 阻塞读一笔；空则等待
    task automatic fifo_read(output [DATA_WIDTH-1:0] data_out);
        begin
            while (EMPTY) @(posedge r_clk);
            @(negedge r_clk);
            r_en = 1;
            @(posedge r_clk);
            #1step;
            data_out = r_data;
            @(negedge r_clk);
            r_en = 0;
        end
    endtask

    // 期望失败的写（已满仍拉 w_en）
    task automatic fifo_write_expect_fail;
        begin
            wait_sync();
            if (!FULL)
                report_err("expect FULL before illegal write");
            @(negedge w_clk);
            w_data = 8'hFF;
            w_en   = 1;
            @(posedge w_clk);
            @(negedge w_clk);
            w_en = 0;
            wait_sync();
        end
    endtask

    // 期望失败的读（已空仍拉 r_en）
    task automatic fifo_read_expect_fail;
        begin
            wait_sync();
            if (!EMPTY)
                report_err("expect EMPTY before illegal read");
            @(negedge r_clk);
            r_en = 1;
            @(posedge r_clk);
            @(negedge r_clk);
            r_en = 0;
            wait_sync();
        end
    endtask

    task automatic check_full(input bit expect);
        begin
            wait_sync();
            if (FULL !== expect)
                report_err(expect ? "FIFO should be FULL" : "FIFO should not be FULL");
        end
    endtask

    task automatic check_empty(input bit expect);
        begin
            wait_sync();
            if (EMPTY !== expect)
                report_err(expect ? "FIFO should be EMPTY" : "FIFO should not be EMPTY");
        end
    endtask

    task automatic drain_all;
        int guard;
        reg [DATA_WIDTH-1:0] rd_byte;
        begin
            guard = 0;
            while (guard < DEPTH * 4) begin
                wait_sync();
                if (EMPTY)
                    break;
                fifo_read(rd_byte);
                guard = guard + 1;
            end
            if (!EMPTY)
                report_err("drain_all timeout: FIFO still not empty");
        end
    endtask

    // TEST1: 写满 8 笔再读空
    task automatic test_fill_drain;
        int i;
        reg [DATA_WIDTH-1:0] rd_byte;
        begin
            test_id = 1;
            $display("[%0t] === TEST1: fill %0d entries then drain ===", $time, DEPTH);
            reset_fifo();

            for (i = 0; i < DEPTH; i = i + 1)
                fifo_write(i[DATA_WIDTH-1:0]);

            check_full(1'b1);
            fifo_write_expect_fail();

            for (i = 0; i < DEPTH; i = i + 1)
                fifo_read(rd_byte);

            check_empty(1'b1);
            fifo_read_expect_fail();

            if (exp_q.size() != 0)
                report_err($sformatf("scoreboard not empty, left=%0d", exp_q.size()));
        end
    endtask

    // TEST2: 边写边读
    task automatic test_stream;
        int i;
        reg [DATA_WIDTH-1:0] rd_byte;
        begin
            test_id = 2;
            $display("[%0t] === TEST2: concurrent write/read stream ===", $time);
            reset_fifo();

            fork
                begin
                    for (i = 0; i < 24; i = i + 1)
                        fifo_write($urandom_range(255, 0));
                end
                begin
                    for (i = 0; i < 24; i = i + 1)
                        fifo_read(rd_byte);
                end
            join

            drain_all();

            if (exp_q.size() != 0)
                report_err($sformatf("scoreboard leftover=%0d", exp_q.size()));
        end
    endtask

    // TEST3: 部分写/读/再写满/读空
    task automatic test_partial;
        int i;
        reg [DATA_WIDTH-1:0] rd_byte;
        begin
            test_id = 3;
            $display("[%0t] === TEST3: partial fill / read / refill ===", $time);
            reset_fifo();

            for (i = 0; i < 4; i = i + 1)
                fifo_write(8'hA0 + i);

            for (i = 0; i < 2; i = i + 1)
                fifo_read(rd_byte);

            for (i = 0; i < 6; i = i + 1)
                fifo_write(8'hD0 + i);

            check_full(1'b1);

            repeat (8)
                fifo_read(rd_byte);

            check_empty(1'b1);
        end
    endtask

    initial begin
        err_cnt = 0;
        $display("========================================");
        $display("  Async FIFO TB start");
        $display("  DEPTH=%0d DATA_WIDTH=%0d", DEPTH, DATA_WIDTH);
        $display("========================================");

        test_fill_drain();
        test_stream();
        test_partial();

        #100;
        if (err_cnt == 0) begin
            $display("========================================");
            $display("  ALL TESTS PASSED");
            $display("========================================");
        end else begin
            $display("========================================");
            $display("  FAILED: %0d error(s)", err_cnt);
            $display("========================================");
        end
        $finish;
    end

    initial begin
        $fsdbDumpfile("tb_fifo.fsdb");
        $fsdbDumpvars(0, tb_asy_fifo);
        $fsdbDumpvars(0, u_fifo_top);
        $fsdbDumpMDA();
    end

endmodule
