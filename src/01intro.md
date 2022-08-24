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
