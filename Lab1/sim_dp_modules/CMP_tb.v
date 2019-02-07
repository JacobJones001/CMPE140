`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 05:49:29 PM
// Design Name: 
// Module Name: CMP_tb
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


module CMP_tb;
    reg [3:0] A_tb, B_tb;
    wire GT_tb;
    
    CMP DUT(
        .A (A_tb),
        .B (B_tb),
        .GT (GT_tb)
    );
    
    initial begin
        A_tb = 4'b0000;
        B_tb = 4'b1010;
        #10;
        A_tb = 4'b1010;
        B_tb = 4'b1010;
        #10;
        A_tb = 4'b1111;
        B_tb = 4'b1010;
        #10;
    end
endmodule
