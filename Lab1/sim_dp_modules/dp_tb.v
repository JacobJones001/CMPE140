`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 10:52:30 PM
// Design Name: 
// Module Name: dp_tb
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


module dp_tb;
    reg [3:0] n_tb;
    reg clk_tb, ld_CNT_tb, en_CNT_tb, ld_REG_tb, sel_MUX_tb, OE_BUF_tb;
    wire [31:0] product_tb;
    wire x_GT_1_tb, x_GT_12_tb;
    
    factorial_dp dut(
        .n (n_tb),
        .clk (clk_tb),
        .ld_CNT (ld_CNT_tb),
        .en_CNT (en_CNT_tb),
        .ld_REG (ld_REG_tb),
        .sel_MUX (sel_MUX_tb),
        .OE_BUF (OE_BUF_tb),
        .product (product_tb),
        .x_GT_1 (x_GT_1_tb),
        .x_GT_12 (x_GT_12_tb)
    );
    
    task tick;
    begin
        clk_tb = 1; #10;
        clk_tb = 0; #10;
    end
    endtask
    
    initial begin
        //testing for x_gt_12_tb
        n_tb = 4'b1111;
        en_CNT_tb = 1'b1;
        ld_CNT_tb = 1'b1;
        ld_REG_tb = 1'b0;
        sel_MUX_tb = 1'b0;
        OE_BUF_tb = 1'b0;
        tick;
        tick;
        if(x_GT_1_tb != 1'b1 | x_GT_12_tb != 1'b1) $display("Error at time=%dns for status signals x_GT_1 or x_GT_12", $time);
        
    end
endmodule
