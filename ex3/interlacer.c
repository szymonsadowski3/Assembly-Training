#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define new_max(x,y) ((x) >= (y)) ? (x) : (y)

char* fun_asm(char* buf, char* a, char* b);

char* fun(char* buf, char* a, char* b) {
	int overall_len = strlen(a) + strlen(b);
    int i = 0;

	int a_indicator = 0;
	int b_indicator = 0;

    while(i < overall_len) {
        if(a[a_indicator]) {
		    buf[i] = a[a_indicator++];
            ++i;
        }
        if(b[b_indicator]) {
		    buf[i] = b[b_indicator++];
            ++i;
        }
	}

	buf[overall_len] = '\0';

	return buf;
}

int main(void) {
	char* testStr = malloc(sizeof(char)*10);
    printf("C func:\n%s\n", fun(testStr, "bbbbc", "ua"));
	printf("C func:\n%s\n", fun(testStr, "eo2ee", "l40"));

    printf("Asm func:\n%s\n", fun_asm(testStr, "bbbbc", "ua"));
    printf("Asm func:\n%s\n", fun_asm(testStr, "eo2ee", "l40"));
	// printf("%s\n", generate_str(testStr, 'b', 3, 1));

	// printf("Asm func:\n%s\n", generate_str_asm(testStr, 'a', 7, 0));
	// printf("%s\n", generate_str_asm(testStr, 'b', 3, 1));
	return 0;
}

//to compile: gcc -Wall -Wextra interlacer.c interlacerASm.s