# Recursive maximum of array function

# Register usage:
#   - `a' is in $a0
#   - `length' is in $a1
#   - `first_element' is in $s0
#   - `max_so_far' is in $t0

# s0 & s1 used for a and first_element because they need
# to keep their value across recursive call

max:
    # save state onto stack
    addi  $sp, $sp, -8
    sw    $ra, 0($sp)
    sw    $s0, 4($sp)

    # TODO implement recursive max
    lw   $s0, ($a0)       # first_elem = a[0];
    bne  $a1, 1, skip1

    move $v0, $s0
    j    $ra
skip1:

    addi $a0, $a0, 4
    addi $a1, $a1, -1

    jal max

    ble $s0, $v0, skip2
    move $v0, $s0

skip2:

    # restore state from stack
    lw    $ra, 0($sp)
    lw    $s0, 4($sp)
    addi  $sp, $sp, 8

    jr    $ra


# some test code which calls max
main:
    addi  $sp, $sp, -4   # create stack frame
    sw    $ra, 0($sp)    # save return address

    la    $a0, array
    li    $a1, 10
    jal   max           # max(a0, a1)

    move  $a0, $v0      # printf ("%d", v0)
    li    $v0, 1
    syscall

    li    $a0, '\n'      # printf("%c", '\n');
    li    $v0, 11
    syscall

                        # clean up stack frame
    lw    $ra, 0($sp)    # restore $ra
    addi  $sp, $sp, 4    # restore sp

    li    $v0, 0          # return 0
    jr    $ra


.data
array:
    .word 1 2 3 4 5 6 4 3 2 1
