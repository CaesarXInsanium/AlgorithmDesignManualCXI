#include <stdio.h>
#include <stdlib.h>

struct ListNode {
  int val;
  struct ListNode *next;
};
typedef struct ListNode Node;

Node *make_ll_from_array(int *A, int count) {
  Node *cursor = (Node *)malloc(sizeof(Node));
  Node *head = cursor;
  for (int i = 0; i < count; i++) {
    if (i < count - 1) {
      cursor->next = (Node *)malloc(sizeof(Node));
      cursor->val = A[i];
      cursor = cursor->next;
    } else {
      cursor->val = A[i];
      cursor->next = NULL;
    }
  }
  return head;
}

void print_ll(Node *head) {
  Node *cursor = head;
  while (cursor != NULL) {
    printf("Address: %p, Val: %d, Next: %p\n", (void *)cursor, cursor->val,
           (void *)cursor->next);
    cursor = cursor->next;
  }
}

struct ListNode *second_last(struct ListNode *head) {
  struct ListNode *cursor = head;
  if (cursor->next != NULL) {

    while (cursor->next->next != NULL) {
      cursor = cursor->next;
    }
  }
  return cursor;
}
int count_nodes(struct ListNode *head) {
  struct ListNode *cursor = head;
  int result = 0;

  if (cursor != NULL) {
    if (cursor->next != NULL) {
      result += 1;
      while (cursor->next != NULL) {
        result += 1;
        cursor = cursor->next;
      }
    }
  }
  return result;
}
struct ListNode *rotateRight(struct ListNode *head, int k) {
  int count = count_nodes(head);
  if (count == 0) {
    return head;
  }
  int rotations = k % count;
  if (rotations == 0)
    rotations = k;
  printf("Rotations; %d\n", rotations);
  struct ListNode *start = head;
  if (head == NULL) {
    return NULL;
  }
  for (int i = 0; i < rotations; i++) {
    struct ListNode *penul = second_last(start);
    struct ListNode *end = penul->next;
    if (end != NULL) {
      end->next = start;
      penul->next = NULL;
      start = end;
    }
  }

  return start;
}

int main(void) {
  int a[] = {0, 1, 2, 3, 4, 5};
  Node *list = make_ll_from_array(a, 6);
  puts("Before");
  print_ll(list);
  printf("\n");
  Node *result = rotateRight(list, 2);
  puts("After");
  print_ll(result);
}
