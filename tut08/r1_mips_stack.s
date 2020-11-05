# A few functions to illustrate the different things that need to be saved on
# the stack, and when to use each

main:
    # What do we need to save on the stack?
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    li   $a0, 1
    li   $a1, 2
    jal  func1

    move $a0, $v0
    jal  func3

    move $a0, $v0       # printf("%d", z);
    li   $v0, 1
    syscall

    li   $a0, '\n'      # printf("%c", '\n');
    li   $v0, 11
    syscall

    # What do we need to recover from the stack?
    lw   $ra, 0($sp)
    addi $sp, $sp, 4

    li   $v0, 0         # return 0 from function main
    jr   $ra            # return from function main


func1:
    # What do we need to save on the stack?
    addi $sp, $sp, -16
    sw   $ra, 0($sp)
    sw   $s0, 4($sp)
    sw   $s1, 8($sp)
    sw   $s2, 12($sp)

    li   $s0, 10
    add  $s1, $s0, $s1
    mul  $s2, $s1, $s0

    move $a0, $s2
    jal  func2

    # What do we need to recover from the stack?
    lw   $ra, 0($sp)
    lw   $s0, 4($sp)
    lw   $s1, 8($sp)
    lw   $s2, 12($sp)
    addi $sp, $sp, 16

    jr  $ra


func2:
    # What do we need to save on the stack?
    addi $sp, $sp, -16
    sw   $s3, 0($sp)
    sw   $s0, 4($sp)
    sw   $s1, 8($sp)
    sw   $s2, 12($sp)

    li   $s0, 10
    add  $s1, $s0, $s1
    mul  $s2, $s1, $s0
    mul  $s3, $s2, $s1

    move $v0, $s3

    # What do we need to recover from the stack?
    lw   $s3, 0($sp)
    lw   $s0, 4($sp)
    lw   $s1, 8($sp)
    lw   $s2, 12($sp)
    addi $sp, $sp, 16

    jr   $ra


func3:
    # What do we need to save on the stack?

    move $t0, $a0
    add  $t1, $t0, $t1
    mul  $t2, $t1, $t0
    mul  $t3, $t2, $t1

    move $v0, $t3

    # What do we need to recover from the stack?

    jr   $ra
