main:
    la   $a0, prompt
    li   $v0, 4
    syscall

    li   $v0, 5
    syscall
    move $t0, $v0

    mul  $t1, $t0, $t0

    move $a0, $t1
    li   $v0, 1
    syscall

    li   $a0, '\n'
    li   $v0, 11
    syscall

    jr  $ra

    .data
prompt:
    .asciiz "Enter a number: "
