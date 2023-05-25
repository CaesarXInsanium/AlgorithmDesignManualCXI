import unittest
import nimadm/binary_tree
import std/options

test "empty tree":
  var t = newBTree[float64]()
  check t.empty()
  check not t.peek().isSome()

test "pushing elements":
  var t = newBTree[float64]()
  for i in 0..9:
    t.push(cast[float64](i))
  # check t.peek() == 5
  check not t.empty()

test "popping elements":
  var t = newBTree[float64]()
  t.push(455'f64)
  t.push(5'f64)
  t.push(3.141592654'f64)
  
  check t.pop().is_some()
  check t.pop().get() == 5'f64


test "tree is unbalanced":
  var t = newBTree[float64]()
  for i in 0..9:
    t.push(cast[float64](i))
  check not t.is_balanced()

test "tree height":
  var t = newBTree[int]()
  for i in 0..5:
    t.push(i)
  echo $t
  check t.height() == 5
