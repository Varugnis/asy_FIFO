module fifo_wr_ctrl #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3
)

(
    input wire w_clk,
    input wire w_en,
    input wire w_rst,
    input wire [ADDR_WIDTH:0] r_addr_grey,  //Extra bit for gray code to compare
    
    output reg [ADDR_WIDTH:0] w_addr,       //Extra bit for gray code to compare
    output reg FULL,
    output reg [ADDR_WIDTH:0] w_addr_grey   //Extra bit for gray code to compare
);

reg [ADDR_WIDTH:0] r_addr_grey_d1;
reg [ADDR_WIDTH:0] r_addr_grey_d2;

function automatic [ADDR_WIDTH:0] grey2bin(input [ADDR_WIDTH:0] grey);
    integer i;
    begin
        grey2bin[ADDR_WIDTH] = grey[ADDR_WIDTH];
        for (i = ADDR_WIDTH - 1; i >= 0; i = i - 1)
            grey2bin[i] = grey2bin[i + 1] ^ grey[i];
    end
endfunction

wire [ADDR_WIDTH:0] r_addr_bin = grey2bin(r_addr_grey_d2);
wire full_comb = (w_addr == {~r_addr_bin[ADDR_WIDTH], r_addr_bin[ADDR_WIDTH-1:0]});
wire [ADDR_WIDTH:0] w_addr_next = w_addr + (w_en & ~full_comb);
wire [ADDR_WIDTH:0] w_grey_next = w_addr_next ^ (w_addr_next >> 1);

always @(posedge w_clk or negedge w_rst) begin
    if (!w_rst) begin
        w_addr<=0;
        w_addr_grey<=0;
    end
    else begin
        w_addr <= w_addr_next;
        w_addr_grey <= w_grey_next;
    end
end

always @(posedge w_clk or negedge w_rst) begin
    if (!w_rst) begin
        r_addr_grey_d1<=0;
        r_addr_grey_d2<=0;
    end
    else begin
        r_addr_grey_d1<=r_addr_grey;
        r_addr_grey_d2<=r_addr_grey_d1;
    end
end

always @(posedge w_clk or negedge w_rst) begin
    if (!w_rst) begin
        FULL <= 1'b0;
    end
    else begin
        FULL <= full_comb;
    end
end

endmodule