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

wire [ADDR_WIDTH:0] w_addr_next;
wire [ADDR_WIDTH:0] w_grey_next;

assign w_addr_next = w_addr + (w_en & ~FULL);
assign w_grey_next = w_addr_next ^ (w_addr_next >> 1);

reg [ADDR_WIDTH:0] r_addr_grey_d1;
reg [ADDR_WIDTH:0] r_addr_grey_d2;

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
        FULL<=1'b0;
    end
    else if ({ ~w_grey_next[ADDR_WIDTH:ADDR_WIDTH-1], w_grey_next[ADDR_WIDTH-2:0]}==r_addr_grey_d2[ADDR_WIDTH:0]) begin
        FULL<=1'b1;
    end
    else begin
        FULL<=1'b0;
    end
end

endmodule