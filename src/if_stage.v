module if_stage (
    input clk,
    input reset,

    input PCsel,
    input [31:0] branch_target,

    output [31:0] instr
);
 wire [31:0] pc;
 wire [31:0] pc_plus4;
 wire [31:0] next_pc;

 pc pc_inst (
     .clk(clk),
     .reset(reset),
     .next_pc(next_pc),
     .pc(pc)
 );

 assign pc_plus4 = pc + 4; 

 mux2 pc_mux (
     .a(pc_plus4),
     .b(branch_target),
     .sel(PCsel),
     .y(next_pc)
 );
 
 imem imem_inst (
     .addr(pc),
     .instr(instr)
 );
 //noi pc tu pc.v vao address cua imem.v , instr tu if_stage.v vao output cua imem.v
 
 always @(posedge clk) begin
    if (reset)
        $display("RESET active -> PC = %h", pc);
    else
        $display("Time=%0t | PC=%h | PC+4=%h | next_PC=%h | PCsel=%b | instr=%h",
          $time, pc, pc_plus4, next_pc, PCsel, instr);
end
 endmodule