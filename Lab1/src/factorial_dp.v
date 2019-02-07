`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 05:00:18 PM
// Design Name: 
// Module Name: factorial_dp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module factorial_dp(
    input [3:0] n,
    input clk, ld_CNT, en_CNT, ld_REG, sel_MUX, OE_BUF,
    output [31:0] product,
    output x_GT_1, x_GT_12
    );
    
    wire [3:0] out_CNT;
    wire [31:0] out_MUL, out_MUX, out_REG;
    reg [3:0] one = 4'b0001, twelve = 4'b1100;
    supply1 [31:0] fourBytes;
    
    CNT CNT(
        .D (n),
        .ld (ld_CNT),
        .en (en_CNT),
        .Q (out_CNT),
        .clk (clk)
    );
    
    CMP CMP1 (
        .A (out_CNT),
        .B (one),
        .GT (x_GT_1)
    );
    
    CMP CMP12 (
        .A (out_CNT),
        .B (twelve),
        .GT (x_GT_12)
    );
    
    MUX2 MUX (
        .A (out_MUL),
        .B (fourBytes),
        .sel (sel_MUX),
        .out (out_MUX)
    );
    
    REG REG(
        .D (out_MUX),
        .LD (ld_REG),
        .clk (clk),
        .Q (out_REG)
    );
    
    MUL MUL(
        .x(out_CNT),
        .y(out_REG),
        .z(out_MUL)
    );
    
    BUFFER BUF(
        .in (out_MUL),
        .OE (OE_BUF),
        .out (product)
    );
endmodule
