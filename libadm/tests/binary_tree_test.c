#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "adm/binary_tree.h"
#include "common.h"

int main(void) {
  BTree *root = NEW(BTree);
  root->parent = NULL;
  root->left = NULL;
  root->right = NULL;
  root->data = 0;

  puts("min is 0");
  assert(find_minimum(root)->data == 0);

  BTree *child = newBTree(9);

  push_tree(root, 9);

  assert(find_maximum(root)->data == 9);
  assert(find_minimum(root)->data == 0);

  push_tree(root, 10);

  assert(find_maximum(root)->data == 10);
  assert(find_minimum(root)->data == 0);

  push_tree(root, -1);

  assert(find_maximum(root)->data == 10);
  assert(find_minimum(root)->data == -1);

  BTree *ninenode = search_tree(root, 9);
  assert(ninenode->data == 9);

  destroy_tree(root);
  return 0;
}
