module imem (
    input [31:0] addr,
    output [31:0] instr
);
reg [31:0] memory [0:255]; // 256 words of memory

initial begin
    $readmemh("program/program.mem", memory); 
end

assign instr = memory[addr[9:2]]; // Assuming word-aligned addresses (4 bytes per instruction)

endmodule