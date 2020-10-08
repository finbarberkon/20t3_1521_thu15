# int main(void) {
main:
#     printf("Enter a number: ");
    la  $a0, prompt
    li  $v0, 4
    syscall

#     scanf("%d", &x);
    li  $v0, 5
    syscall
    move $t0, $v0

#     char *message = "small/big\n";
    la  $t1, sml_big
#     if (x <= 100) goto skip;
    ble $t0, 100, skip
#     if (x >= 1000) goto skip;
    bge $t0, 1000, skip

#     message = "medium";
    la  $t1, med

skip:
#     printf("%s", message);
    move $a0, $t1
    li   $v0, 4
    syscall

    jr $ra

    .data
prompt:
    .asciiz "Enter a number: "
sml_big:
    .asciiz "small/big\n"
med:
    .asciiz "medium"
