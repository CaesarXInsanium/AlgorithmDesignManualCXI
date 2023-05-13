import unittest
import std/options
import nimadm/linked_list

test "linked list pop and peek":
  var list = startList(-1i64)
  for i in 0..10:
    list.push(i)
  check list.pop().isSome()
  check list.peek().isSome()

test "linked list len":
  var list: LinkedList[int] = newList[int]()
  check list.len() == 0
  list.push(0)
  check list.peek().get() == 0
  check list.len() == 1

test "linked list append":
  var list = startList(0)
  list.append(-1)
  check list.pop().get() == 0
  check list.pop().get() == -1

  
test "linked list search":
  var list = startList(-1i64)
  for i in 0..10:
    list.push(i)

  var n = list.search(5)
  check n.is_some()
  check n.get() != nil

test "linked list iten_ahead":
  var list = startList(-1i64)
  for i in 0..10:
    list.push(i)

  var n: Option[Node[int64]] = list.search(5)
  check n.is_some()
  var b = list.precursor(n.get())
  check n.get() == b.succesor

test "deletion":
  var list = startList(-1i64)
  for i in 0..10:
    list.push(i)

  var n = list.search(9)
  check n.is_some()
  list.delete(n.get())
  check list.pop().get() == 10
  check list.pop().get() == 8

test "empty list":
  ## generic parameter must be passed
  var l = newList[int]()
