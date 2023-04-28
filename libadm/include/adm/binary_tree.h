#ifndef BINARY_TREE_H
#define BINARY_TREE_H

#include "common.h"
typedef struct BTree {
  int data;
  struct BTree *parent;
  struct BTree *left;
  struct BTree *right;

} BTree;

BTree *newBTree(int data);

// return pointer to node that contains key
BTree *search_tree(BTree *l, int x);

// return left most node
BTree *find_minimum(BTree *t);

BTree *find_maximum(BTree *t);

//
void insert_tree(BTree **l, int key, BTree **parent);

void destroy_tree(BTree *root);

// add value to the tree
void push_tree(BTree *root, int key);

// return array of values

Buffer traverse_tree(BTree *l);

#endif
