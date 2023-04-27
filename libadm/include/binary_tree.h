#ifndef BINARY_TREE_H
#define BINARY_TREE_H

typedef struct BTree {
  int data;
  struct BTree *parent;
  struct BTree *left;
  struct BTree *right;

} BTree;

// return pointer to node that contains key
BTree *search_tree(BTree *l, int x);

// return left most node
BTree *find_minimum(BTree *t);

// return array of values

#endif
