module testbench_if_stage;

reg clk;
reg reset;
wire [31:0] instr;  

if_stage uut (
    .clk(clk),
    .reset(reset),
    .instr(instr)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench_if_stage);
end

initial begin
    clk = 0;
    forever #5 clk = ~clk; // Clock with a period of 10 time units
end

initial begin
    reset = 1;
    #10; // Hold reset for 10 time units
    reset = 0; // Release reset
     #100 $finish; // Run the simulation for 100 time units after releasing reset
end

endmodule