`timescale 1ns / 1ps


module tb_factorial #(parameter DATA_WIDTH = 32);
    reg clk_tb, rst_tb;
    reg Go_tb;
    reg [DATA_WIDTH-1:0] n_tb;
    wire Done_tb, Error_tb;
    wire [DATA_WIDTH-1:0] product_tb;

    factorial #(.DATA_WIDTH(DATA_WIDTH)) DUT(
        .clk(clk_tb),
        .rst(rst_tb),
        .Go(Go_tb),
        .n(n_tb),
        .Done(Done_tb),
        .Error(Error_tb),
        .product(product_tb)
    );


    integer error_count = 0;

    initial
    begin
        clk_tb = 0;
        rst_tb = 0;
        Go_tb = 0;
        tick;

        for(integer test_num = 0; test_num <= 13; test_num = test_num + 1)
        begin
            n_tb = test_num;
            tick;
            Go_tb = 1;
            tick;
            Go_tb = 0;
            if( n_tb > 12) CHECK_ERR;
            else begin
                while(n_tb > 0) begin
                    n_tb = n_tb - 1;
                    tick;
                end
                CHECK_PRODUCT;
            end
            tick;
        end
    end

    task CHECK_PRODUCT;
    begin
        if(Error_tb != 0) begin
            error_count = error_count + 1;
            $display("Error: Product - Error");
        end 
        if(Done_tb != 1) begin
            error_count = error_count + 1;
            $display("Error: Product - Done");
        end 
        // if(product_tb != 1) begin
        //     error_count = error_count + 1;
        //     $display("Error: Product - Done");
        // end
    end
    endtask

    task CHECK_ERR;
    begin
        if(Error_tb != 1) begin
            error_count = error_count + 1;
            $display("Error: Error - Error");
        end 
        if(Done_tb != 0) begin
            error_count = error_count + 1;
            $display("Error: Error - Done");
        end 
    end
    endtask

    task tick;
        begin
           clk_tb<=1;
           #1;
           clk_tb<=0;
           #1;
        end
    endtask
    
    initial #250 $stop;



endmodule