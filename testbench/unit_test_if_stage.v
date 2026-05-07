module unit_test_if_stage;

reg clk;
reg reset;

reg [31:0] pc_current;
reg PCsel;
reg [31:0] branch_target;

wire [31:0] instr;
wire [31:0] pc_plus4;

integer pass = 0;
integer fail = 0;

reg [31:0] memory [0:255];

// DUT
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

// load expected memory
initial begin
    $readmemh("program/program.mem", memory);
end

reg [31:0] expected_instr;
reg [31:0] expected_pc4;

// test
initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0, unit_test_if_stage);

    reset = 1;
    PCsel = 0;
    branch_target = 0;

    // đọc PC từ terminal
    if (!$value$plusargs("pc=%h", pc_current)) begin
        $display("ERROR: Khong co gia tri PC dau vao!");
        $finish;
    end

    #10 reset = 0;

    #10;
    
    if (pc_current > 32'h000003FC)     
    begin
    $display("❌ ERROR: PC out of instruction memory range!");
    $display("PC = %h", pc_current);

    fail = fail + 1;

    $display("SUMMARY: PASS=%0d FAIL=%0d", pass, fail);

    $finish;
    end

    expected_instr = memory[pc_current[9:2]];
    expected_pc4  = pc_current + 4;

    $display("====================================");
    $display("INPUT PC         = %h", pc_current);
    $display("EXPECTED INSTR   = %h", expected_instr);
    $display("ACTUAL INSTR     = %h", instr);
    $display("EXPECTED PC+4    = %h", expected_pc4);
    $display("ACTUAL PC+4      = %h", pc_plus4);
    $display("====================================");

    if (instr === expected_instr &&
        pc_plus4 === expected_pc4) begin

        $display("✅ PASS");
        pass = pass + 1;

    end
    else begin

        $display("❌ FAIL");
        fail = fail + 1;

    end

    $display("SUMMARY: PASS=%0d FAIL=%0d", pass, fail);

    $finish;
end

endmodule