#include "common/common.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int get_value(char c) {
  switch (c) {
  case '0':
    return 0;
  case '1':
    return 1;
  case '2':
    return 2;
  case '3':
    return 3;
  case '4':
    return 4;
  case '5':
    return 5;
  case '6':
    return 6;
  case '7':
    return 7;
  case '8':
    return 8;
  case '9':
    return 9;
  default:
    printf("Invalid char %c\n", c);
    return -1;
  }
}

char *ignore_leading_zero(char *c) {
  int i = 0;
  while (c[i] == '0') {
    i++;
  }
  int len = strlen(c);
  char *result = (char *)malloc(len - i);

  for (int j = 0; j < len - i; j++) {
    result[j] = c[j + i];
  }
  return result;
}

char *removeKdigits(char *num, int k) {
  int len = strlen(num);
  if (len - k == 0) {
    char *c = (char *)malloc(sizeof(char) * 2);
    c[0] = '0';
    c[1] = '\0';
    return c;
  }
  char *chars = (char *)malloc(len);
  memcpy(chars, num, len);

  char *remove_buffer = (char *)malloc(sizeof(char) * k);

  for (int i = 0; i < k; i++) {
    remove_buffer[i] = num[i];
  }

  for (int i = 0; i < k; i++) {
    if (get_value(remove_buffer[i]) < get_value(chars[i + k])) {
      char temp = remove_buffer[i];
      remove_buffer[i] = chars[i + k];
      chars[i + k] = temp;
    }
  }
  char *result = (char *)malloc(len);
  memcpy(result, num, len);
  result = ignore_leading_zero(&chars[k]);
  return result;
}

void test(char *string, int k) {
  printf("Testing {%s}\n", string);
  char *result = removeKdigits(string, k);
  printf("Result: %s Len: %d\n", result, (int)strlen(result));
}

int main(void) {
  test("1432219", 3);
  test("10200", 1);
  test("10", 2);
}
