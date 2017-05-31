//to compile gcc -g -Wall -Wextra removal.c remove_spaces.s

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void usun_spacje(char* str, int upper) {
	int current_pos = 0;

	for (int i = 0; i < strlen(str); ++i) {
		if(str[i]!=' '){
			if(upper>0)
				str[current_pos] = str[i] + ('A'-'a');
			else
				str[current_pos] = str[i];
			current_pos++;
		}
	}

	str[current_pos] = '\0';
}

void remove_spaces_asm(char* str);


int main()
{
  char* wsk = malloc(100);
  sprintf(wsk, "%s", "abc  def   gh ijk");
 
  printf("%s\n", wsk);
  // usun_spacje(wsk, 0);
  remove_spaces_asm(wsk);
 
  //0 - bez zamiany na duze litery; 1 - zamiana na duze litery
  printf("%s\n", wsk);
 
  free(wsk);
  return 0;
}