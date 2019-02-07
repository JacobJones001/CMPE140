`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 05:57:49 PM
// Design Name: 
// Module Name: MUX2_tb
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


module MUX2_tb;
    reg sel_tb;
    reg [31:0] A_tb, B_tb;
    wire [31:0] out_tb;
    
    MUX2 dut (
        .A (A_tb),
        .B (B_tb),
        .sel (sel_tb),
        .out (out_tb)
    );
    
    initial begin
        A_tb = 32'b1111;
        B_tb = 32'b0;
        sel_tb = 1'b0;
        #10
        sel_tb = 1'b1;
        #10;
    end
endmodule
