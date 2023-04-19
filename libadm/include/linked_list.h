#ifndef LINKED_LIST_H
#define LINKED_LIST_H

typedef struct SList {
  int *data;
  struct SList *next;
} SList;

SList *search_list(SList *self, int *x);

#endif
