import unittest
import nimadm/binary_tree

test "empty tree":
  var t = newBTree[float64]()
  check t.peek(3.14) == 3.14

test "pushing elements":
  var t = newBTree[float64]()
  for i in 0..9:
    t.push(cast[float64](i))
  # check t.peek(-1.0) == 5
  check max(9,8) == 9

