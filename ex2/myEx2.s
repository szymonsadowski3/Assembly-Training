  
#-----------------------------
#
#  To compile: as -o myEx2.o myEx2.s
#  To link:    ld -o myEx2 myEx2.o
#  To run:     ./myEx2
#
#----------------------------------------------------------------
  .type generate_str_asm, @function
  .global generate_str_asm
  .text

  # int i;
  # if(inc) inc = 1;
  # for(i = 0; i < n; ++i) {
  #   s[i] = c;
  #   c += inc;
  # }
  # s[n] = '\0';
  # return s;

generate_str_asm:
  CMP $0, %rcx
  JE dont_increment

  increment:
    MOV %rdi,   %r15 #przechowanie rsi
    MOV $0,     %r10 #r10 to iterator dla n
  increment_loop:
    MOV %sil,   (%rdi, %r10, 1)

    INC %r10
    INC %sil

    CMP %rdx, %r10
    JE break_increment

    JMP increment_loop

  break_increment:
    MOVB $0, (%rdi, %r10, 1)
    MOV %r15,   %rax
    RET

  dont_increment:
    MOV %rdi,   %r15 #przechowanie rsi
    MOV $0,     %r10 #r10 to iterator dla n
  dont_increment_loop:
    MOV %sil,   (%rdi, %r10, 1)

    INC %r10

    CMP %rdx, %r10
    JE break_increment

    JMP dont_increment_loop

#char* generate_str(char* s, int c, int n, int inc)
#s - string /rdi
#c - znak /rsi
#n - powtorzenia /rdx
#inc - bool /rcx


#   Ma generować stringa z lożonego z n znaków c. Jeśli inc = 0 znaki maja być takie same, w przeciwnym przypadku
# znaki maja sie zwiekszać o 1. s jest buforem do zapisania wygenerowanego stringa, miejsce na niego powinno
# być zarezerwowane w programie w C.
# (protip: use malloc for greater good.)
