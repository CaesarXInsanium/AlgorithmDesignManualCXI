import unittest
import nimadm/binary_tree

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
  for i in 0..9:
    t.push(cast[float64](i))
  check t.pop() == 0'f64
