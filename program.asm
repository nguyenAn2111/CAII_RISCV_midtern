addi x2, x0, 20
add  x3, x1, x2
lui  x4, 0x10
sw   x3, 0(x4)
lw   x5, 0(x4)
addi x6, x0, 30
beq  x5, x6, success
addi x7, x0, -1
jal  x0, end
success:
addi x7, x0, 1
end:
jal  x0, end