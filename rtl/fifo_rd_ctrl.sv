module fifo_rd_ctrl #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3
)

(
    input wire r_clk,
    input wire r_en,
    input wire r_rst,
    input wire [ADDR_WIDTH:0] w_addr_grey,  //Extra bit for gray code to compare

    output reg [ADDR_WIDTH:0] r_addr,       //Extra bit for gray code to compare
    output reg EMPTY,
    output reg [ADDR_WIDTH:0] r_addr_grey   //Extra bit for gray code to compare
);

reg [ADDR_WIDTH:0] w_addr_grey_d1;
reg [ADDR_WIDTH:0] w_addr_grey_d2;

function automatic [ADDR_WIDTH:0] grey2bin(input [ADDR_WIDTH:0] grey);
    integer i;
    begin
        grey2bin[ADDR_WIDTH] = grey[ADDR_WIDTH];
        for (i = ADDR_WIDTH - 1; i >= 0; i = i - 1)
            grey2bin[i] = grey2bin[i + 1] ^ grey[i];
    end
endfunction

wire [ADDR_WIDTH:0] w_addr_bin = grey2bin(w_addr_grey_d2);
wire empty_comb = (r_addr == w_addr_bin);
wire [ADDR_WIDTH:0] r_addr_next = r_addr + (r_en & ~empty_comb);
wire [ADDR_WIDTH:0] r_grey_next = r_addr_next ^ (r_addr_next >> 1);

always @(posedge r_clk or negedge r_rst) begin
    if (!r_rst) begin
        r_addr<=0;
        r_addr_grey<=0;
    end
    else begin
        r_addr      <= r_addr_next;
        r_addr_grey <= r_grey_next;
    end
end

always @(posedge r_clk or negedge r_rst) begin
    if (!r_rst) begin
        w_addr_grey_d1<=0;
        w_addr_grey_d2<=0;
    end
    else begin
        w_addr_grey_d1<=w_addr_grey;
        w_addr_grey_d2<=w_addr_grey_d1;
    end
end

always @(posedge r_clk or negedge r_rst) begin
    if (!r_rst) begin
        EMPTY <= 1'b1;
    end
    else begin
        EMPTY <= empty_comb;
    end
end

endmodule
