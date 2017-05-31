  .type max_1_ind_asm, @function
  .global max_1_ind_asm
  .text

max_1_ind_asm:
  ##PROTOTYPE##
    #   long long max_1_ind_asm(
    #   long long* tab,
    #   long long n,
    #   long long* even_count,
    #   long long* neg_count
    # );
    
  ##ARGS##
    #tab - tablica = rdi
    #n = tab size = rsi
    #even_count = rdx
    #neg_count = rcx

  ##RETURN##
    #max 1s in bin repr. = rax

  ## Aval

    # - r8,r9,r10,r11
    # - rax
    # - rsp

  ##DECLARATION:
    MOV $0, %r8 #iterator
    MOV $0, %r9 #even_counter
    MOV $0, %r10 #neg_counter
    
  ##EXEC
  lets_go:
    CMP $0,             (%rdi, %r8, 8)
    JL  negative_elem_spotted

    ##CHECK PARITY##
  parity:
    MOV (%rdi, %r8, 8),           %r11
    AND $1,             %r11

    CMP $0,             %r11
    JE  even_elem_spotted

  continue_loop:
    INC %r8
    CMP %r8,            %rsi
    JE  end_of_loop

    JMP lets_go

  negative_elem_spotted:
    INC %r10
    JMP continue_loop

  even_elem_spotted:
    INC %r9
    JMP continue_loop

  end_of_loop:
    MOV %r9,            (%rdx)
    MOV %r10,           (%rcx)

  exit:
    MOV $0,             %rax
    RET

