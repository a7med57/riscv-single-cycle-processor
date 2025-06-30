module NextPC (
    input [31:0] PC,
    input [31:0] ImmExt,
    input PCSrc,
    output [31:0] PCNext
);
 wire [31:0] PC_Plus_4;
    wire [31:0] PC_Branch;

    assign PC_Plus_4 = PC + 4;
    assign PC_Branch = PC + ImmExt;

    assign PCNext = PCSrc ? PC_Branch : PC_Plus_4; 
   
endmodule
