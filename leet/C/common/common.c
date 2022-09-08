#include "common.h"
#include <stdio.h>

int abs(int i) {
  if (i >= 0) {
    return i;
  } else {
    return i + (2 * i);
  }
}

void int_array_zero_init(int *a, int size) {
  for (int i = 0; i < size; i++) {
    a[i] = 0;
  }
}

void print_int_array(int *a, int c) {
  for (int i = 0; i < c; i++) {
    printf("%d, ", a[i]);
  }
  printf("\n");
}
