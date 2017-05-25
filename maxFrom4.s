#-----------------------------
#
#  To compile: as -o maxFrom4.o maxFrom4.s
#  To link:    ld -o maxFrom4 maxFrom4.o
#  To run:     ./maxFrom4
#  DBG: 	as -gstabs -o maxFrom4.o maxFrom4.s
#		ld -o maxFrom4 maFrom4.o
#
#----------------------------------------------------------------
#RANDOM LIST
	.equ	fst, 	8
	.equ	snd, 	4
	.equ	thrd, 	2
	.equ	fourth, 9
	
.data

curr_max:
	.byte	0
	
	.text
	.global _start		# entry point
	
_start:
	MOVB	$fst,	%al
	MOVB	$snd,	%bl
	MOVB	$thrd,	%cl
	MOVB	$fourth,	%dl
	MOV	%al,	curr_max

	CMPB	curr_max,	%bl
	JA wieksze1

	JMP dalej1

wieksze1:
	MOV %bl,	curr_max

dalej1:
	CMPB	curr_max,	%cl
	JA wieksze2

	JMP dalej2

wieksze2:
	MOV %cl,	curr_max

dalej2:
	CMPB	curr_max,	%dl
	JA wieksze3

	JMP dalej3

wieksze3:
	MOV %dl,	curr_max

dalej3:
	MOV	$1, %eax	# exit function
	INT	$0x80		# system interrupt
	
