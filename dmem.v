module dmem (
    input clk,
    input mem_write,
    input mem_read,
    input [31:0] addr,
    input [31:0] write_data,
    output reg [31:0] read_data
);

reg [31:0] memory [0:255]; // 256 words of memory

always @(posedge clk) begin
    if(mem_write) memory[addr[9:2]] <= write_data; // Write data to memory on write signal
end

always @(*) begin
    if(mem_read) read_data = memory[addr[9:2]]; // Read data from memory on read signal
    else read_data = 0; // Default value when not reading
end

endmodule