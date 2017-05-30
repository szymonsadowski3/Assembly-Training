#-----------------------------
#
#  To compile: as -o greatestDiff.o greatestDiff.s
#  To link:    ld -o greatestDiff greatestDiff.o
#  To run:     ./greatestDiff
#  DBG: 	as -gstabs -o greatestDiff.o greatestDiff.s
#		ld -o greatestDiff greatestDiff.o
#
#----------------------------------------------------------------
	.text
	.type maxmin, @function
  	.global maxmin
	
maxmin:

mov $0,	%r12 #r12 is curr_min
mov $0,	%r13 #r13 is curr_max
mov $0,	%r14 #r13 is result

#MIN----------------------------
	MOV	%rdi,	%r12

	CMP	%r12,	%rsi
	JL mniejsze1

	JMP Mdalej1

mniejsze1:
	MOV %rsi,	%r12

Mdalej1:
	CMP	%r12,	%rdx
	JL mniejsze2

#ROWNE
	JMP Mdalej2

mniejsze2:
	MOV %rdx,	%r12

Mdalej2:
	CMP	%r12,	%rcx
	JL mniejsze3

	JMP min

mniejsze3:
	MOV %rcx,	%r12
#EOMIN------------------------------

#MAX----------------------------------
min:
	MOV	%rdi,	%r13

	CMP	%r13,	%rsi
	JG wieksze1

	JMP Wdalej1

wieksze1:
	MOV %rsi,	%r13

Wdalej1:
	CMP	%r13,	%rdx
	JG wieksze2

	JMP Wdalej2

wieksze2:
	MOV %rdx,	%r13

Wdalej2:
	CMP	%r13,	%rcx
	JG wieksze3

	JMP exit

wieksze3:
	MOV %rcx,	%r13
#EOMAX--------------------------------

exit:
	MOV	%r12,	%r10
	MOV	%r13,	%r11

	SUB	%r10,		%r11

	MOV	%r11,		%rax
inter:
	RET
