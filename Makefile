PC ?= 00000000


run:
	iverilog -o output.vvp src/*.v testbench/testbench_if_stage.v
	vvp output.vvp +pc=$(PC)

run_unit:
	iverilog -o unit.vvp src/*.v testbench/unit_test_if_stage.v
	vvp unit.vvp +pc=$(PC)

wave:
	gtkwave wave.vcd

clean:
	rm -f *.vvp wave.vcd