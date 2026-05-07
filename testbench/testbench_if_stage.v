module testbench_if_stage;

reg clk;
reg reset;

reg [31:0] pc_current;
reg PCsel;
reg [31:0] branch_target;

wire [31:0] instr;
wire [31:0] pc_plus4;

if_stage uut (
    .clk(clk),
    .reset(reset),
    .pc_current(pc_current),
    .PCsel(PCsel),
    .branch_target(branch_target),
    .instr(instr),
    .pc_plus4(pc_plus4)
);

// clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0, testbench_if_stage);

    reset = 1;
    PCsel = 0;
    branch_target = 32'h00000020;


    //Read PC from command line, default to 0 if not provided
    if (!$value$plusargs("pc=%h", pc_current)) begin
        pc_current = 32'h0;
    end

    #10 reset = 0;

    #10;

    if (pc_current > 32'h000003FC) begin

        $display("❌ ERROR: PC out of instruction memory range!");
        $display("PC = %h", pc_current);

    end

    else begin
    $display("====================================");
    $display("INPUT PC      = %h", pc_current);
    $display("OUTPUT INSTR  = %h", instr);
    $display("OUTPUT PC+4   = %h", pc_plus4);
    $display("====================================");
    end

    $finish;
end
endmodule