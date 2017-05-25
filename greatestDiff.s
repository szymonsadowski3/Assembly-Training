#-----------------------------
#
#  To compile: as -o greatestDiff.o greatestDiff.s
#  To link:    ld -o greatestDiff greatestDiff.o
#  To run:     ./greatestDiff
#  DBG: 	as -gstabs -o greatestDiff.o greatestDiff.s
#		ld -o greatestDiff greatestDiff.o
#
#----------------------------------------------------------------
#RANDOM LIST
	.equ	fst, 	8
	.equ	snd, 	4
	.equ	thrd, 	19
	.equ	fourth, 9
	
.data

curr_min:
	.byte	0

curr_max:
	.byte	0

result:
	.byte	0
	
	.text
	.global _start		# entry point
	
_start:
	MOVB	$fst,	%al
	MOVB	$snd,	%bl
	MOVB	$thrd,	%cl
	MOVB	$fourth,	%dl

#MIN----------------------------
	MOV	%al,	curr_min

	CMPB	curr_min,	%bl
	JB mniejsze1

	JMP Mdalej1

mniejsze1:
	MOV %bl,	curr_min

Mdalej1:
	CMPB	curr_min,	%cl
	JB mniejsze2

#ROWNE
	JMP Mdalej2

mniejsze2:
	MOV %cl,	curr_min

Mdalej2:
	CMPB	curr_min,	%dl
	JB mniejsze3

	JMP min

mniejsze3:
	MOV %dl,	curr_min
#EOMIN------------------------------

#MAX----------------------------------
min:
	MOV	%al,	curr_max

	CMPB	curr_max,	%bl
	JA wieksze1

	JMP Wdalej1

wieksze1:
	MOV %bl,	curr_max

Wdalej1:
	CMPB	curr_max,	%cl
	JA wieksze2

	JMP Wdalej2

wieksze2:
	MOV %cl,	curr_max

Wdalej2:
	CMPB	curr_max,	%dl
	JA wieksze3

	JMP exit

wieksze3:
	MOV %dl,	curr_max
#EOMAX--------------------------------

exit:
	MOV	curr_min,	%sil
	MOV	curr_max,	%dil

	SUB	%sil,		%dil

	MOV	%dil,		result
inter:
	MOV	$1, %eax	# exit function
	INT	$0x80		# system interrupt
	
