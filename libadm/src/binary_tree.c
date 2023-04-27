#include "binary_tree.h"
#include <stdlib.h>

BTree *search_tree(BTree *l, int x) {
  if (l == NULL) {
    return NULL;
  }

  if (l->data == x) {
    return l;
  }

  if (x < l->data) {
    return search_tree(l->left, x);
  } else {
    return search_tree(l->right, x);
  }
}

BTree *find_minimum(BTree *t) {
  BTree *min;

  if (t == NULL) {
    return NULL;
  }

  min = t;
  while (min->left != NULL) {
    min = min->left;
  }
  return min;
}
