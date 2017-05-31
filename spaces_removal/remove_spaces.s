.type remove_spaces_asm, @function
.global remove_spaces_asm

.equ diff, 'A' - 'a'

.text

##PROTOTYPE##
#void remove_spaces_asm(char* str);

##ARGS##
# rdi - str /char array

##IMPL
# void usun_spacje(char* str) {
# 	int current_pos = 0;
# 	for (int i = 0; i < strlen(str); ++i) {
# 		if(str[i]!=' '){
# 			str[current_pos] = str[i];
# 			current_pos++;
# 		}
# 	}
# 	str[current_pos] = '\0';
# }

# 2 arg - rsi 
# 3 arg - rdx
# 4 arg - rcx
# 5 arg - r8
# 6 arg - r9

remove_spaces_asm:
	##DECLARATIONS##:
	MOV $0,	%rdx #rdx = current_pos
	MOV $0,	%rcx #rcx = i

loop_body:
    MOVB (%rdi, %rcx, 1), %r8b

    CMP $0, %r8b
    JE  time_to_go

    CMP $(' '), %r8b
    JNE replacement

loop_tail:
    INC %rcx
    JMP loop_body

replacement:
    CMP $0, %rsi
    JE  stand_repl
    JMP upper_repl

stand_repl:
    MOVB %r8b, (%rdi, %rdx, 1)
    INC %rdx

    JMP loop_tail

upper_repl:
    ADD $diff,  %r8b
    MOVB %r8b, (%rdi, %rdx, 1)
    INC %rdx

    JMP loop_tail

time_to_go:
    MOVB $0, (%rdi, %rdx, 1)
    MOV $0, %rax
    RET
