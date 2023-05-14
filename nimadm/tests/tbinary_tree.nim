import unittest
import nimadm/binary_tree
import std/options

test "empty tree":
  var t = newBTree[float64]()
  check t.empty()
  expect EmptyTreeError:
    var p = t.peek() 

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
  
  # for i in 0..9:
  #   t.push(cast[float64](i))


test "tree is unbalanced":
  var t = newBTree[float64]()
  for i in 0..9:
    t.push(cast[float64](i))
  check not t.is_balanced()
