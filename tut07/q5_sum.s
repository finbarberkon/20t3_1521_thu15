# sum 4 numbers using function calls
# note use of stack to save $ra in main
# and $ra $a0, $a1, $s0 in sum2

main:
    addi $sp, $sp, -4   # move stack pointer down to make room
    sw   $ra, 0($sp)    # save $ra on $stack

    li   $a0, 11        # sum4(11, 13, 17, 19)
    li   $a1, 18
    li   $a2, 17
    li   $a3, 19
    jal  sum4

    move $a0, $v0       # printf("%d", z);
    li   $v0, 1
    syscall

    li   $a0, '\n'      # printf("%c", '\n');
    li   $v0, 11
    syscall

    lw   $ra, 0($sp)    # recover $ra from $stack
    addi $sp, $sp, 4    # move stack pointer back up to what it was when main called

    li   $v0, 0         # return 0 from function main
    jr   $ra            # return from function main


sum4:
    # Save state onto the stack
    addi $sp, $sp, -16
    sw   $ra, 0($sp)    # Save return addres because we will call a funct
    sw   $s0, 4($sp)    # Save all the $s? registers we'll use
    sw   $s1, 8($sp)
    sw   $s2, 12($sp)

    move $s0, $a2       # Save our third and fourth args for later use
    move $s1, $a3       # so they don't get lost during sum2

    # Call sum2 for first two arguments (they are already in $a0, $a1)
    jal sum2

    # Save the return value from our first call to sum2 so it doesn't get lost
    move $s2, $v0

    # Move our third and fourth arguments (saved above) into the argument
    # registers for our second call to sum2
    move $a0, $s0
    move $a1, $s1
    jal sum2

    # Finally move the results from our first and second calls to sum2 into
    # the argument registers for our final call
    move $a0, $s2
    move $a1, $v0
    jal sum2

    # Restore state from the stack
    lw   $ra, 0($sp)
    lw   $s0, 4($sp)
    lw   $s1, 8($sp)
    lw   $s2, 12($sp)
    addi $sp, $sp, 16

    # $v0 is already set from our last sum2 call, so
    # we can leave it in $v0 when we return
    j   $ra

# sum2 doesn't call other functions
# so it doesn't need to save any registers
sum2:
    add  $v0, $a0, $a1
    jr   $ra            # return argument + argument 2

