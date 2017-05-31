.type suma_asm, @function
.global suma_asm
.text

##PROTOTYPE##
#int suma(int** wsk, int bok)

##ARGS##
# rdi - wsk 2d array
# rsi - square len

##IMPL
# int suma(int** wsk, int bok) {
#   int suma = 0;
#   for(int i = 0; i < bok; ++i)
#       suma += wsk[i][i];
#   return suma;
# }

#3 arg - rdx
# 4 arg - rcx
# 5 arg - r8
# 6 arg - r9

suma_asm:
	##DECLARATIONS##:
	MOV $0,	%rdx #rdx = suma
	MOV $0,	%rcx #rcx = i

loop_body:

	MOV (%rdi, %rcx, 8),	%r8 #dereferencja
	ADD	(%r8, %rcx, 4),	%rdx

	INC %rcx
	CMP %rcx,	%rsi
	JE break_suma
	JMP loop_body

break_suma:
	MOV %rdx,	%rax
	RET
