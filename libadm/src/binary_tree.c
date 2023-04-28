#include "adm/binary_tree.h"
#include "common.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <string.h>

BTree *newBTree(int data) {

  BTree *result = NEW(BTree);
  result->parent = NULL;
  result->left = NULL;
  result->right = NULL;
  result->data = data;
  return result;
}

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

BTree *find_maximum(BTree *t) {

  BTree *max;

  if (t == NULL) {
    return NULL;
  }

  max = t;
  while (max->right != NULL) {
    max = max->right;
  }
  return max;
}

void insert_tree(BTree **l, int key, BTree **parent) {
  BTree *p;

  if (*l == NULL) {
    p = malloc(sizeof(BTree));
    p->data = key;
    p->left = p->right = NULL;
    p->parent = *parent;
    *l = p;
    return;
  }

  if (key < (*l)->data) {
    insert_tree(&((*l)->left), key, l);
  } else {
    insert_tree(&((*l)->right), key, l);
  }
}

void destroy_tree(BTree *root) {
  if (root == NULL) {
    return;
  }
  destroy_tree(root->left);
  destroy_tree(root->right);
  printf("Destroying Node with Key: %d\n", root->data);
  free(root);
}

void push_tree(BTree *root, int key) {
  BTree *node = newBTree(key);
  if (root->data == key) {
    return;
  } else if (key < root->data) {
    if (root->left != NULL) {
      push_tree(root->left, key);
    } else {
      root->left = node;
    }
  } else if (key > root->data) {
    if (root->right != NULL) {
      push_tree(root->right, key);
    } else {
      root->right = node;
    }
  }
}

Buffer traverse_tree(BTree *l, int *pos, u_int8_t *target){
  if (l != NULL){
    traverse_tree(l->left);
    memcpy(void *, const void *, unsigned long) 
  }
}
