# Sorting

Sorting is a fundamental concept in computer science, studied extensively with
data structures and algorithms dedicated to the idea of ordering items according
to some function. Very essential and used in other fields.

## 4.1 Applications of Sorting

Best Sorting algorithms run on \\( O (n\log n) \\). This means that a lot of the
different sorting algorithms are can be used on small enough data sets however
on big enough data sets they start to fall behind some alternatives. Certain actions
must be able to be done with with the data resulting from sorting operations.

- **searching**
- **closests pair** given a set of sporadic numbers, find pair with smallest difference
- **element uniqueness**
- **find the mode**
- **selection** with unique elements find some with specific properties
- **convex hulls** used in geometric algorithms

Sorting is a method for setting data up for further actions. Sorting data is generally
not the goal in of itself. Sometimes hashing can be used in places where sorting
can also be used, but sorting is better in terms for searching. One is not better
than the other it is all about using the best tools for the job at hand.

## 4.2 Pragmatics of Sorting

The resulting order from a certain sorting technique is always domain specific.
It can be done in **increasing** order or **decreasing** order.

- **key** vs **record** :: determine where to sort by specific attribute of structure
  fields, in some cases sorting `Person` structures by `name` field

```c
{{#include ../examples/struct_person.c:4:7}}
```

**Stable** sorting algorithms are defined as such due to their proper of retaining
relative order for items that of *equal* value.

**Non Numerical Data** : Alphabetical order and text strings.

With the proper definition of a comparison function it is possible to sort any
form of data given a properly implemented sorting algorithm. In the standard library
of most programming language lies an implementation of some form of sorting algorithm.
Like this one in C.

```c
#include <stdlib.h>
void qsort (void *ARRAY, size_t COUNT, size_t SIZE, comparison_fn_t COMPARE);
```

## 4.3 Heapsort: Fast Sorting Via Data Structures

**Selection Sort** :: works by sweeping over the data and finding the smallest element
and swapping with first element. Then sweeps again and swaps with second element.
This continues until the array is sorted. The worst possible case is if the array
is sorted in the wrong order. This results in linear time.

### 4.3.1 Heaps

Heaps work by maintaining partial order of elements. Each tree can be visualized
with a tree. Each node is bigger than its children. An index variable serves as
a pointer. With use of function to determine parent and child nodes.

```lisp
{{#include ../examples/heap.scm}}
```

These functions work best if array indexing starts at one. The biggest downside
is the wasted space that gets worse the bigger the tree grows. Auto balancing is
required in order to maintain the correct properties in which it is sorted. This
bay be less flexible compare to binary search but is perfect for heaps. The naive
approach is to insert elements into first empty slot. Then what needs to happen
is to traverse back up the tree and swap elements until there fufill certain properties.

```c
// into first empty slot
void pq_insert(priority_queue *q, item_type x);
// swaps items in a heap until it satifies certain properties
void bubble_up(priority_queue *q, int p);
```

### 4.3.1 Extractive the Minimum
