# Algorithm Analysis

Two methods are used in order to denote the efficiency of computer programs.
RAM model and the asymptotic analysis of computational complexity.

## RAM Model of Analysis

RAM models stands for *Random Access Machine*. This model has several assumptions

- Basic arithmetic, (=,-, \*, /) take one time step
- loops and subroutines are not simple, they are the addition of all the other
  steps inside them
- accessing any location in memory take one time step. All memory is available at
  all times at equal access time.

RAM model is inaccurate, but it is still the best model for understanding generally
if an algorithm is doing well or if it is not. RAM model is useful abstraction.

### Best-case, Worst-case and Average Case Complexity

In order to decide arbitrary usefulness of algorithm first its runtime complexity
in a variety of scenarios need to be accessed. Such runtime complexity is compared
to the size of input data which can be a number of items in data structure or size
of number.

- Worst case complexity is defined as maximum number of steps possible given size
  n
- best-case is when least number of steps
- average case is generally how well an algorithm is expected to perform.

However, the reason the worst case is used as the defining measure of an algorithm
is because it is easiest to calculate and because it is easiest to work with.
Average case is useful when it comes to randomized algorithms.
