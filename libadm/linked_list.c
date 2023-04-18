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
