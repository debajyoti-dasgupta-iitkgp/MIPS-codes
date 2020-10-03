#============================
#   Code By : Little Angel  #
#============================
.data
newline:
    .asciiz "\n"
msg1:
    .asciiz "Enter first number: "
msg2:
    .asciiz "Enter second number: "
output:
    .asciiz "Required gcd: "

    .text
    .globl main

main: 
    la $a0, msg1
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $a1, $v0

    la $a0, msg2
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $a0, $v0

gcd:    
    sltu $t0, $a0, $a1
    bne $t0, $zero, swap

    beq $a1, $zero, print
        
    sub $a0, $a0, $a1
    j gcd

swap:
    move $s0, $a0
    move $a0, $a1
    move $a1, $s0
    j gcd

print:    
    move $s0, $a0

    la $a0, output
    li $v0, 4
    syscall

    move $a0, $s0
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

Exit:
    li $v0, 10
    syscall

