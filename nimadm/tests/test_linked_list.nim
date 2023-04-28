import unittest
import nimadm/linked_list

test "linked list pop and peek":
  var list = startList(-1i64)
  for i in 0..10:
    list.push(i)
  check list.peek(-1) == 10
  check list.pop(-1) == 10
  check list.pop(-1) == 9

test "linked list len":
  var list: LinkedList[int] = newList[int]()
  check list.len() == 0
  list.push(0)
  check list.peek(-1) == 0
  check list.len() == 1

test "linked list append":
  var list = startList(0)
  list.append(-1)
  check list.pop(-1) == 0
  check list.pop(-1) == -1

  
test "linked list search":
  var list = startList(-1i64)
  for i in 0..10:
    list.push(i)

  var n = list.search(5)
  check n.unwrap == 5

test "linked list iten_ahead":
  var list = startList(-1i64)
  for i in 0..10:
    list.push(i)

  var n = list.search(5)
  var b = list.precursor(n)
  check n == b.succesor

test "deletion":
  var list = startList(-1i64)
  for i in 0..10:
    list.push(i)

  var n = list.search(9)
  list.delete(n)
  check list.pop(default = -1) == 10
  check list.pop(-1) == 8

test "empty list":
  ## generic parameter must be passed
  var l = newList[int]()
  check l.peek(-1) != 0
  # default value must be passed, and returned if list is empty
  check l.peek(100) == 100
  check l.pop(100) == 100
