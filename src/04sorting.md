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
- **closest pair** given a set of sporadic numbers, find pair with smallest difference
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
is to traverse back up the tree and swap elements until there fulfill certain properties.

```c
// into first empty slot
void pq_insert(priority_queue *q, item_type x);
// swaps items in a heap until it satisfies certain properties
void bubble_up(priority_queue *q, int p);
```

### 4.3.1 Extracting the Minimum

Main purpose of priority heap is to always be able to extract the largest/smallest
item from it. That is the whole purpose.

- **Extract Min**
- **Bubble Down**:  swaps elements down until heap property is fulfilled.
- **In Place Sort**: requires no extra memory, heap sort allows for this

The implementation provided by the textbook works by building a heap from an array
of elements and then repeatedly extracting from the top of the heap until it is empty.

### 4.3.4 Faster Heap Contruction

The **bubble down** procedure can be used during heap contruction to maintain the
heap property. The best case time complexity is when heap is in reverse order. The
upper bound is not that bad since the execution time cannot exceed a certain threshold.
The book uses some math to explain this part.

**NOTE TO SELF: Study Geometric Series Convergence**

### 4.3.5 Sorting by Incremental Insertion

Insertion sort works best in partially sorted data. The explanation the Skiena
gives is too high level for me right now.

### 4.4 War Story: Give me a Ticket on an Airplane

Problem was way to find lowest fare for a flight route/destination. Solution involved
a hash set and priority queue.

## 4.5 Merge Sort: Sorting by Divide and Conquer

By their nature, recursive algorithms working by breaking down a large problem into
more manageable chunks. Down until they hit a base case, At which point the solution
be built back up. Each level preps that data to be sent back up. Since merge sort
break the problem in half then the time complexity is \\(O(n\log{n}\)).

The power of merge sort comes from the `merge` function since it takes two array
and joins them back together an element at a time, comparing the head of each array
both at the same time. This is built up from the base case of sorting a 1 or 2 element
arrays. In my notebook I detailed a pseudo code implementation of merge sort.

## 4.6 Quicksort: Sorting by Randomization

Quicksort is an algorithm that chooses an arbitrary element from which to split an
array and begin sorting. This pivot element is chosen at random it seems. The C
standard library defines a function for quicksort. Best case is the array is split
down the middle. Worst case the pivot point is in a really inconvenient location,
such as say, one end of the array.

### 4.6.1 Intuition: The Expect Use for Quicksort

Performance of quicksort is depended on the height of the partition tree.
\\( N\log{N}\\) and can reach quadratic time in the worst case.

### 4.6.2 Randomized Algorithms

Given a random shuffling of items, the chances of getting a good time complexity
is higher since it reduces the chances of a particular bad ordering of items.

> It has come to my attention that a certain level of probability theory is required
> to understand why exactly randomized algorithms work.

- **Random Sampling** :: get small number of random items from array
- **Random Hashing** :: use a random hashing algorithm to reduce likelihood of
  item collisions.
- **Random Search** :: search techniques.

In some instances the randomization can make the work case go away.

### 4.6.3 Is quicksort really quick?

When comparing equal algorithms, it pays to check implementations and perform
testing. In some instances quicksort can be faster that merge sort of heap sort.

## 4.7 Distribution Sort

Distribution sort works by categorizing data first and then sorting the sub categories
as a recursive instance of distribution sort. This is useful in sorting words and
strings, alphabetical sorting. Works best if distribution of data is even.

### 4.7.1 Lower Bounds for Sorting

Some sorting algorithms can achieve linear time complexity an that is not always a
bad thing. Hashing algorithms do not always perform element comparisons. In some
occasions worst time complexity is just matter of bad luck.
