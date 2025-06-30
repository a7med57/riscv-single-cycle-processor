module RegisterFile (
    input clk,
    input rst_n,                    
    input RegWrite,
    input [4:0] A1, A2, A3,         
    input [31:0] WD3,             
    output [31:0] RD1, RD2        
);

reg [31:0] Regs [0:31];            


assign RD1 = Regs[A1];
assign RD2 = Regs[A2];

integer i;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        for ( i = 0; i < 32; i = i + 1)
            Regs[i] <= 32'b0;
    else if (RegWrite && A3 != 5'b00000)
        Regs[A3] <= WD3;
end

endmodule
