module ProgramCounter (
    input clk,
    input reset,
    input load,
    input [31:0] PCNext,
    output reg [31:0] PC
);

always @(posedge clk or negedge reset) begin
    if (~reset)
        PC <= 32'b0;
    else if (load)
        PC <= PCNext;
end

endmodule
