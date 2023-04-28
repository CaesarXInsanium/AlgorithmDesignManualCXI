#ifndef LINKED_LIST_H
#define LINKED_LIST_H

typedef struct SList {
  int *data;
  struct SList *next;
} SList;

SList *search_list(SList *self, int *x);
void insert_list(SList **list, int *x);
// pass a pointer to head and node to look for
SList *item_ahead(SList *l, SList *x);

void delete_list(SList **l, SList **x);

#endif
