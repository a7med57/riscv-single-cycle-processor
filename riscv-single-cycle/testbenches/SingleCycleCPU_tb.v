module SingleCycleCPU_tb;

reg clk, reset;

SingleCycleCPU dut (
    .clk(clk),
    .reset(reset)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset and run
initial begin
    reset = 1;
    #20 reset = 0;

    // Run long enough to finish Fibonacci loop
    #1000;

    $stop;
end

endmodule
