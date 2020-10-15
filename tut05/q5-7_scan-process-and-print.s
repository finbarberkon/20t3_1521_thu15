main:
# Scan numbers in a loop
    li      $t0, 0                      # $t0 = 0
scanLoopStart:
    bge     $t0, 10, scanLoopEnd        # if ($t0 >= 10) goto scanLoopEnd

    li      $v0, 5
    syscall

    mul     $t1, $t0, 4
    sw      $v0, numbers($t1)

    addi    $t0, $t0, 1                 # i++
    j       scanLoopStart
scanLoopEnd:

# Check if numbers are negative, and if so add 42
    li      $t0, 0                      # $t0 = 0
negLoopStart:
    bge     $t0, 10, negLoopEnd        # if ($t0 >= 10) goto scanLoopEnd

    mul     $t1, $t0, 4
    lw      $t2, numbers($t1)

    bge     $t2, 0, skip

    addi    $t2, $t2, 42                #t2 += 42

    sw      $t2, numbers($t1)

skip:
    addi    $t0, $t0, 1                 # i++
    j       negLoopStart
negLoopEnd:

# Print numbers out in a loop
    li      $t0, 0                      # $t0 = 0

printLoopStart:
    bge     $t0, 10, printLoopEnd        # if ($t0 >= 10) goto scanLoopEnd

    mul     $t1, $t0, 4
    lw      $a0, numbers($t1)
    li      $v0, 1
    syscall

    li      $a0, '\n'
    li      $v0, 11
    syscall

    addi    $t0, $t0, 1                 # i++
    j       printLoopStart
printLoopEnd:

   jr   $ra

   .data
numbers:
   .word 0 0 0 0 0 0 0 0 0 0 	# int numbers[10] = {0};
   # .space 40 equivalent to above, but uninitialised
