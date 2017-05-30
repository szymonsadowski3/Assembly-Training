  
#-----------------------------
#
#  To compile: as -o interlacerASM.o interlacerASM.s
#  To link:    ld -o interlacerASM interlacerASM.o
#  To run:     ./interlacerASM
#
#----------------------------------------------------------------
  .type fun_asm, @function
  .global fun_asm
  .text

##PROTOTYPE##
# char* fun(char* buf, char* a, char* b) {
#   int overall_len = strlen(a) + strlen(b);

#   int a_indicator = 0;
#   int b_indicator = 0;

#   for(int i = 0; i < overall_len; ++i) {
#     if(i % 2 == 0)
#       buf[i] = a[a_indicator++];
#     else
#       buf[i] = b[b_indicator++];
#   }

#   buf[overall_len] = '\0';

#   return buf;
# }

##ARGS##
#char* fun_asm(char* buf, char* a, char* b);
##rdi buf
##rsi a
##rdx b

fun_asm:
#DECLARATION:
  MOV $0,     %r9 #r9 = a_indicator
  MOV $0,     %r10 #r10 = b_indicator
  MOV $0,     %r8 #r8 = buff_indicator

  #MOV %rdi,   %r10 

#EXEC:
execut:
  CMP $0,     (%rsi, %r9, 1)

  JNE put_a

carry_b:

  CMP $0,     (%rdx, %r10, 1)

  JNE put_b

#AUX
CMP $0,     (%rsi, %r9, 1)
JNE put_a
#AUX

  JMP final

put_a:
  #MOV (%rsi, %r9, 1),   (%rdi, %r8, 1)
  MOVB (%rsi, %r9, 1),   %r11b
  MOVB %r11b,             (%rdi, %r8, 1)

  INC %r9
  INC %r8
  JMP carry_b

put_b:
  #MOV (%rdx, %r10, 1),   (%rdi, %r8, 1)
  MOVB (%rdx, %r10, 1),   %r11b
  MOVB %r11b,             (%rdi, %r8, 1)

  INC %r10
  INC %r8
  JMP execut

final:
  MOVB $0,   (%rdi, %r8, 1)
  MOV %rdi,   %rax
  RET




