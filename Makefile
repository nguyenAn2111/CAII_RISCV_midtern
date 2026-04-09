run:
	iverilog -o output.vvp src/*.v testbench/*.v
	vvp output.vvp

wave:
	gtkwave wave.vcd