`timescale 1ns / 1ps


module tb_factorial #(parameter DATA_WIDTH = 32);
    reg clk_tb, rst_tb;
    reg Go_tb;
    reg [DATA_WIDTH-1:0] n_tb;
    wire Done_tb, Error_tb;
    wire [DATA_WIDTH-1:0] product_tb;

    factorial #(.DATA_WIDTH=DATA_WIDTH) DUT(
        .clk(clk_tb),
        .rst(rst_tb),
        .Go(Go_tb),
        .n(n_tb),
        .Done(Done_tb),
        .Error(Error_tb),
        .product(product_tb)
    );


endmodule