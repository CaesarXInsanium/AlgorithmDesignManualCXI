#include <stdio.h>

int divide(int dividend, int divisor) {
  int total = 0;
  int i;
  if (divisor > 0) {

  } else {

    for (i = 0; total < dividend; i++) {
      total += divisor;
    }
    return i - 1;
  }
  return 0;
}

int main(void) {
  int result = divide(10, 3);
  printf("Result: %d\n", result);
  result = divide(7, -3);
  printf("Result: %d\n", result);
}
