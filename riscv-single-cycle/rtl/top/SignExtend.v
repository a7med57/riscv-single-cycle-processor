module SignExtend (
    input  [31:7] Instr,     
    input  [1:0] ImmSrc,     
    output reg [31:0] ImmExt 
);

wire [11:0] immI = Instr[31:20];                      
wire [11:0] immS = {Instr[31:25], Instr[11:7]};       
wire [12:0] immB = {Instr[31], Instr[7], Instr[30:25], Instr[11:8], 1'b0}; 

always @(*) begin
    case (ImmSrc)
        2'b00: ImmExt = {{20{immI[11]}}, immI};   
        2'b01: ImmExt = {{20{immS[11]}}, immS};   
        2'b10: ImmExt = {{19{immB[12]}}, immB};   
        default: ImmExt = 32'b0;
    endcase
end

endmodule
