/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Wed May 20 15:13:05 2026
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_8 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_0 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_1 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_2 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_3 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_4 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_5 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_6 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_7 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP12T30P140 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module asy_fifo_top ( w_clk, r_clk, w_data, r_en, w_en, r_rst, w_rst, FULL, 
        EMPTY, r_data );
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, r_clk, r_en, w_en, r_rst, w_rst;
  output FULL, EMPTY;
  wire   \RAM1/net99 , \RAM1/net94 , \RAM1/net89 , \RAM1/net84 , \RAM1/net79 ,
         \RAM1/net74 , \RAM1/net69 , \RAM1/net64 , \RAM1/net59 , \RAM1/net58 ,
         \RAM1/N37 , \RAM1/N36 , \RAM1/N35 , \RAM1/N34 , \RAM1/N33 ,
         \RAM1/N32 , \RAM1/N31 , \RAM1/N30 , \RAM1/N29 , \RAM1/N28 ,
         \RAM1/N27 , \RAM1/N26 , \RAM1/N25 , \RAM1/N24 , \RAM1/N23 ,
         \RAM1/N22 , \RAM1/ram_mem[0][7] , \RAM1/ram_mem[0][6] ,
         \RAM1/ram_mem[0][5] , \RAM1/ram_mem[0][4] , \RAM1/ram_mem[0][3] ,
         \RAM1/ram_mem[0][2] , \RAM1/ram_mem[0][1] , \RAM1/ram_mem[0][0] ,
         \RAM1/ram_mem[1][7] , \RAM1/ram_mem[1][6] , \RAM1/ram_mem[1][5] ,
         \RAM1/ram_mem[1][4] , \RAM1/ram_mem[1][3] , \RAM1/ram_mem[1][2] ,
         \RAM1/ram_mem[1][1] , \RAM1/ram_mem[1][0] , \RAM1/ram_mem[2][7] ,
         \RAM1/ram_mem[2][6] , \RAM1/ram_mem[2][5] , \RAM1/ram_mem[2][4] ,
         \RAM1/ram_mem[2][3] , \RAM1/ram_mem[2][2] , \RAM1/ram_mem[2][1] ,
         \RAM1/ram_mem[2][0] , \RAM1/ram_mem[3][7] , \RAM1/ram_mem[3][6] ,
         \RAM1/ram_mem[3][5] , \RAM1/ram_mem[3][4] , \RAM1/ram_mem[3][3] ,
         \RAM1/ram_mem[3][2] , \RAM1/ram_mem[3][1] , \RAM1/ram_mem[3][0] ,
         \RAM1/ram_mem[4][7] , \RAM1/ram_mem[4][6] , \RAM1/ram_mem[4][5] ,
         \RAM1/ram_mem[4][4] , \RAM1/ram_mem[4][3] , \RAM1/ram_mem[4][2] ,
         \RAM1/ram_mem[4][1] , \RAM1/ram_mem[4][0] , \RAM1/ram_mem[5][7] ,
         \RAM1/ram_mem[5][6] , \RAM1/ram_mem[5][5] , \RAM1/ram_mem[5][4] ,
         \RAM1/ram_mem[5][3] , \RAM1/ram_mem[5][2] , \RAM1/ram_mem[5][1] ,
         \RAM1/ram_mem[5][0] , \RAM1/ram_mem[6][7] , \RAM1/ram_mem[6][6] ,
         \RAM1/ram_mem[6][5] , \RAM1/ram_mem[6][4] , \RAM1/ram_mem[6][3] ,
         \RAM1/ram_mem[6][2] , \RAM1/ram_mem[6][1] , \RAM1/ram_mem[6][0] ,
         \RAM1/ram_mem[7][7] , \RAM1/ram_mem[7][6] , \RAM1/ram_mem[7][5] ,
         \RAM1/ram_mem[7][4] , \RAM1/ram_mem[7][3] , \RAM1/ram_mem[7][2] ,
         \RAM1/ram_mem[7][1] , \RAM1/ram_mem[7][0] , \eq_x_5/n25 ,
         \eq_x_3/n25 , n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339;
  wire   [3:0] r_addr_ori;
  wire   [3:0] w_addr_ori;
  wire   [3:0] r_addr_grey;
  wire   [3:0] w_addr_grey;
  wire   [3:0] \WRITE1/r_addr_grey_d2 ;
  wire   [3:0] \WRITE1/r_addr_grey_d1 ;
  wire   [2:0] \WRITE1/w_grey_next ;
  wire   [3:0] \WRITE1/w_addr_next ;
  wire   [3:0] \READ1/w_addr_grey_d2 ;
  wire   [3:0] \READ1/w_addr_grey_d1 ;
  wire   [2:0] \READ1/r_grey_next ;
  wire   [3:0] \READ1/r_addr_next ;

  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_8 \RAM1/clk_gate_r_data_reg  ( 
        .CLK(r_clk), .EN(r_en), .ENCLK(\RAM1/net99 ), .TE(\RAM1/net59 ) );
  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_7 \RAM1/clk_gate_ram_mem_reg[7]  ( 
        .CLK(w_clk), .EN(\RAM1/N22 ), .ENCLK(\RAM1/net94 ), .TE(\RAM1/net59 )
         );
  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_6 \RAM1/clk_gate_ram_mem_reg[6]  ( 
        .CLK(w_clk), .EN(\RAM1/N23 ), .ENCLK(\RAM1/net89 ), .TE(\RAM1/net59 )
         );
  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_5 \RAM1/clk_gate_ram_mem_reg[5]  ( 
        .CLK(w_clk), .EN(\RAM1/N24 ), .ENCLK(\RAM1/net84 ), .TE(\RAM1/net59 )
         );
  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_4 \RAM1/clk_gate_ram_mem_reg[4]  ( 
        .CLK(w_clk), .EN(\RAM1/N25 ), .ENCLK(\RAM1/net79 ), .TE(\RAM1/net59 )
         );
  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_3 \RAM1/clk_gate_ram_mem_reg[3]  ( 
        .CLK(w_clk), .EN(\RAM1/N26 ), .ENCLK(\RAM1/net74 ), .TE(\RAM1/net59 )
         );
  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_2 \RAM1/clk_gate_ram_mem_reg[2]  ( 
        .CLK(w_clk), .EN(\RAM1/N27 ), .ENCLK(\RAM1/net69 ), .TE(\RAM1/net59 )
         );
  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_1 \RAM1/clk_gate_ram_mem_reg[1]  ( 
        .CLK(w_clk), .EN(\RAM1/N28 ), .ENCLK(\RAM1/net64 ), .TE(\RAM1/net59 )
         );
  SNPS_CLOCK_GATE_HIGH_fifo_mem_DATA_WIDTH8_ADDR_WIDTH3_0 \RAM1/clk_gate_ram_mem_reg[0]  ( 
        .CLK(w_clk), .EN(\RAM1/N29 ), .ENCLK(\RAM1/net58 ), .TE(\RAM1/net59 )
         );
  DFCNQD1BWP12T30P140 \READ1/r_addr_grey_reg[3]  ( .D(\READ1/r_addr_next [3]), 
        .CP(\RAM1/net99 ), .CDN(r_rst), .Q(r_addr_grey[3]) );
  DFCNQD1BWP12T30P140 \WRITE1/r_addr_grey_d1_reg[3]  ( .D(r_addr_grey[3]), 
        .CP(w_clk), .CDN(w_rst), .Q(\WRITE1/r_addr_grey_d1 [3]) );
  DFCNQD1BWP12T30P140 \WRITE1/r_addr_grey_d2_reg[3]  ( .D(
        \WRITE1/r_addr_grey_d1 [3]), .CP(w_clk), .CDN(w_rst), .Q(
        \WRITE1/r_addr_grey_d2 [3]) );
  DFCNQD1BWP12T30P140 \READ1/r_addr_reg[0]  ( .D(\READ1/r_addr_next [0]), .CP(
        \RAM1/net99 ), .CDN(r_rst), .Q(r_addr_ori[0]) );
  DFCNQD1BWP12T30P140 \READ1/r_addr_grey_reg[0]  ( .D(\READ1/r_grey_next [0]), 
        .CP(r_clk), .CDN(r_rst), .Q(r_addr_grey[0]) );
  DFCNQD1BWP12T30P140 \WRITE1/r_addr_grey_d1_reg[0]  ( .D(r_addr_grey[0]), 
        .CP(w_clk), .CDN(w_rst), .Q(\WRITE1/r_addr_grey_d1 [0]) );
  DFCNQD1BWP12T30P140 \WRITE1/r_addr_grey_d2_reg[0]  ( .D(
        \WRITE1/r_addr_grey_d1 [0]), .CP(w_clk), .CDN(w_rst), .Q(
        \WRITE1/r_addr_grey_d2 [0]) );
  DFCNQD1BWP12T30P140 \READ1/r_addr_reg[1]  ( .D(\READ1/r_addr_next [1]), .CP(
        \RAM1/net99 ), .CDN(r_rst), .Q(r_addr_ori[1]) );
  DFCNQD1BWP12T30P140 \READ1/r_addr_grey_reg[1]  ( .D(\READ1/r_grey_next [1]), 
        .CP(r_clk), .CDN(r_rst), .Q(r_addr_grey[1]) );
  DFCNQD1BWP12T30P140 \WRITE1/r_addr_grey_d1_reg[1]  ( .D(r_addr_grey[1]), 
        .CP(w_clk), .CDN(w_rst), .Q(\WRITE1/r_addr_grey_d1 [1]) );
  DFCNQD1BWP12T30P140 \WRITE1/r_addr_grey_d2_reg[1]  ( .D(
        \WRITE1/r_addr_grey_d1 [1]), .CP(w_clk), .CDN(w_rst), .Q(
        \WRITE1/r_addr_grey_d2 [1]) );
  DFCNQD1BWP12T30P140 \READ1/r_addr_grey_reg[2]  ( .D(\READ1/r_grey_next [2]), 
        .CP(r_clk), .CDN(r_rst), .Q(r_addr_grey[2]) );
  DFCNQD1BWP12T30P140 \WRITE1/r_addr_grey_d1_reg[2]  ( .D(r_addr_grey[2]), 
        .CP(w_clk), .CDN(w_rst), .Q(\WRITE1/r_addr_grey_d1 [2]) );
  DFCNQD1BWP12T30P140 \WRITE1/r_addr_grey_d2_reg[2]  ( .D(
        \WRITE1/r_addr_grey_d1 [2]), .CP(w_clk), .CDN(w_rst), .Q(
        \WRITE1/r_addr_grey_d2 [2]) );
  DFCNQD1BWP12T30P140 \WRITE1/w_addr_reg[0]  ( .D(\WRITE1/w_addr_next [0]), 
        .CP(w_clk), .CDN(w_rst), .Q(w_addr_ori[0]) );
  DFCNQD1BWP12T30P140 \WRITE1/w_addr_grey_reg[0]  ( .D(\WRITE1/w_grey_next [0]), .CP(w_clk), .CDN(w_rst), .Q(w_addr_grey[0]) );
  DFCNQD1BWP12T30P140 \READ1/w_addr_grey_d1_reg[0]  ( .D(w_addr_grey[0]), .CP(
        r_clk), .CDN(r_rst), .Q(\READ1/w_addr_grey_d1 [0]) );
  DFCNQD1BWP12T30P140 \READ1/w_addr_grey_d2_reg[0]  ( .D(
        \READ1/w_addr_grey_d1 [0]), .CP(r_clk), .CDN(r_rst), .Q(
        \READ1/w_addr_grey_d2 [0]) );
  DFCNQD1BWP12T30P140 \WRITE1/w_addr_reg[1]  ( .D(\WRITE1/w_addr_next [1]), 
        .CP(w_clk), .CDN(w_rst), .Q(w_addr_ori[1]) );
  DFCNQD1BWP12T30P140 \WRITE1/w_addr_grey_reg[1]  ( .D(\WRITE1/w_grey_next [1]), .CP(w_clk), .CDN(w_rst), .Q(w_addr_grey[1]) );
  DFCNQD1BWP12T30P140 \READ1/w_addr_grey_d1_reg[1]  ( .D(w_addr_grey[1]), .CP(
        r_clk), .CDN(r_rst), .Q(\READ1/w_addr_grey_d1 [1]) );
  DFCNQD1BWP12T30P140 \READ1/w_addr_grey_d2_reg[1]  ( .D(
        \READ1/w_addr_grey_d1 [1]), .CP(r_clk), .CDN(r_rst), .Q(
        \READ1/w_addr_grey_d2 [1]) );
  DFCNQD1BWP12T30P140 \WRITE1/w_addr_reg[2]  ( .D(\WRITE1/w_addr_next [2]), 
        .CP(w_clk), .CDN(w_rst), .Q(w_addr_ori[2]) );
  DFCNQD1BWP12T30P140 \WRITE1/w_addr_grey_reg[2]  ( .D(\WRITE1/w_grey_next [2]), .CP(w_clk), .CDN(w_rst), .Q(w_addr_grey[2]) );
  DFCNQD1BWP12T30P140 \READ1/w_addr_grey_d1_reg[2]  ( .D(w_addr_grey[2]), .CP(
        r_clk), .CDN(r_rst), .Q(\READ1/w_addr_grey_d1 [2]) );
  DFCNQD1BWP12T30P140 \READ1/w_addr_grey_d2_reg[2]  ( .D(
        \READ1/w_addr_grey_d1 [2]), .CP(r_clk), .CDN(r_rst), .Q(
        \READ1/w_addr_grey_d2 [2]) );
  DFCNQD1BWP12T30P140 \WRITE1/w_addr_grey_reg[3]  ( .D(\WRITE1/w_addr_next [3]), .CP(\RAM1/net94 ), .CDN(w_rst), .Q(w_addr_grey[3]) );
  DFCNQD1BWP12T30P140 \READ1/w_addr_grey_d1_reg[3]  ( .D(w_addr_grey[3]), .CP(
        r_clk), .CDN(r_rst), .Q(\READ1/w_addr_grey_d1 [3]) );
  DFCNQD1BWP12T30P140 \READ1/w_addr_grey_d2_reg[3]  ( .D(
        \READ1/w_addr_grey_d1 [3]), .CP(r_clk), .CDN(r_rst), .Q(
        \READ1/w_addr_grey_d2 [3]) );
  DFCNQD1BWP12T30P140 \READ1/r_addr_reg[2]  ( .D(\READ1/r_addr_next [2]), .CP(
        \RAM1/net99 ), .CDN(r_rst), .Q(r_addr_ori[2]) );
  DFCNQD1BWP12T30P140 \WRITE1/FULL_reg  ( .D(\eq_x_3/n25 ), .CP(w_clk), .CDN(
        w_rst), .Q(FULL) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[6][1]  ( .D(w_data[1]), .CP(\RAM1/net89 ), .Q(\RAM1/ram_mem[6][1] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[4][2]  ( .D(w_data[2]), .CP(\RAM1/net79 ), .Q(\RAM1/ram_mem[4][2] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[2][3]  ( .D(w_data[3]), .CP(\RAM1/net69 ), .Q(\RAM1/ram_mem[2][3] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[0][4]  ( .D(w_data[4]), .CP(\RAM1/net58 ), .Q(\RAM1/ram_mem[0][4] ) );
  DFSNQD1BWP12T30P140 \READ1/EMPTY_reg  ( .D(\eq_x_5/n25 ), .CP(r_clk), .SDN(
        r_rst), .Q(EMPTY) );
  DFQD1BWP12T30P140 \RAM1/r_data_reg[7]  ( .D(\RAM1/N30 ), .CP(\RAM1/net99 ), 
        .Q(r_data[7]) );
  DFQD1BWP12T30P140 \RAM1/r_data_reg[6]  ( .D(\RAM1/N31 ), .CP(\RAM1/net99 ), 
        .Q(r_data[6]) );
  DFQD1BWP12T30P140 \RAM1/r_data_reg[5]  ( .D(\RAM1/N32 ), .CP(\RAM1/net99 ), 
        .Q(r_data[5]) );
  DFQD1BWP12T30P140 \RAM1/r_data_reg[4]  ( .D(\RAM1/N33 ), .CP(\RAM1/net99 ), 
        .Q(r_data[4]) );
  DFQD1BWP12T30P140 \RAM1/r_data_reg[3]  ( .D(\RAM1/N34 ), .CP(\RAM1/net99 ), 
        .Q(r_data[3]) );
  DFQD1BWP12T30P140 \RAM1/r_data_reg[2]  ( .D(\RAM1/N35 ), .CP(\RAM1/net99 ), 
        .Q(r_data[2]) );
  DFQD1BWP12T30P140 \RAM1/r_data_reg[1]  ( .D(\RAM1/N36 ), .CP(\RAM1/net99 ), 
        .Q(r_data[1]) );
  DFQD1BWP12T30P140 \RAM1/r_data_reg[0]  ( .D(\RAM1/N37 ), .CP(\RAM1/net99 ), 
        .Q(r_data[0]) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[4][7]  ( .D(w_data[7]), .CP(\RAM1/net79 ), .Q(\RAM1/ram_mem[4][7] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[6][7]  ( .D(w_data[7]), .CP(\RAM1/net89 ), .Q(\RAM1/ram_mem[6][7] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[5][7]  ( .D(w_data[7]), .CP(\RAM1/net84 ), .Q(\RAM1/ram_mem[5][7] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[7][7]  ( .D(w_data[7]), .CP(\RAM1/net94 ), .Q(\RAM1/ram_mem[7][7] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[4][6]  ( .D(w_data[6]), .CP(\RAM1/net79 ), .Q(\RAM1/ram_mem[4][6] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[6][6]  ( .D(w_data[6]), .CP(\RAM1/net89 ), .Q(\RAM1/ram_mem[6][6] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[5][6]  ( .D(w_data[6]), .CP(\RAM1/net84 ), .Q(\RAM1/ram_mem[5][6] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[7][6]  ( .D(w_data[6]), .CP(\RAM1/net94 ), .Q(\RAM1/ram_mem[7][6] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[4][5]  ( .D(w_data[5]), .CP(\RAM1/net79 ), .Q(\RAM1/ram_mem[4][5] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[6][5]  ( .D(w_data[5]), .CP(\RAM1/net89 ), .Q(\RAM1/ram_mem[6][5] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[5][5]  ( .D(w_data[5]), .CP(\RAM1/net84 ), .Q(\RAM1/ram_mem[5][5] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[7][5]  ( .D(w_data[5]), .CP(\RAM1/net94 ), .Q(\RAM1/ram_mem[7][5] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[4][4]  ( .D(w_data[4]), .CP(\RAM1/net79 ), .Q(\RAM1/ram_mem[4][4] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[6][4]  ( .D(w_data[4]), .CP(\RAM1/net89 ), .Q(\RAM1/ram_mem[6][4] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[5][4]  ( .D(w_data[4]), .CP(\RAM1/net84 ), .Q(\RAM1/ram_mem[5][4] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[7][4]  ( .D(w_data[4]), .CP(\RAM1/net94 ), .Q(\RAM1/ram_mem[7][4] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[4][3]  ( .D(w_data[3]), .CP(\RAM1/net79 ), .Q(\RAM1/ram_mem[4][3] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[6][3]  ( .D(w_data[3]), .CP(\RAM1/net89 ), .Q(\RAM1/ram_mem[6][3] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[5][3]  ( .D(w_data[3]), .CP(\RAM1/net84 ), .Q(\RAM1/ram_mem[5][3] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[7][3]  ( .D(w_data[3]), .CP(\RAM1/net94 ), .Q(\RAM1/ram_mem[7][3] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[6][2]  ( .D(w_data[2]), .CP(\RAM1/net89 ), .Q(\RAM1/ram_mem[6][2] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[5][2]  ( .D(w_data[2]), .CP(\RAM1/net84 ), .Q(\RAM1/ram_mem[5][2] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[7][2]  ( .D(w_data[2]), .CP(\RAM1/net94 ), .Q(\RAM1/ram_mem[7][2] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[4][1]  ( .D(w_data[1]), .CP(\RAM1/net79 ), .Q(\RAM1/ram_mem[4][1] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[5][1]  ( .D(w_data[1]), .CP(\RAM1/net84 ), .Q(\RAM1/ram_mem[5][1] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[7][1]  ( .D(w_data[1]), .CP(\RAM1/net94 ), .Q(\RAM1/ram_mem[7][1] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[4][0]  ( .D(w_data[0]), .CP(\RAM1/net79 ), .Q(\RAM1/ram_mem[4][0] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[6][0]  ( .D(w_data[0]), .CP(\RAM1/net89 ), .Q(\RAM1/ram_mem[6][0] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[5][0]  ( .D(w_data[0]), .CP(\RAM1/net84 ), .Q(\RAM1/ram_mem[5][0] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[7][0]  ( .D(w_data[0]), .CP(\RAM1/net94 ), .Q(\RAM1/ram_mem[7][0] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[0][7]  ( .D(w_data[7]), .CP(\RAM1/net58 ), .Q(\RAM1/ram_mem[0][7] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[2][7]  ( .D(w_data[7]), .CP(\RAM1/net69 ), .Q(\RAM1/ram_mem[2][7] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[1][7]  ( .D(w_data[7]), .CP(\RAM1/net64 ), .Q(\RAM1/ram_mem[1][7] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[3][7]  ( .D(w_data[7]), .CP(\RAM1/net74 ), .Q(\RAM1/ram_mem[3][7] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[0][6]  ( .D(w_data[6]), .CP(\RAM1/net58 ), .Q(\RAM1/ram_mem[0][6] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[2][6]  ( .D(w_data[6]), .CP(\RAM1/net69 ), .Q(\RAM1/ram_mem[2][6] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[1][6]  ( .D(w_data[6]), .CP(\RAM1/net64 ), .Q(\RAM1/ram_mem[1][6] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[3][6]  ( .D(w_data[6]), .CP(\RAM1/net74 ), .Q(\RAM1/ram_mem[3][6] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[0][5]  ( .D(w_data[5]), .CP(\RAM1/net58 ), .Q(\RAM1/ram_mem[0][5] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[2][5]  ( .D(w_data[5]), .CP(\RAM1/net69 ), .Q(\RAM1/ram_mem[2][5] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[1][5]  ( .D(w_data[5]), .CP(\RAM1/net64 ), .Q(\RAM1/ram_mem[1][5] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[3][5]  ( .D(w_data[5]), .CP(\RAM1/net74 ), .Q(\RAM1/ram_mem[3][5] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[2][4]  ( .D(w_data[4]), .CP(\RAM1/net69 ), .Q(\RAM1/ram_mem[2][4] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[1][4]  ( .D(w_data[4]), .CP(\RAM1/net64 ), .Q(\RAM1/ram_mem[1][4] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[3][4]  ( .D(w_data[4]), .CP(\RAM1/net74 ), .Q(\RAM1/ram_mem[3][4] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[0][3]  ( .D(w_data[3]), .CP(\RAM1/net58 ), .Q(\RAM1/ram_mem[0][3] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[1][3]  ( .D(w_data[3]), .CP(\RAM1/net64 ), .Q(\RAM1/ram_mem[1][3] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[3][3]  ( .D(w_data[3]), .CP(\RAM1/net74 ), .Q(\RAM1/ram_mem[3][3] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[0][2]  ( .D(w_data[2]), .CP(\RAM1/net58 ), .Q(\RAM1/ram_mem[0][2] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[2][2]  ( .D(w_data[2]), .CP(\RAM1/net69 ), .Q(\RAM1/ram_mem[2][2] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[1][2]  ( .D(w_data[2]), .CP(\RAM1/net64 ), .Q(\RAM1/ram_mem[1][2] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[3][2]  ( .D(w_data[2]), .CP(\RAM1/net74 ), .Q(\RAM1/ram_mem[3][2] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[0][1]  ( .D(w_data[1]), .CP(\RAM1/net58 ), .Q(\RAM1/ram_mem[0][1] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[2][1]  ( .D(w_data[1]), .CP(\RAM1/net69 ), .Q(\RAM1/ram_mem[2][1] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[1][1]  ( .D(w_data[1]), .CP(\RAM1/net64 ), .Q(\RAM1/ram_mem[1][1] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[3][1]  ( .D(w_data[1]), .CP(\RAM1/net74 ), .Q(\RAM1/ram_mem[3][1] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[0][0]  ( .D(w_data[0]), .CP(\RAM1/net58 ), .Q(\RAM1/ram_mem[0][0] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[2][0]  ( .D(w_data[0]), .CP(\RAM1/net69 ), .Q(\RAM1/ram_mem[2][0] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[1][0]  ( .D(w_data[0]), .CP(\RAM1/net64 ), .Q(\RAM1/ram_mem[1][0] ) );
  DFQD1BWP12T30P140 \RAM1/ram_mem_reg[3][0]  ( .D(w_data[0]), .CP(\RAM1/net74 ), .Q(\RAM1/ram_mem[3][0] ) );
  TIELBWP12T30P140 U244 ( .ZN(\RAM1/net59 ) );
  NR2D0BWP12T30P140 U245 ( .A1(r_addr_ori[0]), .A2(r_addr_ori[1]), .ZN(n299)
         );
  INVD0BWP12T30P140 U246 ( .I(r_addr_ori[1]), .ZN(n310) );
  NR2D0BWP12T30P140 U247 ( .A1(r_addr_ori[0]), .A2(n310), .ZN(n298) );
  AOI22D1BWP12T30P140 U248 ( .A1(n299), .A2(\RAM1/ram_mem[4][7] ), .B1(n298), 
        .B2(\RAM1/ram_mem[6][7] ), .ZN(n267) );
  INVD0BWP12T30P140 U249 ( .I(r_addr_ori[0]), .ZN(n262) );
  NR2D0BWP12T30P140 U250 ( .A1(r_addr_ori[1]), .A2(n262), .ZN(n301) );
  NR2D0BWP12T30P140 U251 ( .A1(n262), .A2(n310), .ZN(n300) );
  AOI22D1BWP12T30P140 U252 ( .A1(n301), .A2(\RAM1/ram_mem[5][7] ), .B1(n300), 
        .B2(\RAM1/ram_mem[7][7] ), .ZN(n266) );
  AOI22D1BWP12T30P140 U253 ( .A1(n299), .A2(\RAM1/ram_mem[0][7] ), .B1(n298), 
        .B2(\RAM1/ram_mem[2][7] ), .ZN(n264) );
  AOI22D1BWP12T30P140 U254 ( .A1(n301), .A2(\RAM1/ram_mem[1][7] ), .B1(n300), 
        .B2(\RAM1/ram_mem[3][7] ), .ZN(n263) );
  CKAN2D0BWP12T30P140 U255 ( .A1(n264), .A2(n263), .Z(n265) );
  INVD0BWP12T30P140 U256 ( .I(r_addr_ori[2]), .ZN(n304) );
  AOI32D0BWP12T30P140 U257 ( .A1(n267), .A2(r_addr_ori[2]), .A3(n266), .B1(
        n265), .B2(n304), .ZN(\RAM1/N30 ) );
  AOI22D1BWP12T30P140 U258 ( .A1(n299), .A2(\RAM1/ram_mem[4][5] ), .B1(n298), 
        .B2(\RAM1/ram_mem[6][5] ), .ZN(n272) );
  AOI22D1BWP12T30P140 U259 ( .A1(n301), .A2(\RAM1/ram_mem[5][5] ), .B1(n300), 
        .B2(\RAM1/ram_mem[7][5] ), .ZN(n271) );
  AOI22D1BWP12T30P140 U260 ( .A1(n299), .A2(\RAM1/ram_mem[0][5] ), .B1(n298), 
        .B2(\RAM1/ram_mem[2][5] ), .ZN(n269) );
  AOI22D1BWP12T30P140 U261 ( .A1(n301), .A2(\RAM1/ram_mem[1][5] ), .B1(n300), 
        .B2(\RAM1/ram_mem[3][5] ), .ZN(n268) );
  CKAN2D0BWP12T30P140 U262 ( .A1(n269), .A2(n268), .Z(n270) );
  AOI32D0BWP12T30P140 U263 ( .A1(n272), .A2(r_addr_ori[2]), .A3(n271), .B1(
        n270), .B2(n304), .ZN(\RAM1/N32 ) );
  AOI22D1BWP12T30P140 U264 ( .A1(n299), .A2(\RAM1/ram_mem[4][4] ), .B1(n298), 
        .B2(\RAM1/ram_mem[6][4] ), .ZN(n277) );
  AOI22D1BWP12T30P140 U265 ( .A1(n301), .A2(\RAM1/ram_mem[5][4] ), .B1(n300), 
        .B2(\RAM1/ram_mem[7][4] ), .ZN(n276) );
  AOI22D1BWP12T30P140 U266 ( .A1(n299), .A2(\RAM1/ram_mem[0][4] ), .B1(n298), 
        .B2(\RAM1/ram_mem[2][4] ), .ZN(n274) );
  AOI22D1BWP12T30P140 U267 ( .A1(n301), .A2(\RAM1/ram_mem[1][4] ), .B1(n300), 
        .B2(\RAM1/ram_mem[3][4] ), .ZN(n273) );
  CKAN2D0BWP12T30P140 U268 ( .A1(n274), .A2(n273), .Z(n275) );
  AOI32D0BWP12T30P140 U269 ( .A1(n277), .A2(r_addr_ori[2]), .A3(n276), .B1(
        n275), .B2(n304), .ZN(\RAM1/N33 ) );
  AOI22D1BWP12T30P140 U270 ( .A1(n299), .A2(\RAM1/ram_mem[4][6] ), .B1(n298), 
        .B2(\RAM1/ram_mem[6][6] ), .ZN(n282) );
  AOI22D1BWP12T30P140 U271 ( .A1(n301), .A2(\RAM1/ram_mem[5][6] ), .B1(n300), 
        .B2(\RAM1/ram_mem[7][6] ), .ZN(n281) );
  AOI22D1BWP12T30P140 U272 ( .A1(n299), .A2(\RAM1/ram_mem[0][6] ), .B1(n298), 
        .B2(\RAM1/ram_mem[2][6] ), .ZN(n279) );
  AOI22D1BWP12T30P140 U273 ( .A1(n301), .A2(\RAM1/ram_mem[1][6] ), .B1(n300), 
        .B2(\RAM1/ram_mem[3][6] ), .ZN(n278) );
  CKAN2D0BWP12T30P140 U274 ( .A1(n279), .A2(n278), .Z(n280) );
  AOI32D0BWP12T30P140 U275 ( .A1(n282), .A2(r_addr_ori[2]), .A3(n281), .B1(
        n280), .B2(n304), .ZN(\RAM1/N31 ) );
  AOI22D1BWP12T30P140 U276 ( .A1(n299), .A2(\RAM1/ram_mem[4][2] ), .B1(n298), 
        .B2(\RAM1/ram_mem[6][2] ), .ZN(n287) );
  AOI22D1BWP12T30P140 U277 ( .A1(n301), .A2(\RAM1/ram_mem[5][2] ), .B1(n300), 
        .B2(\RAM1/ram_mem[7][2] ), .ZN(n286) );
  AOI22D1BWP12T30P140 U278 ( .A1(n299), .A2(\RAM1/ram_mem[0][2] ), .B1(n298), 
        .B2(\RAM1/ram_mem[2][2] ), .ZN(n284) );
  AOI22D1BWP12T30P140 U279 ( .A1(n301), .A2(\RAM1/ram_mem[1][2] ), .B1(n300), 
        .B2(\RAM1/ram_mem[3][2] ), .ZN(n283) );
  CKAN2D0BWP12T30P140 U280 ( .A1(n284), .A2(n283), .Z(n285) );
  AOI32D0BWP12T30P140 U281 ( .A1(n287), .A2(r_addr_ori[2]), .A3(n286), .B1(
        n285), .B2(n304), .ZN(\RAM1/N35 ) );
  AOI22D1BWP12T30P140 U282 ( .A1(n299), .A2(\RAM1/ram_mem[4][0] ), .B1(n298), 
        .B2(\RAM1/ram_mem[6][0] ), .ZN(n292) );
  AOI22D1BWP12T30P140 U283 ( .A1(n301), .A2(\RAM1/ram_mem[5][0] ), .B1(n300), 
        .B2(\RAM1/ram_mem[7][0] ), .ZN(n291) );
  AOI22D1BWP12T30P140 U284 ( .A1(n299), .A2(\RAM1/ram_mem[0][0] ), .B1(n298), 
        .B2(\RAM1/ram_mem[2][0] ), .ZN(n289) );
  AOI22D1BWP12T30P140 U285 ( .A1(n301), .A2(\RAM1/ram_mem[1][0] ), .B1(n300), 
        .B2(\RAM1/ram_mem[3][0] ), .ZN(n288) );
  CKAN2D0BWP12T30P140 U286 ( .A1(n289), .A2(n288), .Z(n290) );
  AOI32D0BWP12T30P140 U287 ( .A1(n292), .A2(r_addr_ori[2]), .A3(n291), .B1(
        n290), .B2(n304), .ZN(\RAM1/N37 ) );
  AOI22D1BWP12T30P140 U288 ( .A1(n299), .A2(\RAM1/ram_mem[4][3] ), .B1(n298), 
        .B2(\RAM1/ram_mem[6][3] ), .ZN(n297) );
  AOI22D1BWP12T30P140 U289 ( .A1(n301), .A2(\RAM1/ram_mem[5][3] ), .B1(n300), 
        .B2(\RAM1/ram_mem[7][3] ), .ZN(n296) );
  AOI22D1BWP12T30P140 U290 ( .A1(n299), .A2(\RAM1/ram_mem[0][3] ), .B1(n298), 
        .B2(\RAM1/ram_mem[2][3] ), .ZN(n294) );
  AOI22D1BWP12T30P140 U291 ( .A1(n301), .A2(\RAM1/ram_mem[1][3] ), .B1(n300), 
        .B2(\RAM1/ram_mem[3][3] ), .ZN(n293) );
  CKAN2D0BWP12T30P140 U292 ( .A1(n294), .A2(n293), .Z(n295) );
  AOI32D0BWP12T30P140 U293 ( .A1(n297), .A2(r_addr_ori[2]), .A3(n296), .B1(
        n295), .B2(n304), .ZN(\RAM1/N34 ) );
  AOI22D1BWP12T30P140 U294 ( .A1(n299), .A2(\RAM1/ram_mem[4][1] ), .B1(n298), 
        .B2(\RAM1/ram_mem[6][1] ), .ZN(n307) );
  AOI22D1BWP12T30P140 U295 ( .A1(n301), .A2(\RAM1/ram_mem[5][1] ), .B1(n300), 
        .B2(\RAM1/ram_mem[7][1] ), .ZN(n306) );
  AOI22D1BWP12T30P140 U296 ( .A1(n299), .A2(\RAM1/ram_mem[0][1] ), .B1(n298), 
        .B2(\RAM1/ram_mem[2][1] ), .ZN(n303) );
  AOI22D1BWP12T30P140 U297 ( .A1(n301), .A2(\RAM1/ram_mem[1][1] ), .B1(n300), 
        .B2(\RAM1/ram_mem[3][1] ), .ZN(n302) );
  CKAN2D0BWP12T30P140 U298 ( .A1(n303), .A2(n302), .Z(n305) );
  AOI32D0BWP12T30P140 U299 ( .A1(n307), .A2(r_addr_ori[2]), .A3(n306), .B1(
        n305), .B2(n304), .ZN(\RAM1/N36 ) );
  IND3D1BWP12T30P140 U300 ( .A1(EMPTY), .B1(r_en), .B2(r_addr_ori[0]), .ZN(
        n308) );
  NR2D0BWP12T30P140 U301 ( .A1(n308), .A2(n310), .ZN(n316) );
  AOI21D0BWP12T30P140 U302 ( .A1(n308), .A2(n310), .B(n316), .ZN(
        \READ1/r_addr_next [1]) );
  INR2D1BWP12T30P140 U303 ( .A1(r_en), .B1(EMPTY), .ZN(n309) );
  OAI21D0BWP12T30P140 U304 ( .A1(n309), .A2(r_addr_ori[0]), .B(n308), .ZN(n311) );
  INVD0BWP12T30P140 U305 ( .I(n311), .ZN(\READ1/r_addr_next [0]) );
  OAI22D1BWP12T30P140 U306 ( .A1(n311), .A2(n310), .B1(\READ1/r_addr_next [1]), 
        .B2(\READ1/r_addr_next [0]), .ZN(n333) );
  INVD0BWP12T30P140 U307 ( .I(n333), .ZN(\READ1/r_grey_next [0]) );
  ND2D0BWP12T30P140 U308 ( .A1(w_addr_ori[0]), .A2(w_en), .ZN(n338) );
  OR2D1BWP12T30P140 U309 ( .A1(n338), .A2(FULL), .Z(n312) );
  INVD0BWP12T30P140 U310 ( .I(w_addr_ori[1]), .ZN(n337) );
  NR3D0BWP12T30P140 U311 ( .A1(FULL), .A2(n338), .A3(n337), .ZN(n319) );
  AOI21D0BWP12T30P140 U312 ( .A1(n312), .A2(n337), .B(n319), .ZN(
        \WRITE1/w_addr_next [1]) );
  MAOI22D1BWP12T30P140 U313 ( .A1(n319), .A2(w_addr_ori[2]), .B1(w_addr_ori[2]), .B2(n319), .ZN(\WRITE1/w_addr_next [2]) );
  INVD0BWP12T30P140 U314 ( .I(\WRITE1/w_addr_next [1]), .ZN(n315) );
  INVD0BWP12T30P140 U315 ( .I(w_addr_ori[2]), .ZN(n336) );
  OAI22D1BWP12T30P140 U316 ( .A1(n315), .A2(n336), .B1(\WRITE1/w_addr_next [2]), .B2(\WRITE1/w_addr_next [1]), .ZN(n325) );
  INVD0BWP12T30P140 U317 ( .I(n325), .ZN(\WRITE1/w_grey_next [1]) );
  INVD0BWP12T30P140 U318 ( .I(w_en), .ZN(n313) );
  OR2D1BWP12T30P140 U319 ( .A1(w_addr_ori[0]), .A2(n313), .Z(n339) );
  OAI21D0BWP12T30P140 U320 ( .A1(FULL), .A2(n313), .B(w_addr_ori[0]), .ZN(n314) );
  OAI21D0BWP12T30P140 U321 ( .A1(FULL), .A2(n339), .B(n314), .ZN(
        \WRITE1/w_addr_next [0]) );
  MUX2ND0BWP12T30P140 U322 ( .I0(\WRITE1/w_addr_next [1]), .I1(n315), .S(
        \WRITE1/w_addr_next [0]), .ZN(n324) );
  INVD0BWP12T30P140 U323 ( .I(n324), .ZN(\WRITE1/w_grey_next [0]) );
  MAOI22D1BWP12T30P140 U324 ( .A1(n316), .A2(r_addr_ori[2]), .B1(r_addr_ori[2]), .B2(n316), .ZN(\READ1/r_addr_next [2]) );
  MOAI22D0BWP12T30P140 U325 ( .A1(\READ1/r_addr_next [2]), .A2(
        \READ1/r_addr_next [1]), .B1(\READ1/r_addr_next [1]), .B2(
        r_addr_ori[2]), .ZN(n332) );
  INVD0BWP12T30P140 U326 ( .I(n332), .ZN(\READ1/r_grey_next [1]) );
  AOI21D0BWP12T30P140 U327 ( .A1(r_addr_ori[2]), .A2(n316), .B(r_addr_grey[3]), 
        .ZN(n317) );
  AOI31D1BWP12T30P140 U328 ( .A1(r_addr_ori[2]), .A2(n316), .A3(r_addr_grey[3]), .B(n317), .ZN(\READ1/r_addr_next [3]) );
  INVD0BWP12T30P140 U329 ( .I(\READ1/r_addr_next [2]), .ZN(n318) );
  OAI22D1BWP12T30P140 U330 ( .A1(n318), .A2(n317), .B1(\READ1/r_addr_next [3]), 
        .B2(\READ1/r_addr_next [2]), .ZN(n329) );
  INVD0BWP12T30P140 U331 ( .I(n329), .ZN(\READ1/r_grey_next [2]) );
  INVD0BWP12T30P140 U332 ( .I(w_addr_grey[3]), .ZN(n321) );
  ND2D0BWP12T30P140 U333 ( .A1(n319), .A2(w_addr_ori[2]), .ZN(n320) );
  MUX2ND0BWP12T30P140 U334 ( .I0(w_addr_grey[3]), .I1(n321), .S(n320), .ZN(
        \WRITE1/w_addr_next [3]) );
  MAOI22D1BWP12T30P140 U335 ( .A1(\WRITE1/w_addr_next [2]), .A2(w_addr_grey[3]), .B1(\WRITE1/w_addr_next [3]), .B2(\WRITE1/w_addr_next [2]), .ZN(
        \WRITE1/w_grey_next [2]) );
  OAI22D1BWP12T30P140 U336 ( .A1(\WRITE1/w_addr_next [3]), .A2(
        \WRITE1/r_addr_grey_d2 [3]), .B1(\WRITE1/r_addr_grey_d2 [2]), .B2(
        \WRITE1/w_grey_next [2]), .ZN(n322) );
  AOI221D1BWP12T30P140 U337 ( .A1(\WRITE1/w_addr_next [3]), .A2(
        \WRITE1/r_addr_grey_d2 [3]), .B1(\WRITE1/w_grey_next [2]), .B2(
        \WRITE1/r_addr_grey_d2 [2]), .C(n322), .ZN(n327) );
  OAI22D1BWP12T30P140 U338 ( .A1(n325), .A2(\WRITE1/r_addr_grey_d2 [1]), .B1(
        n324), .B2(\WRITE1/r_addr_grey_d2 [0]), .ZN(n323) );
  AOI221D1BWP12T30P140 U339 ( .A1(n325), .A2(\WRITE1/r_addr_grey_d2 [1]), .B1(
        \WRITE1/r_addr_grey_d2 [0]), .B2(n324), .C(n323), .ZN(n326) );
  CKAN2D0BWP12T30P140 U340 ( .A1(n327), .A2(n326), .Z(\eq_x_3/n25 ) );
  INVD0BWP12T30P140 U341 ( .I(\READ1/r_addr_next [3]), .ZN(n330) );
  OAI22D1BWP12T30P140 U342 ( .A1(n330), .A2(\READ1/w_addr_grey_d2 [3]), .B1(
        n329), .B2(\READ1/w_addr_grey_d2 [2]), .ZN(n328) );
  AOI221D1BWP12T30P140 U343 ( .A1(n330), .A2(\READ1/w_addr_grey_d2 [3]), .B1(
        \READ1/w_addr_grey_d2 [2]), .B2(n329), .C(n328), .ZN(n335) );
  OAI22D1BWP12T30P140 U344 ( .A1(n333), .A2(\READ1/w_addr_grey_d2 [0]), .B1(
        n332), .B2(\READ1/w_addr_grey_d2 [1]), .ZN(n331) );
  AOI221D1BWP12T30P140 U345 ( .A1(n333), .A2(\READ1/w_addr_grey_d2 [0]), .B1(
        \READ1/w_addr_grey_d2 [1]), .B2(n332), .C(n331), .ZN(n334) );
  CKAN2D0BWP12T30P140 U346 ( .A1(n335), .A2(n334), .Z(\eq_x_5/n25 ) );
  NR3D0BWP12T30P140 U347 ( .A1(n338), .A2(n337), .A3(n336), .ZN(\RAM1/N22 ) );
  NR3D0BWP12T30P140 U348 ( .A1(n339), .A2(n337), .A3(n336), .ZN(\RAM1/N23 ) );
  NR3D0BWP12T30P140 U349 ( .A1(w_addr_ori[1]), .A2(n338), .A3(n336), .ZN(
        \RAM1/N24 ) );
  NR3D0BWP12T30P140 U350 ( .A1(w_addr_ori[1]), .A2(n339), .A3(n336), .ZN(
        \RAM1/N25 ) );
  NR3D0BWP12T30P140 U351 ( .A1(w_addr_ori[2]), .A2(n337), .A3(n338), .ZN(
        \RAM1/N26 ) );
  NR3D0BWP12T30P140 U352 ( .A1(w_addr_ori[2]), .A2(n337), .A3(n339), .ZN(
        \RAM1/N27 ) );
  NR3D0BWP12T30P140 U353 ( .A1(w_addr_ori[1]), .A2(w_addr_ori[2]), .A3(n338), 
        .ZN(\RAM1/N28 ) );
  NR3D0BWP12T30P140 U354 ( .A1(w_addr_ori[1]), .A2(w_addr_ori[2]), .A3(n339), 
        .ZN(\RAM1/N29 ) );
endmodule

