module testbench_if_stage;

reg clk;
reg reset;

reg PCsel;
reg [31:0] branch_target;

wire [31:0] instr;  

if_stage uut (
    .clk(clk),
    .reset(reset),
    .PCsel(PCsel),
    .branch_target(branch_target),
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
    PCsel = 0; // Start with PCsel = 0 (sequential execution)
    branch_target = 32'h00000010; 
    #10; 
    reset = 0; 

    #260; // Wait for a few clock cycles to observe sequential execution

    // Test branch taken
    PCsel = 1; // Set PCsel to 1 to take the branch
    #20; 

    PCsel = 0; // Set PCsel back to 0 for sequential execution
    #60; 
    
    $finish; 
end

endmodule