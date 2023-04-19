#include "linked_list.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
  puts("Linked List Testing!");
  SList *ll = NULL;
  int key = 90;
  SList *result = search_list(ll, &key);
  puts("Testing search_list returns NULL");
  assert(result == NULL);

  puts("Inserting Values Into Linked List");
  for (int i = 0; i < 10; i++) {
    int *num = malloc(sizeof(int));
    *num = i;
    insert_list(&ll, num);
  }

  key = 5;
  assert(search_list(ll, &5) != NULL);

  puts("Checking Head");
  SList *third = ll->next->next;
  assert(ll->next == item_ahead(ll, third));

  puts("Deleting Node");
  delete_list(&ll, &third);
  return 0;
}
