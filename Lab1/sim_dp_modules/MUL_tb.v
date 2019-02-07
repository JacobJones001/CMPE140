`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 07:05:25 PM
// Design Name: 
// Module Name: MUL_tb
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


module MUL_tb;
    reg [31:0] x_tb, y_tb;
    wire [31:0] z_tb;
    
    MUL dut(
        .x (x_tb),
        .y (y_tb),
        .z (z_tb)
    );
    
    initial begin
        x_tb = 32'b1111;
        y_tb = 32'b0110;
        #10;
        x_tb = 32'b1010;
        y_tb = 32'b0011;
        #10;
    end
endmodule
