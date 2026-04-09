# CAII_RISCV_midtern

# DATAPATH

![alt text](/doc/ktmt2_midtern_datapath1.png)

![alt text](/doc/ktmt2_midtern_datapath2.png)

# CODE NAP VAO IMEM
## Tinh giai thua
lui x10, 0x10<br>
addi x1, x0, 5<br>
addi x2, x0, 1<br>
<br>
fact_loop:<br>
beq x1, x0, fact_done<br>
<br>
addi x3, x0, 0<br>
addi x4, x1, 0<br>
<br>
mul_loop:<br>
beq x4, x0, mul_done<br>
add x3, x3, x2<br>
addi x4, x4, -1<br>
jal x0, mul_loop<br>
<br>
mul_done:<br>
addi x2, x3, 0<br>
addi x1, x1, -1<br>
jal x0, fact_loop<br>
<br>
fact_done:<br>
sw x2, 0(x10)<br>

## Tinh Fibonacci
addi x4, x0, 5<br>
addi x5, x0, 0<br>
addi x6, x0, 1<br>
<br>
fib_loop:<br>
beq x4, x0, fib_done<br>
add x7, x5, x6<br>
addi x5, x6, 0<br>
addi x6, x7, 0<br>
addi x4, x4, -1<br>
jal x0, fib_loop<br>
<br>
fib_done:<br>
sw x6, 4(x10)<br>
<br>
end:<br>
jal x0, end<br>
<br>

# SO DO THIET KE KHOI IF STAGE

![alt text](</doc/KTMT2_Des_IFstage_RISCV (1) (1).jpg>)

# HUONG_DAN_COMPILE_VA_CHAY

iverilog -o output.vvp *.v

vvp output.vvp 

gtkwave wave.vcd