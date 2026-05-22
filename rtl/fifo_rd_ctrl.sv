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


wire [ADDR_WIDTH:0] r_addr_next;
wire [ADDR_WIDTH:0] r_grey_next;

assign r_addr_next = r_addr + (r_en & ~EMPTY);
assign r_grey_next = r_addr_next ^ (r_addr_next >> 1);

reg [ADDR_WIDTH:0] w_addr_grey_d1;
reg [ADDR_WIDTH:0] w_addr_grey_d2;


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
        EMPTY<=1'b1;
    end
    else if((r_grey_next==w_addr_grey_d2)) begin
        EMPTY<=1'b1;
    end
    else begin
        EMPTY<=1'b0;
    end
end

endmodule