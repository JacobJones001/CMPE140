module factorial #(parameter DATA_WIDTH = 32)(
    input rst, clk,
    input Go,
    input [DATA_WIDTH-1:0] n,
    output wire Done, Error,
    output [DATA_WIDTH-1:0] product
);

    wire x_gt_1, x_gt_12;

    // TODO: Add signals as needed
    factorial_cu #(.DATA_WIDTH(DATA_WIDTH)) FACT_CU(
        .Go(Go),
        .rst(rst),
        .clk(clk),
        .Error(Error),
        .Done(Done),
        .x_gt_1(x_gt_1),
        .x_gt_12(x_gt_12)
    );


endmodule