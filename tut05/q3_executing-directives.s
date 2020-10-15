aa:  .word 42   # 0x10010000
bb:  .word 666  # 0x10010004
cc:  .word 1    # 0x10010008
     .word 3    # 0x1001000C
     .word 5    # 0x10010010
     .word 7    # 0x10010014

# What address will be calculated, and what value will be loaded into register
# $t0, after each of the following statements (or pairs of statements)?

la   $t0, aa
# Address:  0x10010000
# Value:    0x10010000

lw   $t0, bb
# Address:  0x10010004
# Value:    666

lb   $t0, bb
# Address:  0x10010004
# Value:    0

lw   $t0, aa+4
# Address:  0x10010004
# Value:    666

la   $t1, cc
lw   $t0, ($t1)
# Address:  0x10010008
# Value:    1

la   $t1, cc
lw   $t0, 8($t1)
# Address:  0x10010010
# Value:    5

li   $t1, 8
lw   $t0, cc($t1)
# Address:  0x10010010
# Value:    5

la   $t1, cc
lw   $t0, 2($t1)
# Address:  0x1001000A
# Value:    CRASH
