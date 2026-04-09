module mux2 (
    input [31:0] a,
    input [31:0] b,
    input sel,
    output [31:0] y
);

assign y = sel ? b : a; // If sel is 1, output b; otherwise, output a
endmodule