#include "common/common.h"
#include <stdio.h>
#include <stdlib.h>

void increment_up_to(int *arr, int upper, int lower) {
  int diff = upper - lower;
  if (diff == 0) {
    arr[lower] += 1;
  } else {
    for (int i = 0; i < diff; i++) {
      arr[i + lower] += 1;
    }
  }
}

void int_array_zero_init(int *a, int size) {
  for (int i = 0; i < size; i++) {
    a[i] = 0;
  }
}

int *dailyTemperatures(int *temperatures, int temperaturesSize,
                       int *returnSize) {
  *returnSize = temperaturesSize;
  int *result = (int *)malloc(sizeof(int) * *returnSize);
  for (int i = 0; i < temperaturesSize; i++) {
    result[i] = 0;
  }
  for (int i = 0; i < temperaturesSize; i++) {
    int max = temperaturesSize - i;
    for (int j = 1; j < max; j++) {
      if (temperatures[i + j] > temperatures[i]) {
        result[i] = j;
        j = max;
      }
    }
  }
  return result;
}

int main() {
  int temperatures[] = {73, 74, 75, 71, 69, 72, 76, 73};

  int *a = (int *)malloc(sizeof(int));
  int *answer = dailyTemperatures(temperatures, 8, a);
  print_int_array(answer, 8);

  int temp[] = {89, 62, 70, 58, 47, 47, 46, 76, 100, 70};
  int *b = (int *)malloc(sizeof(int));
  int *answer1 = dailyTemperatures(temp, 10, b);
  print_int_array(answer1, 10);
}
