# int main(void) {
main:
#     int x = 24;
    li  $t0, 24
loop:
#     if (x >= 42) goto end;
    bge $t0, 42, end
#     printf("%d\n", x);
    move $a0, $t0
    li  $v0, 1
    syscall

    li  $a0, '\n'
    li  $v0, 11
    syscall

#     x = x + 3;
    addi $t0, $t0, 3
#     goto loop:
    j loop
end:
    jr $ra
