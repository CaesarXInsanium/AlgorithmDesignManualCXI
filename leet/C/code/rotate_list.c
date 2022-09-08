#include <stdio.h>
#include <stdlib.h>

struct ListNode {
  int val;
  struct ListNode *next;
};
typedef struct ListNode Node;

struct ListNode *rotateRight(struct ListNode *head, int k) {

  return head + k;
}
Node *make_ll_from_array(int *A, int count) {
  Node *head = (Node *)malloc(sizeof(Node));
  for (int i = 0; i < count; i++) {
    head->val = A[i];
    if (i < count - 1) {
      head->next = (Node *)malloc(sizeof(Node));
      head = head->next;
    } else {
      head->next = NULL;
    }
  }
  return head;
}

void print_ll(Node *ll) {
  Node *cursor = ll;
  while (cursor->next != NULL) {
    printf("Address: %p, Val: %d, Next: %p\n", (void *)cursor, cursor->val,
           (void *)cursor->next);
  }
}
int main(void) {
  int a[] = {0, 1, 2, 3, 4, 5};
  Node *s = make_ll_from_array(a, 6);
  print_ll(s);
}
