#include <stdio.h>
 
long maxmin(long a, long b, long c, long d);
 
int main() {
  printf("%ld\n", maxmin(30,20,-10,1));
  printf("%ld\n", maxmin(10,20,-10,1));
  printf("%ld\n", maxmin(10,20,60,1));
  printf("%ld\n", maxmin(10,20,-10,40));
  printf("%ld\n", maxmin(10,20,-10,20));
 
  return 0;
}
 
//to compile: gcc -Wall -Wextra CCaller.c greatestDiff.s