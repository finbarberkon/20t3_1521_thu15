# int main(void) {
main:

#   printf("Enter a number: ");
    la  $a0, prompt
    li  $v0, 4
    syscall

#   scanf("%d", &x);
    li  $v0, 5
    syscall
    move $t0, $v0

#   if (x > 46340) {
    ble $t0, 46340, else

#   printf("square too big for 32 bits\n");
    la  $a0, too_big
    li  $v0, 4
    syscall

    j end

#    } else {
else:
#        y = x * x;
    mul  $t1, $t0, $t0
#        printf("%d\n", y);
    move $a0, $t1
    li   $v0, 1
    syscall

end:

#    return 0;
    jr  $ra

# Store these strings in the data region
    .data
prompt:
    .asciiz "Enter a number: "
too_big:
    .asciiz "square too big for 32 bits\n"
