    .data
v0: .space 4    # int v0;
v1: .word 42    # int v1 = 42;
v2: .space 1    # char v2;
v3: .byte 'a'   # char v3 = 'a';
    .space 2
v4: .space 8    # double v4;
v5: .space 80   # int v5[20];
v6: .space 200  # int v6[10][5];
v7: .space 8    # struct { int x; int y; } v7;
v8: .space 32   # struct { int x; int y; } v8[4];
v9: .space 16   # struct { int x; int y; } *v9[4]; 
