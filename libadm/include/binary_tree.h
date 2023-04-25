#ifndef BINARY_TREE_H
#define BINARY_TREE_H

typedef struct BTree {
  int data;
  struct BTree *parent;
  struct BTree *left;
  struct BTree *right;

} BTree;

#endif
