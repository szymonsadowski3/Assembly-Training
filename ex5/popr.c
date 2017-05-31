#include <stdio.h>
#include <stdlib.h>
 
long long max_1_ind(
  long long* tab,
  long long n,
  long long* even_count,
  long long* neg_count
) {
  int i;
  long long maxIndex = 0, max = 0, current;
  unsigned long long elem;
 
  *even_count = 0;
  *neg_count = 0;
 
  for(i = 0; i < n; ++i) {
    if(tab[i] % 2 == 0) ++*even_count;
    if(tab[i] < 0) ++*neg_count;
 
    elem = (unsigned long long) tab[i];
    current = 0;
    do {
      current += (elem & 0x01);
    } while(elem >>= 1);
 
    if(current > max) {
      max = current;
      maxIndex = i;
    }
  }
 
  return maxIndex;
}
 
int max_1_ind_asm(
  long long int* tab,
  long long int n,
  long long int* even_count,
  long long int* neg_count
);
 
int main(void) {
  long long int tab[7]= {-1232131231,-3,-1,4,5,-6, 2};
  long long int* a = malloc(sizeof(long long int));
  long long int* b = malloc(sizeof(long long int));
 
  long long max = max_1_ind(tab, 7, a, b);
  printf("C func: %lld, %lld, %lld\n", *a, *b, max);
 
  max_1_ind_asm(tab, 7, a, b);
  printf("Asm func: %lld, %lld, %lld\n", *a, *b, max);
 
}

//to compile gcc -g -Wall -Wextra popr.c popraA.s