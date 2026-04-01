module if_stage (
    input clk,
    input reset,
    output [31:0] instr
);
 wire [31:0] pc;
 wire [31:0] next_pc;

 pc pc_inst (
     .clk(clk),
     .reset(reset),
     .next_pc(next_pc),
     .pc(pc)
 );

 assign next_pc = pc + 4; // Simple increment for the next PC, can be modified as needed
 imem imem_inst (
     .addr(pc),
     .instr(instr)
 );
 always @(posedge clk) begin
    if (reset)
        $display("RESET active -> PC = %h", pc);
    else
        $display("Time=%0t | PC=%h | next_PC=%h | instruction=%h", 
                  $time, pc, next_pc, instr);
end
 endmodule