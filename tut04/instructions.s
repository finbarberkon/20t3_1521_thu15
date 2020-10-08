# addition
    add     Rd, Rs, Rt      # Rd = Rs + Rt   (signed)
    addu    Rd, Rs, Rt      # Rd = Rs + Rt   (unsigned)
    addi    Rd, Rs, Imm     # Rd = Rs + Imm  (signed)

# subtraction
    sub     Rd, Rs, Rt      # Rd = Rs - Rt   (signed)
    subu    Rd, Rs, Rt      # Rd = Rs - Rt   (unsigned)

# division
    div     Rd, Rs, Rt      # Rd = Rs / Rt   (int division, signed)
    divu    Rd, Rs, Rt      # Rd = Rs / Rt   (int division, unsigned)

# modulo
    rem     Rd, Rs, Rt      # Rd = Rs % Rt   (modulo, signed)
    remu    Rd, Rs, Rt      # Rd = Rs % Rt   (modulo, unsigned)

# multiply
    mul     Rd, Rs, Rt      # Rd = Rs * Rt   (signed)

# bitwise
    and     Rd, Rs, Rt      # Rd = Rs & Rt
    and     Rd, Rs, Imm     # Rd = Rs & Imm
    neg     Rd, Rs          # Rd = ~ Rs
    nor     Rd, Rs, Rt      # Rd = !(Rs | Rt)
    not     Rd, Rs          # Rd = !Rs
    or      Rd, Rs, Rt      # Rd = Rs | Rt
    ori     Rd, Rs, Imm     # Rd = Rs | Imm
    xor     Rd, Rs, Rt      # Rd = Rs ^ Rt
    xori    Rd, Rs, Imm     # Rd = Rs ^ Imm

# bitshift
    sll     Rd, Rt, Imm     # Rd = Rt << Imm
    sllv    Rd, Rt, Rs      # Rd = Rt << Rs
    srl     Rd, Rt, Imm     # Rd = Rt >> Imm
    srlv    Rd, Rt, Rs      # Rd = Rt >> Rs

# assign aka '='
    move    Rd, Rs          # Rd = Rs

# loading (from memory)
    la      Rd, Addr        # Rd = Addr
    li      Rd, Imm         # Rd = Imm
    lb      Rd, Addr        # Rd = byte at Mem[Addr]   (sign extended, Addr could be Label(Rt))
    lw      Rd, Addr        # Rd = word at Mem[Addr]   (Addr could be Label(Rt))

# saving (to memory)
    sb      Rs, Addr        # Mem[Addr] = Rs   (sign extended, Addr could be Label(Rt))
    sw      Rs, Addr        # Mem[Addr] = Rs   (Addr could be Label(Rt))

# branching (often used for if statements)
    beq     Rs, Rt, Label   # branch to Label if Rs=Rt                  (signed)
    beqz    Rs, Label       # branch to Label if Rs=0                   (signed)
    bge     Rs, Rt, Label   # branch to Label if Rs≥Rt                  (signed)
    bgez    Rs, Label       # branch to Label if Rs≥0                   (signed)
    bgezal  Rs, Label       # branch to Label and and $ra=PC+8 if Rs≥0  (signed)
    bgt     Rs, Rt, Label   # branch to Label if Rs>Rt                  (signed)
    bgtu    Rs, Rt, Label   # branch to Label if Rs>Rt                  (unsigned)
    bgtz    Rs, Label       # branch to Label if Rs>0                   (signed)
    blt     Rs, Rt, Label   # branch to Label if Rs<Rt                  (signed)
    bltu    Rs, Rt, Label   # branch to Label if Rs<Rt                  (unsigned)
    ble     Rs, Rt, Label   # branch to Label if Rs≤Rt                  (signed)
    blez    Rs, Label       # branch to Label if Rs≤0                   (signed)
    bltz    Rs, Label       # branch to Label if Rs<0                   (signed)
    bltzl   Rs, Label       # branch to Label and $ra=PC+8 if Rs<0      (signed)
    bne     Rs, Rt, Label   # branch to Label if Rs!=Rt
    bnez    Rs, Label       # branch to Label if Rs!=0

# jumping (often used for calling functions)
    j       Label           # jump to Label   (PC = Label)
    jal     Label           # jump to Label and Link   ($ra = PC+8; PC = Label)
    jr      Rs              # jump to location in Rs
    jalr    Rs              # jump to location in Rs and Link   ($ra = PC+8; PC = Label)

# syscalls (for things like printing and scanning)
    syscall                 # invoke system service; service given in $v0 
