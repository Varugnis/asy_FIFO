module asy_fifo_top #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3
)

(
    input wire w_clk,
    input wire r_clk,
    input wire [DATA_WIDTH-1:0] w_data,
    input wire r_en,
    input wire w_en,
    input wire r_rst,
    input wire w_rst,

    output wire FULL,
    output wire EMPTY,
    output wire [DATA_WIDTH-1:0] r_data

);

wire [ADDR_WIDTH:0] r_addr_ori;
wire [ADDR_WIDTH:0] w_addr_ori;
wire [ADDR_WIDTH:0] r_addr_grey;
wire [ADDR_WIDTH:0] w_addr_grey;

wire w_en_safe = w_en & ~FULL;
wire r_en_safe = r_en & ~EMPTY;

fifo_mem #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH) // 把参数喂给底层
) RAM1(
    .r_clk(r_clk),
    .w_clk(w_clk),
    .w_en(w_en_safe),
    .r_en(r_en_safe),
    .w_data(w_data),
    .r_addr(r_addr_ori[ADDR_WIDTH-1:0]),
    .w_addr(w_addr_ori[ADDR_WIDTH-1:0]),
    .r_data(r_data)
);

fifo_wr_ctrl #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH) // 把参数喂给底层
) WRITE1(
    .w_clk(w_clk),
    .w_en(w_en),
    .w_rst(w_rst),
    .r_addr_grey(r_addr_grey),
    .w_addr(w_addr_ori),
    .FULL(FULL),
    .w_addr_grey(w_addr_grey)
);

fifo_rd_ctrl #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH) // 把参数喂给底层
) READ1(
    .r_clk(r_clk),
    .r_en(r_en),
    .r_rst(r_rst),
    .w_addr_grey(w_addr_grey),
    .r_addr(r_addr_ori),
    .EMPTY(EMPTY),
    .r_addr_grey(r_addr_grey)
);

    
endmodule