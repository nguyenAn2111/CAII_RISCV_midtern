lui x10, 0x10
addi x1, x0, 5
addi x2, x0, 1

fact_loop:
beq x1, x0, fact_done

addi x3, x0, 0
addi x4, x1, 0

mul_loop:
beq x4, x0, mul_done
add x3, x3, x2
addi x4, x4, -1
jal x0, mul_loop

mul_done:
addi x2, x3, 0
addi x1, x1, -1
jal x0, fact_loop

fact_done:
sw x2, 0(x10)


addi x4, x0, 5
addi x5, x0, 0
addi x6, x0, 1

fib_loop:
beq x4, x0, fib_done
add x7, x5, x6
addi x5, x6, 0
addi x6, x7, 0
addi x4, x4, -1
jal x0, fib_loop

fib_done:
sw x6, 4(x10)

end:
jal x0, end