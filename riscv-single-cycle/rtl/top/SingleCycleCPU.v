module SingleCycleCPU (
    input clk,
    input reset,
    output [31:0] debug_out
);



wire [31:0] PC, PCNext, Instr;
wire [31:0] RD1, RD2, SrcB, ALUResult, MemOut, ImmExt, WD3;
wire [2:0] ALUControl;
wire [1:0] ImmSrc, ResultSrc, ALUOp;
wire RegWrite, ALUSrc, MemWrite, Branch, Zero, Sign;
wire PCSrc;
assign debug_out = ALUResult;

ProgramCounter pc (
    .clk(clk),
    .reset(~reset),
    .load(1'b1),          
    .PCNext(PCNext),
    .PC(PC)
);


NextPC pc_calc (
    .PC(PC),
    .ImmExt(ImmExt),
    .PCSrc(PCSrc),
    .PCNext(PCNext)
);


InstructionMemory imem (
    .A(PC),
    .RD(Instr)
);


MainDecoder main_dec (
    .opcode(Instr[6:0]),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .ALUOp(ALUOp)
);


ALUDecoder alu_dec (
    .ALUOp(ALUOp),
    .funct3(Instr[14:12]),
    .funct7_5(Instr[30]),
    .ALUControl(ALUControl)
);


RegisterFile rf (
    .clk(clk),
    .rst_n(reset),
    .RegWrite(RegWrite),
    .A1(Instr[19:15]),
    .A2(Instr[24:20]),
    .A3(Instr[11:7]),
    .WD3(WD3),
    .RD1(RD1),
    .RD2(RD2)
);


SignExtend sext (
    .Instr(Instr[31:7]),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
);


Mux2 mux_alu (
    .in0(RD2),
    .in1(ImmExt),
    .sel(ALUSrc),
    .out(SrcB)
);


ALU alu (
    .A(RD1),
    .B(SrcB),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .Zero(Zero),
    .Sign(Sign)
);


DataMemory dmem (
    .clk(clk),
    .WE(MemWrite),
    .A(ALUResult),
    .WD(RD2),
    .RD(MemOut)
);

assign WD3 = (ResultSrc == 2'b00) ? ALUResult :
             (ResultSrc == 2'b01) ? MemOut :
             32'b0;


assign PCSrc = Branch && (
    (Instr[14:12] == 3'b000 && Zero)   || 
    (Instr[14:12] == 3'b001 && ~Zero)  || 
    (Instr[14:12] == 3'b100 && Sign)      
);

endmodule
