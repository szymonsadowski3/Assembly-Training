  
#-----------------------------
#
#  To compile: as -o maxIndAsm.o maxIndAsm.s
#  To link:    ld -o maxIndAsm maxIndAsm.o
#  To run:     ./maxIndAsm
#
#----------------------------------------------------------------
  .type max_ind_asm, @function
  .global max_ind_asm
  .text

##ARGS##
#int max_ind_asm(int a, int b, int c, int d);
##rdi a
##rsi b
##rdx c
##rcx d

max_ind_asm:
#DECLARATION:
  MOV %rdi,  %r8 # r8 = %r8
  MOV $1,  %r9 # r9 = max_ind

  CMP  %r8, %rsi
  JA wieksze1

  JMP dalej1

wieksze1:
  MOV %rsi,  %r8
  MOV $2,  %r9

dalej1:
  CMP  %r8, %rdx
  JA wieksze2

  JMP dalej2

wieksze2:
  MOV %rdx,  %r8
  MOV $3,  %r9

dalej2:
  CMP  %r8, %rcx
  JA wieksze3

  JMP dalej3

wieksze3:
  MOV %rcx,  %r8
  MOV $4,  %r9

dalej3:
check1:
  CMP $1,  %r9
  JNE proceed1
  JMP check2
proceed1:
  CMP %r8, %rdi
  JE retZero

check2:
  CMP $2, %r9
  JNE proceed2
  JMP check3
proceed2:
  CMP %r8, %rsi
  JE retZero

check3:
  CMP $3, %r9
  JNE proceed3
  JMP check4
proceed3:
  CMP %r8, %rdx
  JE retZero

check4:
  CMP $4, %r9
  JNE proceed4
  JMP endofthis
proceed4:
  CMP %r8, %rcx
  JE retZero


endofthis:
  MOV %r9, %rax  # exit function
  ret


retZero:
  MOV $0, %rax  # exit function
  ret


