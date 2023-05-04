# Data Structures

> [Lecture URL](https://youtu.be/vg2u8Hbb6lE?list=PLOtl7M3yp-DX6ic0HGT0PUX_wiNmkWkXx&t=38)
>
> current time 1:08

One of the key methods of speeding up or even solving some computing problems is
with the use of data structures that can then be used and reused. Understanding
their strengths and weaknesses is the key to making the best use of the underlying
hardware. Different classes of problems required different methods of solving these
problems.

`Abstract Data Types` are categorization ideals of data structures that can be used
to solve a particular problem. They can be implemented with real data structures
which in turn can be implemented in a computer language. They different classes
have different costs and benefits.

## 3.1 Contiguous versus Linked Data Structures

`Contiguous` means that continues blocks of bytes are used to store and represent
a data structure.

`Linked` data structures are connected soles via pointers and addresses to relevant
data.

### 3.1.1 Arrays

There are continuous and fixed blocks of bytes in memory in which individual elements
can be indexed and modified easily. Access is constant time given a computed index
and space efficiency is maximum given correctly allocated amount of memory. We elements
being next to each other we can rely on CPU cache to further speed up accesses.

`Dynamic Arrays` refer to an extension to an array in which is an array fills up
then a new memory space is allocated with at least twice the amount of space and
then the new elements are copied over. Insertions are no either constant time
or \\(O(2n)\\) since insertion might trigger a reallocation.

However generally the reallocation can be done fast enough to be insignificant
can be further mitigated with appropriate reallocation.

### 3.1.2 Pointers and Linked Data Structures

`Pointers` are memory addresses, specific bytes in memory, a compiler can be told
that a specific pointer is an address to a structure or other data type so that
operations on that data structure can be performed. Null pointers are invalid
address that point to no valid data. These are address 0x00.

In a linked list node, each entry contains the relevant data itself and a pointer
to the next item in the list. Doubly linked lists hold pointers to both the previous
node and next item. A pointer to the head must be kept track of.

Operations include searching the list, were we loop recursively/iteratively over
the list by setting a cursor pointer and if the key is not in the current node
then we set the current pointer to the next pointer in the node and check again.

Other operations if the insertion and deletion. Insertion can be done by either
replacing the head pointer and the setting the appropriate next pointer or, by
looping again over the list and setting at the tail.

Deletion can be accomplished in a single link list by first getting the pointer to
the node before the target node for deletion. Then we rearrange the pointer in
order to delete the target from existence and reallocating the node.

### 3.1.3 Comparison

- Linked list rarely have situations where the data structure is 'full' in the since
  the more items can be added without requiring more allocated memory. In each node
  is individually allocated
- insertion and deletion are simple operations in linked lists in terms of memory
  manipulations
- moving pointers is always faster than moving large structures ion memory

## 3.2 Containers

`Container` refers to abstract data types which allow for storage of elements in
a specific way in order to maintain certain properties. For example and array stores
elements sequentially in memory.

`Stack` is an example of a container data storage type that has push and pop operations.
The stack maintains a first in last out property which means that the last item
stored in the stack is always the first item to be retrieved. Push will place item
on top of the stack and pop will remove it and return it. Used when order does not
matter, or it needs to be reversed.

`Queue` is liked a stack except that it is first in first out. This is a way to minimize
waiting time for services and actions to be processed in a computer system. It
is the abstract container that acts as a buffer or a waiting room. Operations include
Enqueue which inserts item into the end of the queue and dequeue which removes from
the start of the list.

Both stacks and queues can be implemented using arrays and linked structures, it
is only a question on the size of the container.

## 3.3 Dictionaries

The book defines dictionaries as an abstract data type stores unique elements.
Each time a new element is added it is checked to see if it already exists. If
not then it is added. The goal is to only contain unique elements. These can
be a sorted or unsorted backing data structure like an array or a linked list.

The operations involved in a dictionary are

- Search(D, k) → given key k, return index/entry relevant to it dictionary D if it
  exists
- Insert(D, x) → add unique element x to dictionary
- Delete(D, x) → delete unique element x from dictionary
- Max(D) → return item which generates the largest index value, used in priority
  queues
- Min(D) → return item which generates smallest index value

Dictionaries as defined in the book is a data type used to store only unique
items. Both implementations contain different costs and benefits. The main
point of contention is that the time complexities of operations on unsorted
arrays and linked lists is almost always linear since we have to iterate over
all the elements in order to get guarantee that we found the all the information
or correct item.

This brings the point of contention that good data structure design must balance
the time complexities of relevant operations for the task at hand.

## 3.4 Binary Search Trees

Nodes with more than one pointer allow for easier traversal and organization.
The nodes contain data that are organized in a specific manner that maintain
certain properties between nodes, the implementing search functionality
is simple.

`Rooted Binary Tree` is defined recursively as either being empty or with each node
having two child trees.

`Binary Search Tree` maintains the property that each left child node contains a
value that is less than the parent and right child contains value greater than
the parent. This allows for easy binary search as with each insertion a property
is carefully maintained.

### 3.4.1 Implementing Binary Search Trees

Each node contains a value, left and right child pointers and optionally a pointer
to the parent. A Binary search tree implements several operations.

Search: works by comparing a key with the value at the root, if values match then
pointer to root is returned. If key less than the value then we recurse and set
to root to left child, right child if key is greater

Maximum/Minimum: implement by recursing down the left and right node until we reach
a node with no children. Then return value.

Traversal: There are different ways to loop over the values in a binary tree, on
being post order in which each item is processed first and then recursion happens.

Insertion: is done by comparing the new value with the root and going down until
we reach either a matching node or an empty spot on which we append to node.

Deletion: is done by deallocating the appropriate node and then reassigning the
child node appropriate locations in the rest of the tree and then balancing the
resulting tree.

### 3.4.2 How Good Are Binary Search Trees?

These data structures work best when they are properly maintained and kept
balanced. Time complexity is hugely dependent on the height of the tree
and keeping all branches to the average height, not on that goes off in
a random direction. Worst case the data is entered in sorted order and
if not balanced will result in O(n) time complexity for search.

Properly balanced tree with git O (log n) complexity.
