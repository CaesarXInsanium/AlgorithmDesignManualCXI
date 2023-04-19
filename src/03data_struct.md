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
can be further mitigated with appropiate reallocation.

### 3.1.2 Pointers and Linked Data Structures

`Pointers` are memory addresses, specific bytes in memory, a compiler can be told
that a specific pointer is an address to a structure or other data type so that
operations on that data structure can be performed. Null pointers are invalid
address that point to no valid data. These are address 0x00.

In a linked list node, each entry contains the relevant data itself and a pointer
to the next item in the list. Doubly linked lists hold pointers to both the previous
node and next item. A pointer to the head must be kept track.
