`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 06:06:34 PM
// Design Name: 
// Module Name: REG_tb
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


module REG_tb;
    reg [31:0] D_tb;
    reg LD_tb, clk_tb;
    wire [31:0] Q_tb;
    
    REG dut(
        .D (D_tb),
        .LD (LD_tb),
        .clk (clk_tb),
        .Q (Q_tb)
    );
    
    task tick;
    begin
        clk_tb = 1; #10;
        clk_tb = 0; #10;
    end
    endtask
    
    initial begin
        tick;
        tick;
        D_tb = 32'b1111;
        LD_tb = 1'b0;
        tick;
        LD_tb = 1'b1;
        tick;
        D_tb = 32'b1010;
        tick;
        LD_tb = 1'b0;
        D_tb = 32'b0000;
        tick;
    end
    
endmodule
