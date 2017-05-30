#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define new_max(x,y) ((x) >= (y)) ? (x) : (y)

int max_ind_asm(int a, int b, int c, int d);

int count(int val, int *arr, int size){
    int howMany = 0;
    for (int i=0; i < size; i++) {
        if (arr[i] == val)
            ++howMany;
    }
    return howMany;
}

int max_ind(int a, int b, int c, int d) {
	int tab[] = {a,b,c,d};
	int max = a;
	int max_index = 0;

	for(int i = 0; i < 4 ; ++i) {
		if(tab[i]>max) {
			max = tab[i];
			max_index = i;
		}
	}

	if (count(max, tab, 4)>1)
		return 0;

	return max_index + 1;
}

int main(void) {
    printf("C func:%d\n", max_ind(8, 15, 6, 23));
	printf("C func:%d\n", max_ind(42 , 23 , 16, 15));
	printf("C func:%d\n", max_ind(23 , 23 , 16, 15));

	printf("AS func:%d\n", max_ind_asm(8, 15, 6, 23));
	printf("AS func:%d\n", max_ind_asm(42 , 23 , 16, 15));
	printf("AS func:%d\n", max_ind_asm(23 , 23 , 16, 15));

 //    printf("Asm func:\n%d\n", max_ind_asm(8, 15, 6, 23));
	// printf("CASm func:\n%d\n", max_ind_asm(42 , 23 , 16, 15));
	// printf("%s\n", generate_str(testStr, 'b', 3, 1));

	// printf("Asm func:\n%s\n", generate_str_asm(testStr, 'a', 7, 0));
	// printf("%s\n", generate_str_asm(testStr, 'b', 3, 1));
	return 0;
}

//to compile: gcc -Wall -Wextra maxInd.c maxIndAsm.s