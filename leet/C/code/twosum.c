#include "common/common.h"
#include <stdio.h>
#include <stdlib.h>

int *twoSum(int *nums, int numsSize, int target, int *returnSize) {
  int i, j;
  *returnSize = 2;
  int *result = (int *)malloc(sizeof(int) * *returnSize);
  result[0] = -1;
  result[1] = -1;

  for (i = 0; i < numsSize; i++) {
    int x = nums[i];
    for (j = i + 1; j < numsSize; j++) {
      int y = nums[j];
      if (x + y == target) {
        result[0] = i;
        result[1] = j;
      }
    }
  }
  return result;
}

int test_two_sum(int *A, int Asize, int target) {

  printf("Input: ");
  print_int_array(A, Asize);
  printf("Target: %d\n", target);
  int returnSize = 2;
  int *result = twoSum(A, 4, target, &returnSize);
  printf("Result: ");
  print_int_array(result, 2);

  if (result[0] != -1 && result[1] != -1) {
    return EXIT_SUCCESS;
  } else {
    return EXIT_FAILURE;
  }
}
int main(void) {
  int A[] = {2, 7, 11, 15};
  int B[] = {3, 2, 4};

  test_two_sum(A, 4, 9);
  test_two_sum(B, 3, 6);
}
