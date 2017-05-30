  
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
