    .data               # Address      Value
a:  .word   42          # 0x10000020 = 42
b:  .space  4           # 0x10000024 = ??
c:  .asciiz "abcde"     # 0x10000028 = 'a''b''c''d''e''\0'
    .align  2           # 0x1000002C = ?? FIGURE THIS OUT
d:  .byte   1, 2, 3, 4  # 0x10000030 = 1, 2, 3, 4 (as bytes)
e:  .word   1, 2, 3, 4  # 0x10000034 = 1, 2, 3, 4 (as words)
f:  .space  1           # 0x10000044 = ??
