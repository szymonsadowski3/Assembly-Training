# TASK
# Sprawdzic elementy z tablicy pod wzgledem wystepowania liczb z zakresu <0, 63> 
# Trzeba policzyc ile razy ktorys element sie pojawil (np dwojka pojawila sie 5 razy itd)
# Poprzez wskaznik max mamy zwrocic maxymalna liczbe wystapien i funkcja ma zwrocic wartosc w postaci ciagu 64 bitow (kazdy bit okresla wystapienie liczby odpowiadajacy itemu elementu, 1 - jesli wystepuje)
# MINIMUM - zliczanie wystepien i zwrocenie maksymalnej liczby wystapien (na 3)

.data

counters:  
    .long   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

count:                  # count of items
    .quad   ( . - counters ) >> 1

.type check_tab, @function
.global check_tab

.text

##PROTOTYPE##
#unsigned int check_tab(int* tab, int n, int *max);

##ARGS##
# rdi - tab
# rsi - n - size of tab
# rdx - max - pointer to max count

check_tab:
    ##DECLARATION
    MOV $0, %rcx #rcx = iterator
    MOV $0, %r11


lets_go:
    MOVL (%rdi, %rcx, 4), %r11d #r8 = wyciagniety element

    INCL counters(,%r11d,4) #counters[element]++

    INC %rcx
    CMP %rcx, %rsi

    JE break_this_loop
    JMP lets_go

break_this_loop:
    #Musimy znaleźć max w counters
    MOV $0, %rcx #zerujemy iterator
    MOV $0, %r8d #r8 = curr_max
    MOV $0, %r9 #r9 = elem

loop_body:
    MOVL counters(,%rcx,4), %r9d #r9 = wyciagniety element z counters
    CMP %r8d, %r9d

    JG  swap_max

loop_tail:
    INC %rcx
    CMP $64, %rcx

    JE finito

    JMP loop_body

swap_max:
    MOV %r9d, %r8d
    JMP loop_tail

finito:
    MOV %r8, %rax
    RET




