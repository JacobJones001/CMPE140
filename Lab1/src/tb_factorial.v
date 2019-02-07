`timescale 1ns / 1ps


module tb_factorial #(parameter DATA_WIDTH = 32);
    reg clk_tb, rst_tb;
    reg Go_tb;
    reg [DATA_WIDTH-1:0] n_tb, n_test_tb;
    wire Done_tb, Error_tb;
    wire [DATA_WIDTH-1:0] product_tb;
    
    //DEBUG
    wire [2:0] CS_tb = DUT.FACT_CU.CS;
    wire x_gt_1_tb = DUT.x_gt_1;
    wire x_gt_12_tb = DUT.x_gt_12;
    wire ld_CNT_tb = DUT.ld_CNT, en_CNT_tb = DUT.en_CNT, ld_REG_tb = DUT.ld_REG, sel_MUX_tb = DUT.sel_MUX, OE_BUF_tb = DUT.OE_BUF;
    wire [3:0] out_CNT = DUT.FACT_DP.out_CNT;

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
    integer product_expected_tb = 0;

    initial
    begin
        clk_tb = 0;
        rst_tb = 0;
        Go_tb = 0;
        tick;

        for(integer test_num = 0; test_num <= 13; test_num = test_num + 1)
        begin
            n_tb = test_num;
            n_test_tb = test_num;
            tick;
            Go_tb = 1;
            tick;
            Go_tb = 0;
            tick; // WAIT STATE
            if( n_tb > 12) Go_tb = 0;
            else begin
                while(n_tb > 1) begin
                    n_tb = n_tb - 1;
                    tick;
                    if (n_tb == 1) tick;
                end 
            end
            tick;
            if( n_tb > 12) CHECK_ERR;
            else CHECK_PRODUCT;
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

        product_expected_tb = 1;
        while (n_test_tb >1) begin
            product_expected_tb = product_expected_tb * n_test_tb;
            n_test_tb = n_test_tb - 1;
        end

        if(product_tb != product_expected_tb) begin
            error_count = error_count + 1;
            $display("Error: Product - Product");
        end
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
    
    initial begin 
    #300 $display("Error Count:", error_count);
    $stop;
    end



endmodule