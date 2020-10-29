change:
    # params:    $a0 = nrows
    #            $a1 = ncols
    #            $a2 = &M
    #            $a3 = factor
    # registers: $s0 = row
    #            $s1 = col

    # save the state onto the stack
    addi $sp, $sp, -12
    sw   $ra, 0($sp)
    sw   $s0, 4($sp)
    sw   $s1, 8($sp)

    li   $s0, 0           # row = 0

loop1:
    bge  $s0, $a0, end1   # while (row < nrows)
    li   $s1, 0           # col = 0

loop2:
   	bge  $s1, $a1, end2   # while (col < ncols)

    # TODO implement multiplication

   	addi $s1, $s1, 1      # col++
   	j    loop2

end2:
   	addi $s0, $s0, 1      # row++
   	j    loop1

end1:

   	# restore state from stack
   	lw   $ra, 0($fp)
   	lw   $s0, 4($fp)
   	lw   $s1, 8($fp)
   	addi $sp, $sp, 12

	.data
M:  .word 1, 2, 3, 4
    .word 3, 4, 5, 6
    .word 5, 6, 7, 8
