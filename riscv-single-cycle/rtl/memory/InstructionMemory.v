module InstructionMemory (
    input  [31:0] A,     
    output [31:0] RD    
);

reg [31:0] ROM [0:63]; 



initial begin
   
    $readmemh("program.hex", ROM);

end

assign RD = ROM[A[31:2]]; 


endmodule
