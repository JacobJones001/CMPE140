`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 05:33:13 PM
// Design Name: 
// Module Name: BUF_tb
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


module BUF_tb;
    reg [31:0] in_tb;
    reg OE_tb;
    wire [31:0] out_tb;
    
    BUFFER dut(
        .in (in_tb),
        .OE (OE_tb),
        .out (out_tb)
    );
    
    initial begin
        #5;
        in_tb = 32'b1;
        OE_tb = 1'b1;
        #10;
        OE_tb = 1'b0;
        #10;
    end
endmodule
