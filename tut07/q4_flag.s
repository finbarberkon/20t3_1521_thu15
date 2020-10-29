# row in $t0
# col in $t1

main:
    li   $t0, 0         # int row = 0

loop1:
    bge  $t0, 6, end1	# while (row < 6) {
    li   $t1, 0         # int col = 0

loop2:
   beq  $t1, 12, end2   # while (col < 12) {

   mul  $t2, $t0, 12    # 12 elements per row

   add  $t4, $t3, $t2
   lw   $a0, flag($t4)
   li   $v0, 11
   syscall

   addi $t1, $t1, 1    # col++
   j    loop2

end2:
   li   $a0, '\n'      # printf("%c", '\n')
   li   $v0, 11
   syscall

   addi $t0, $t0, 1    # row++
   j    loop1

end1:

    li  $v0, 0         # return 0
    jr  $ra

.data
flag:
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
