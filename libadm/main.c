#include "linked_list.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {
  printf("Running Some Tests! >:->\n");
  // Linked List tests
  SList *ll = NULL;
  int key = 10;
  assert(search_list(ll, &key) == NULL);
}
