/* Wielkosc tablicy ustawia sie za pomoca stalej BOK */
//to compile gcc -g -Wall -Wextra przekatne.c sumaAsm.s

#include <stdio.h>
#include <stdlib.h>

#define BOK 4

int suma(int** wsk, int bok) {
  int suma = 0;

  for(int i = 0; i < bok; ++i) {
      suma += wsk[i][i];
  }

  return suma;
}

int suma_asm(int** wsk, int bok);

int main()
{
  int i, k, licznik = 0;
  int** wsk = malloc(BOK * sizeof(int*));

  for(i = 0; i < BOK; ++i)
  {
    wsk[i] = malloc(BOK * sizeof(int));
  }

  for(i = 0; i < BOK; ++i)
  {
    for(k = 0; k < BOK; ++k)
    {
      wsk[i][k] = licznik;
      ++licznik;

      printf("%d\t", wsk[i][k]);
    }

    printf("\n");
  }

  printf("Suma przekatnej to: %d\n", suma_asm(wsk, BOK));

  for(i = 0; i < BOK; ++i)
  {
    free(wsk[i]);
  }
  free(wsk);

  return 0;
}

//to compile gcc -g -Wall -Wextra przekatne.c sumaAsm.s