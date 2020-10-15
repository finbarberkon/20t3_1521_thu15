arithetic:
    add     Rd, Rs, Rt      # Rd = Rs + Rt   (signed)
    addu    Rd, Rs, Rt      # Rd = Rs + Rt   (unsigned)
    addi    Rd, Rs, Imm     # Rd = Rs + Imm  (signed)
    sub     Rd, Rs, Rt      # Rd = Rs - Rt   (signed)
    subu    Rd, Rs, Rt      # Rd = Rs - Rt   (unsigned)
    div     Rd, Rs, Rt      # Rd = Rs / Rt   (int division, signed)
    divu    Rd, Rs, Rt      # Rd = Rs / Rt   (int division, unsigned)
    rem     Rd, Rs, Rt      # Rd = Rs % Rt   (modulo, signed)
    remu    Rd, Rs, Rt      # Rd = Rs % Rt   (modulo, unsigned)
    mul     Rd, Rs, Rt      # Rd = Rs * Rt   (signed)

bitwise:
    and     Rd, Rs, Rt      # Rd = Rs & Rt
    and     Rd, Rs, Imm     # Rd = Rs & Imm
    neg     Rd, Rs          # Rd = ~ Rs
    nor     Rd, Rs, Rt      # Rd = !(Rs | Rt)
    not     Rd, Rs          # Rd = !Rs
    or      Rd, Rs, Rt      # Rd = Rs | Rt
    ori     Rd, Rs, Imm     # Rd = Rs | Imm
    xor     Rd, Rs, Rt      # Rd = Rs ^ Rt
    xori    Rd, Rs, Imm     # Rd = Rs ^ Imm
    sll     Rd, Rt, Imm     # Rd = Rt << Imm
    sllv    Rd, Rt, Rs      # Rd = Rt << Rs
    srl     Rd, Rt, Imm     # Rd = Rt >> Imm
    srlv    Rd, Rt, Rs      # Rd = Rt >> Rs

register:
    move    Rd, Rs          # Rd = Rs
    mfhi    Rd              # Rd = Hi
    mflo    Rd              # Rd = Lo
    la      Rd, Addr        # Rd = Addr
    li      Rd, Imm         # Rd = Imm
    lui     Rd, Imm         # Rd[0..15] = 0, Rd[16..31] = Imm
    lb      Rd, Addr        # Rd = byte at Mem[Addr]   (sign extended, Addr could be Label(Rt))
    lw      Rd, Addr        # Rd = word at Mem[Addr]   (Addr could be Label(Rt))
    sb      Rs, Addr        # Mem[Addr] = Rs   (sign extended, Addr could be Label(Rt))
    sw      Rs, Addr        # Mem[Addr] = Rs   (Addr could be Label(Rt))
    slt     Rd, Rs, Rt      # Rd = 1 if Rs<Rt, Rd = 0 otherwise   (signed)
    slti    Rd, Rs, Imm     # Rd = 1 if Rs<Imm, Rd = 0 otherwise   (signed)
    sltu    Rd, Rs, Rt      # Rd = 1 if Rs<Rt, Rd = 0 otherwise   (unsigned)

branches:
    beq     Rs, Rt, Label   # branch to Label if Rs=Rt   (signed)
    beqz    Rs, Label       # branch to Label if Rs=0   (signed)
    bge     Rs, Rt, Label   # branch to Label if Rs≥Rt   (signed)
    bgez    Rs, Label       # branch to Label if Rs≥0   (signed)
    bgezal  Rs, Label       # branch to Label and and $ra=PC+8 if Rs≥0   (signed)
    bgt     Rs, Rt, Label   # branch to Label if Rs>Rt   (signed)
    bgtu    Rs, Rt, Label   # branch to Label if Rs>Rt   (unsigned)
    bgtz    Rs, Label       # branch to Label if Rs>0   (signed)
    blt     Rs, Rt, Label   # branch to Label if Rs<Rt   (signed)
    bltu    Rs, Rt, Label   # branch to Label if Rs<Rt   (unsigned)
    ble     Rs, Rt, Label   # branch to Label if Rs≤Rt   (signed)
    blez    Rs, Label       # branch to Label if Rs≤0   (signed)
    bltz    Rs, Label       # branch to Label if Rs<0   (signed)
    bltzl   Rs, Label       # branch to Label and $ra=PC+8 if Rs<0   (signed)
    bne     Rs, Rt, Label   # branch to Label if Rs≠Rt
    bnez    Rs, Label       # branch to Label if Rs≠0

jumping:
    j       Label           # jump to Label   (PC = Label)
    jal     Label           # jump to Label and Link   ($ra = PC+8; PC = Label)
    jr      Rs              # jump to location in Rs
    jalr    Rs              # jump to location in Rs and Link   ($ra = PC+8; PC = Label)

syscall:
    syscall                 # invoke system service; service given in $v0
