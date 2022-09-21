# Introduction to Algorithm Design

- Algorithm is set well define instructions for solving an instance of a problem
  class.
  - To be a properly defined algorithm it must be able to take in any instance of
  a problem and give an output
- goal of algorithm design to create procedure that are correct efficient and easy
  to implement
- fundamental difference between algorithms and `heuristics` is that algorithms have
  to be proven to always give correct results

## Examples of Problems to Solve with Algorithms

- Sometimes we want to find the shortest way to transverse a set of points in a
graph. This is the traveling salesman problem
  - one approach is the nearest neighbor, in which we pick the next point that is
    the shortest distance away from current location
  - next approach would be the nearest pair
- sometimes we can the largest set of non-overlapping time periods
  - optimize scheduling in order to no gain the biggest number of jobs
- one must be able to seek counterexamples to be able to prove algorithm incorrect

## Reasoning for Correctness

One way to prove that an algorithm would always yield the correct answer is by
applying a rigorous mathematical proof. Which consists of the goal of proof,
a set of assumptions and chain of reasoning from assumptions to overall truth.

In order to begin devising an algorithm, there must be a clear and concise description
of problem that define input instances, types and outputs.

- One method of devising algorithm specification is increasing restrictions without
  losing generality
  - reducing scope from graphs in general to just trees for example
- only define usefulness of algorithm using things that can be measured
  - no 'best' algorithm, only one that take the least amount of time

Once we have a clear description of problem scope we can begin to approach the design.
We can describe algorithm in pseudocode, proper English and in an actual programming
language.

### Showing Incorrectness

There are two main methods to prove algorithm in correct. One is counterexamples.

- Provide instance where algorithm provides answer, and we are able to deduce
  a better answer
- keep counterexamples short and simple
- look for smaller examples and move them around
- look at the wording to sport for weaknesses
- go for tie in case where data is compared in size

The second is via a mathematical proof. For my programmer brain this is a form of
recursion. We are breaking problem into the smallest instances of itself via logical
and mathematical manipulation of given facts. Induction follows these steps

- prove that in base case algorithm gives correct answer, where n = 1
- assume that that algorithm works for n + 1
- using logic from step 1 and 2 prove that algorithm works for all n

One must be careful with induction, some errors may creep in, for example

- boundary errors
- logical error
- algebraic error

## Modeling Problem

Modeling is defining our application problem set in precise language and mathematical
principle in terms of previously defined and understood problems.

Another way to put is to translate problems in the real world related to datasets,
networks, game logic and boil them down to mathematical constructs.

Always make sure to test model against simple version of problem at hand in order
to verify that model of problem is correct. Verifying the correctness is important
before even attempting to design the relevant algorithm

- `Permutations`: arrangements/ordering of items. Ways to shuffle deck
- `Subsets`: selections from larger sets of items. Choosing groups of 3 from a classroom.
  Order does not matter.
- `Trees`: represent hierarchical relationships between items. Family trees,
  parents and children
- `Graphs`: defined using edges and vertices. Map with location being vertices
  and edges roads
- `Points`: locations in space.
- `Polygons`: region define with points. Shapes of countries and boundaries
- `Strings`: sequences of characters and patterns

### Recursive Objects

Recursion often occurs in the world of data structures and algorithms some examples
include,

- Permutations: methods of ordering items in set
- subsets: subsets of bigger set
- graphs: traversing edges and vertices
- point sets: taking points in space and dividing them into groups
- polygons: making a new line from preexisting polygon vertices in order to make
  two new polygons. Will recursively generate two new polygons
- strings: just another implementation of subsets

Recursive thing are defined by the base case and then bigger more complicated
versions of the same problem that are related to the base case. For example base
string has zero characters in it. Base graph has one vertex.

## Proof By Contradiction

The basic idea behind proof by contradiction is assuming that premise if false
and then deriving a logical consequence of it that contradicts assumption, after
which it is proven that statement is true.

Most famous example is Euclid's proof of an infinite number of primes.

## Estimation

Sometimes close is good enough, estimation is valid solution if problem is two big
and complicated. Especially if values to be measured are continuous instead of discrete.

However, the estimations must be based on known correct information. Principled
calculations give functions to known values and analogies are to be used in order
to compare current problem at hand with previous and similar problems.

Even if correct answer cannot be calculated directly use other related information
in order to try and derive the true value.

For example is a number of items in jar cannot be counted, then use dimensions and
weight of jar and information on the items inside the jar in order to get close.
## Exercises

```text
1-1
a = -1
b = -2
a + b = -3
-3 < -1
-3 < -2

1-2
a = -1
b = 2
a * b = -2
-2 < -1
-2 < 2

1-5
all correct sets{(1,2,9,10)}
a) (1,2,9,10), are items not in order  as done by algorithm
b) (1,2,9,10), are not in ordered by size, 5 is ignored
c) given S = { 1,2,3,4,11} T = 12

1-6
Finding the smallest possible subset of sets that has unique values representitive
of everything that shows up on all the subsets

1-7
The perfect counter example for Graph that is a set of two sets of V vertices
and E edges, is one where there is only pairs of vertices connect by single edge
each. Technically there are all the largest clique but since they are all the
degree only the one that shows up first from the sorting algorithm will be returned
as correct answer
```

Check out the Leet code repository, `rotate_list` and `daily_temperatures`
