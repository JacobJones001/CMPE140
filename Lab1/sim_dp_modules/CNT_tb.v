`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 06:21:27 PM
// Design Name: 
// Module Name: CNT_tb
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


module CNT_tb;
    reg [3:0] D_tb;
    reg clk_tb, en_tb, ld_tb;
    wire [3:0] Q_tb;
    
    CNT dut(
        .D (D_tb),
        .clk (clk_tb),
        .en (en_tb),
        .ld (ld_tb),
        .Q (Q_tb)
    );
    
    task tick;
    begin
        clk_tb = 1; #10;
        clk_tb = 0; #10;
    end
    endtask
    
    initial begin
        D_tb = 4'b0000;
        ld_tb = 1'b0;
        en_tb = 1'b0;
        tick;
        tick;
        D_tb = 4'b1010;
        tick;
        ld_tb = 1'b1;
        tick;
        en_tb = 1'b1;
        tick;
        tick;
        D_tb = 4'b1111;
        tick;
        ld_tb=1'b0;
        tick;
        tick;
        tick;
        tick;
        tick;
        tick;
        tick;
                
    end
endmodule
