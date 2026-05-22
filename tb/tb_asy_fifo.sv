`timescale 1ns / 1ps

module tb_asy_fifo;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 3;
    localparam DEPTH = 1 << ADDR_WIDTH;

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

    // 写时钟 100MHz
    initial begin
        w_clk = 0;
        forever #5 w_clk = ~w_clk;
    end

    // 读时钟 ~38.5MHz（与写时钟异步）
    initial begin
        r_clk = 0;
        forever #13 r_clk = ~r_clk;
    end

    // 成功写入时入队；成功读出时出队比对
    always @(posedge w_clk) begin
        if (w_rst && w_en && !FULL) begin
            exp_q.push_back(w_data);
        end
    end

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
            if (!EMPTY)
                report_err("after reset EMPTY should be 1");
        end
    endtask

    task automatic report_err(input string msg);
        begin
            $error("[%0t] TEST%0d: %s", $time, test_id, msg);
            err_cnt++;
        end
    endtask

    task automatic drive_write(input [DATA_WIDTH-1:0] data, input bit expect_ok);
        begin
            @(negedge w_clk);
            if (expect_ok && FULL) begin
                report_err($sformatf("write 0x%0h blocked: already FULL", data));
            end else if (!expect_ok && !FULL) begin
                report_err($sformatf("write 0x%0h should be blocked by FULL", data));
            end else begin
                w_data = data;
                w_en   = 1;
                @(posedge w_clk);
                @(negedge w_clk);
                w_en = 0;
            end
        end
    endtask

    task automatic drive_read(input bit expect_ok, output [DATA_WIDTH-1:0] data_out);
        begin
            @(negedge r_clk);
            if (expect_ok && EMPTY) begin
                report_err("read blocked: already EMPTY");
            end else if (!expect_ok && !EMPTY) begin
                report_err("read should be blocked by EMPTY");
            end else begin
                r_en = 1;
                @(posedge w_clk);
                #1step;
                data_out = r_data;
                @(negedge r_clk);
                r_en = 0;
            end
        end
    endtask

    // TEST1: 写满 8 笔再读空，顺序 0~7
    task automatic test_fill_drain;
        int i;
        logic [DATA_WIDTH-1:0] rd_byte;
        begin
            test_id = 1;
            $display("[%0t] === TEST1: fill %0d entries then drain ===", $time, DEPTH);
            reset_fifo();

            for (i = 0; i < DEPTH; i = i + 1)
                drive_write(i[DATA_WIDTH-1:0], 1);

            if (!FULL)
                report_err("FIFO should be FULL after 8 writes");

            drive_write(8'hFF, 0);

            for (i = 0; i < DEPTH; i = i + 1)
                drive_read(1, rd_byte);

            if (!EMPTY)
                report_err("FIFO should be EMPTY after 8 reads");

            drive_read(0, rd_byte);

            if (exp_q.size() != 0)
                report_err($sformatf("scoreboard not empty, left=%0d", exp_q.size()));
        end
    endtask

    // TEST2: 边写边读（写快读慢），检查连续流水
    task automatic test_stream;
        int i;
        logic [DATA_WIDTH-1:0] rd_byte;
        begin
            test_id = 2;
            $display("[%0t] === TEST2: concurrent write/read stream ===", $time);
            reset_fifo();

            fork
                begin
                    for (i = 0; i < 24; i = i + 1) begin
                        drive_write($urandom_range(255, 0), 1);
                    end
                end
                begin
                    repeat (24) begin
                        while (EMPTY) @(posedge r_clk);
                        drive_read(1, rd_byte);
                    end
                end
            join

            #200;
            while (!EMPTY)
                drive_read(1, rd_byte);

            if (exp_q.size() != 0)
                report_err($sformatf("scoreboard leftover=%0d", exp_q.size()));
        end
    endtask

    // TEST3: 先写 4 笔，读 2 笔，再写满，再读空
    task automatic test_partial;
        int i;
        logic [DATA_WIDTH-1:0] rd_byte;
        begin
            test_id = 3;
            $display("[%0t] === TEST3: partial fill / read / refill ===", $time);
            reset_fifo();

            for (i = 0; i < 4; i = i + 1)
                drive_write(8'hA0 + i, 1);

            for (i = 0; i < 2; i = i + 1)
                drive_read(1, rd_byte);

            for (i = 0; i < 6; i = i + 1)
                drive_write(8'hD0 + i, 1);

            if (!FULL)
                report_err("FIFO should be FULL after refill");

            repeat (8)
                drive_read(1, rd_byte);

            if (!EMPTY)
                report_err("FIFO should be EMPTY at end of TEST3");
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
