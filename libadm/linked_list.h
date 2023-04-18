typedef struct SList {
  int *data;
  struct SList *next;
} SList;

SList *search_list(SList *self, int *x);
