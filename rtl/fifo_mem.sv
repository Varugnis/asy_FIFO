module fifo_mem #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3
)

(
    input wire r_clk,
    input wire w_clk,
    input wire w_en,
    input wire r_en,
    input wire [DATA_WIDTH-1:0] w_data,
    input wire [ADDR_WIDTH-1:0] r_addr,
    input wire [ADDR_WIDTH-1:0] w_addr,

    output reg [DATA_WIDTH-1:0] r_data
);

localparam DEPTH = 1 << ADDR_WIDTH;

reg [DATA_WIDTH-1:0] ram_mem [0:DEPTH-1];

always @(posedge w_clk) begin
    if (w_en) begin
        ram_mem[w_addr]<=w_data;
    end
end

always @(posedge r_clk) begin
    if (r_en) begin
        r_data<=ram_mem[r_addr];
    end
end
    
endmodule