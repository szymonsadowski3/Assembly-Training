//to compile gcc -g -Wall -Wextra sadowski.c sadowski.s

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned int check_tab(int* tab, int n, int *max);


int main()
{
    int tab[] = {0, 5, 5, 2, 5, 2, 6, 4, 1, 5};
    int len = 10;

    int* max = malloc(sizeof(unsigned int));

    unsigned int ret = check_tab(tab, len, max); 

    printf("%d %d\n", ret, *max);

    return 0;
}