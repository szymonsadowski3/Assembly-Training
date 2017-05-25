#-----------------------------
#
#  To compile: as -o minFrom4.o minFrom4.s
#  To link:    ld -o minFrom4 minFrom4.o
#  To run:     ./minFrom4
#
#----------------------------------------------------------------
#RANDOM LIST
	.equ	fst, 	8
	.equ	snd, 	4
	.equ	thrd, 	2
	.equ	fourth, 9
	
.data

curr_min:
	.byte	8
	
	.text
	.global _start		# entry point
	
_start:
	MOVB	$fst,	%al
	MOVB	$snd,	%bl
	MOVB	$thrd,	%cl
	MOVB	$fourth,	%dl
	MOV	%al,	curr_min

	CMPB	curr_min,	%bl
	JB mniejsze1

#ROWNE
	JMP dalej1

mniejsze1:
	MOV %bl,	curr_min

dalej1:
	CMPB	curr_min,	%cl
	JB mniejsze2

#ROWNE
	JMP dalej2

mniejsze2:
	MOV %cl,	curr_min

dalej2:
	CMPB	curr_min,	%dl
	JB mniejsze3

#ROWNE
	JMP dalej3

mniejsze3:
	MOV %dl,	curr_min

dalej3:

	MOV	$1, %eax	# exit function
	INT	$0x80		# system interrupt
	
