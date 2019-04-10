module tb_mips_top;

    reg         clk;
    reg         rst;
    wire        we_dm;
    wire [31:0] pc_current;
    wire [31:0] instr;
    wire [31:0] alu_mux_out;
    wire [31:0] wd_dm;
    wire [31:0] rd_dm;
    wire [31:0] DONT_USE;
    wire [31:0] wd_rf;
    wire [4:0]  rf_wa;
    
    // Debug
    wire alu_out_sel = DUT.mips.alu_out_sel;
    wire hilo_sel = DUT.mips.hilo_sel;
    wire dm2reg = DUT.mips.dm2reg;
    wire we_hilo = DUT.mips.we_hilo;
    wire [63:0] hilo_d = DUT.mips.dp.hilo_d;
    wire [63:0] hilo_q = DUT.mips.dp.hilo_q;

    
    mips_top DUT (
            .clk            (clk),
            .rst            (rst),
            .we_dm          (we_dm),
            .ra3            (5'b00000),
            .pc_current     (pc_current),
            .instr          (instr),
            .alu_out        (alu_mux_out),
            .wd_dm          (wd_dm),
            .rd_dm          (rd_dm),
            .rd3            (DONT_USE),
            .wd_rf          (wd_rf),
            .rf_wa          (rf_wa)
        );
    
    task tick; 
    begin 
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
    endtask

    task reset;
    begin 
        rst = 1'b0; #5;
        rst = 1'b1; #5;
        rst = 1'b0;
    end
    endtask
    
    initial begin
        reset;
        while(pc_current != 32'h48) 
        begin
            tick;
        end
        $finish;
    end

endmodule