module auxdec (
        input  wire [1:0] alu_op,
        input  wire [5:0] funct,
        output wire [2:0] alu_ctrl,
        output wire       hilo_sel,
        output wire       alu_out_sel
    );

    reg [4:0] ctrl;

    assign {alu_out_sel, hilo_sel, alu_ctrl} = ctrl;

    always @ (alu_op, funct) begin
        case (alu_op)
            2'b00: ctrl = 'b0_0_010;          // ADD
            2'b01: ctrl = 'b0_0_110;          // SUB
            default: case (funct)
                6'b10_0100: ctrl = 'b0_0_000; // AND
                6'b10_0101: ctrl = 'b0_0_001; // OR
                6'b10_0000: ctrl = 'b0_0_010; // ADD
                6'b10_0010: ctrl = 'b0_0_110; // SUB
                6'b10_1010: ctrl = 'b0_0_111; // SLT
                6'b01_1001: ctrl = 'b0_0_011; // MULTU
                6'b01_0000: ctrl = 'b1_0_000; // MFHI
                6'b01_0010: ctrl = 'b1_1_000; // MFLO
                default:    ctrl = 'bx_x_xxx;
            endcase
        endcase
    end

endmodule