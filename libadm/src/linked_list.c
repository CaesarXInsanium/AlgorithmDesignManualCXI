#include "linked_list.h"
#include <stdlib.h>

SList *search_list(SList *self, int *x) {
  if (self == NULL) {
    return NULL;
  }

  if (self->data == x) {
    return self;
  } else {
    return search_list(self->next, x);
  }
}

void insert_list(SList **list, int *x) {
  SList *p;
  p = malloc(sizeof(SList));
  p->data = x;
  p->next = *list;
  *list = p;
}

SList *item_ahead(SList *l, SList *x) {
  if ((l == NULL) || (l->next == NULL)) {
    return NULL;
  }
  if ((l->next) == x) {
    return l;
  } else {
    return item_ahead(l->next, x);
  }
}

void delete_list(SList **l, SList **x) {
  SList *p;
  SList *pred;
  p = *l;
  pred = item_ahead(*l, *x);

  if (pred == NULL) {
    *l = p->next;
  } else {
    pred->next = (*x)->next;
  }
  free(*x);
}
