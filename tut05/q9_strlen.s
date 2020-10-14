main:


   # print $t1
   li    $v0, 1
   move  $a0, $t1
   syscall

   # return 0
   jr    $ra

   .data
string:
   .asciiz "...."
