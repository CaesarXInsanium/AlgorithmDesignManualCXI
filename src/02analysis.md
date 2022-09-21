# Algorithm Analysis

Two methods are used in order to denote the efficiency of computer programs.
RAM model and the asymptotic analysis of computational complexity.

## RAM Model of Analysis

[Video Link](https://youtu.be/z1mkCe3kVUA?list=PLOtl7M3yp-DX6ic0HGT0PUX_wiNmkWkXx&t=2059)

RAM model stands for *Random Access Machine*. This model has several assumptions.
This is a huge simplification of how computer in general work.

- Basic arithmetic, (=,-, \*, /) take one time step
- loops and function/subroutines are not simple, they are the addition of all the
  other steps inside them
- accessing any location in memory take one time step. All memory is available at
  all times at equal access time.

RAM model is inaccurate, but it is still the best model for understanding generally
if an algorithm is doing well or if it is not. RAM model is useful abstraction.

If it is like assuming that the earth is flat only in small enough context, but the
reality must be acknowledged in big enough context.

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

## The Big O Notation

Big O notation at its simplest serves as a simple way to classifying the worst case
time complexity of algorithms in the form of a function over the size of problem
set. However, it should be noted that the true time complexity of algorithms is
usually not a smooth predictable function and can vary. Sometimes the effort to
get the most details possible is not worth it.

- \\(O(n) \\) is the upper bound of true function $f(n)$,
- \\(\Omega(n) \\)is lower bound,
- \\(\theta(n) \\)is average case

Big O notation deals less with how much time exactly it takes for an algorithm to
produce an output but rather much the time changes relatively to the size of
the problem.

A function can be classified by finding a constant *c* for all values n such that
when multiplied against one of the basis function is equal to that function f(n)

However, we must also define for what values of n such statements becomes true.
Sometimes any value of *c* cannot serve as a bound for any value of n.

For example: for all \\(n > 3 \\), constant \\(c = 4 \\) that allows
\\(c * g(n) \\) is greater than \\(f(n) \\)

## Growth Rates and Dominance Relations

Since Big O Notation deals more with classification of the expected growth rate
of an algorithm, constants are ignored the true expression of the time complexity
is simplified to the most significant component.

### Dominance Relations

The different categories of growth rate are

- constant: takes the same number of steps regardless of input size
- logarithmic: growth rate slows as input size increases
- linear: is in proportion with input size
- super linear: slower than linear but fast enough to be useful
- quadratic: comes when looking at pairs of items given input n
- cubic: enumerate triples of items
- exponential: enumerating all subsets of an item
- factorial: all permutations/ordering of input n

## Working with the Big Oh

In order to determine Big Oh classification from time complexity function
some algebraic manipulation is required.

### Adding functions

Sum of functions is simplified to the dominant one. Remember where are dealing with
growth rate as input n reacher infinity. Which function becomes bigger faster is
the more dominant one.

### Multiplying Functions

Multiplication is repeated addition. Multiplying by constant is meaningless and
irrelevant. Multiplication between functions is transitive, whatever that means
in this context.

## Reasoning Efficiency

Determining time complexity of an algorithm depends on complexity of description
of said algorithm as well as the quality of the implementation.

### Selection Sort

Selection sort is one method of ordering elements in a set from smallest to largest.

```c
void selection_sort(int s[], int n){
  int i;j;
  int min;
  for(i = 0; i < n; i++){ // takes n steps
    min = i; // one step
    for(j =i; j < n; j++){ // n steps
      if(s[j] < s[min]){ // one step
        min = j; // one step
      }
    }
    swap(&s[i], &s[min]); // one step
  }
}
```

Here the problem size n is the number of elements in the array. What this algorithm
does is compare the first item in the array against the remaining items until a new
minimum is reached. After each iteration the number of comparisons is decreased
but is still comparing pairs.

The bigger hint that for array size n, we are looping n times inside each
iteration of i. As such the time complexity of is \\(O(n^2)\\)

#### Proving Theta

This involves looking at the possible inputs. What are the possible inputs of the
insertion sort. Are they sorted in correct or reverse order? Are the perfectly shuffled?

Doing this gets us a Big O of \\(O(n^2) \\) and Big Theta of \\(\Omega(n^2)\\)
since insertion sort takes the same amount of time regardless of how sorted the data
already is.

### Insertion Sort

Best way to determine Big O is finding the largest possible number that fits into
nested loops. Think of the worst case scenarios. Count the number of steps and find
how max number of time a loop can go over.

```c
for(i = 1; i < n;i++){
    j = i;
    while((j > 0) && (s[j] < s[j - 1])){
        swap(&s[j], &s[j-1]);
        j = j-1;
    }
}
```

### String Pattern Matching

String pattern matching is useful when looking for specific information on a webpage.
As such this is implemented on all browsers.

Here is simple implementation.

```c
int find_str_match(char *p, char *t) {
  int i, j;
  int plen, tlen;
  plen = strlen(p);
  tlen = strlen(t);

  for (i = 0; i <= (tlen - plen); i++) {
    j = 0;
    while ((j < plen) && (t[i + j] == p[j])) {
      j++;
    }
    if (j == plen) {
      return i;
    }
  }

  return -1;
}
```

In order to determine the running time we must determine the size n. There are two
character arrays each with size *p* and *t*. Inner loop repeats at most *p* times.
Outer loop repeats *n - m* times. Implementation of `strlen` is as simple as O(n).

So that leaves us with a time complexity of \\(O(p + t + (p-t)p) \\). After some
algebraic shenanigans this is simplified to \\(O(pt) \\)

### Matrix Multiplication

Nested summations occur when dealing with nested loops. This is most apparent in
matrix multiplication.

A matrix multiplication of matrices A and B is defined as the dot product of the
different rows of A and corresponding columns of B. This is usually implemented
with a triple nested for loops.

## Summations

Mathematical summation is notation that denotes the finite or infinite sum of elements
following a pattern.

$$
\sum_{i=1}^{n}f(i)= f(1) + f(2) + .. + f(n)
$$

Some types of summations need to be recognized

- sum of *n* ones is *n*
- sum of power of integers is power
- sum of geometric progression

## Logarithms

[Video](https://youtu.be/9RrdOssuOY4?list=PLOtl7M3yp-DX6ic0HGT0PUX_wiNmkWkXx&t=4045)

Logarithms are the inverse of an exponential function. As x grows, a logarithmic
function grows slower and slower as x reaches infinity.

Binary search is an example of an algorithm that performs in order of a logarithmic
time. Due to the nature of how it works, each time the algorithm fails to find the
key, the number of an item that are then searched is cut in half.

Binary trees is an example of a data structure that has most of its operations
done in logarithmic time.

Logarithms can be used for multiplication and exponentiation by hand. It is done
by using logarithmic identities and replace what ever sections in the equation
with known logarithms, and then they are simplified in order to a nice answer.

One example of an algorithm that works in logarithmic time is this implementation
which raises number `a` to power `n`. It works by reducing the size of an exponent
and computing an equivalent expression instead.

```python
import math
def power(a,n):
  if n == 0:
    return 1
  x = power(a, floor(n/2))
  if is_even(n):
    return x * x
  else:
    return a * x * x
```

`Harmonic Numbers` arise when we sum simple reciprocals. They can be used to analyze
funky behaviors in other functions and algorithms.

One weird example on the way that logs are use is in the United States Federal
sentencing guidelines in which depravity or seriousness of crime has to double
in order for the prison time to increase by one year in some examples. This is
regards to further additions in to prison time.

## Properties of Logarithms

Bases in logarithms can be implicit or explicit. It is the number of which
there is some value x that results in the determined b

$$
\log_a b = x
$$

Here is equation to convert between bases

$$
\log_a b = \frac{\log_c b}{\log_c a}
$$

Using this method it is possible to calculate any log with any base by converting
it to a base e log or any other 'simpler' log.

- The base of logarithm has no significant impact on growth rate as x approaches
  infinity.
- Even if problem size is squared, the increase in time is only doubled

## Advanced Analysis

It is necessary for analyzing the time complexity of algorithms to have some background
and skills in mathematical manipulation and asymptotic analysis.

### Esoteric Functions

There are some additions to the different classes of time complexity

- Inverse Ackerman's function: grows super-duper slowly, but it diverges.
- \\( \log \log\\) this function arises in sorted array of only log n items
- \\( \frac{ \log n}{\log \log n}\\) grows slower than the normal log n
- log squared arise when dealing with nested data structures
- root of n deals in n dimensional geometry math
- \\( n^{1+\epsilon}\\) arises when dealing with arbitrarly small but adjustable
  numbers

### Limits and Dominance Functions

Function *f* dominates *g8 iff the ratio \\(\frac{f(n)}{g(n)}\\) approaches zero
as n grows to infinity.
