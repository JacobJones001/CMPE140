module imem (
        input  wire [5:0]  a,
        output wire [31:0] y
    );

    reg [31:0] rom [0:63];

    initial begin
        $readmemh ("/media/psf/UbuntuCMPE125/CMPE140/lab5_processor_design_1/lab5_processor_design_1/single_cycle_mips_source_initial/memfile.dat", rom);
    end

    assign y = rom[a];
    
endmodule