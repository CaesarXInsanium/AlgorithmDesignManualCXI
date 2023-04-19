#include "linked_list.h"
#include <assert.h>
#include <stdio.h>

int main() {
  puts("Linked List Testing!");
  SList *ll = NULL;
  int key = 90;
  SList *result = search_list(ll, &key);
  puts("Testing search_list returns NULL");
  assert(result == NULL);
  return 0;
}
