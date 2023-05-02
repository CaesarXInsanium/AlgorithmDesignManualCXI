import unittest
import nimadm/rawlist

test "new raw list":
  var l = newRawList[float32]()
  var ll = l.addr
  ll.push(1.0'f32)
  var peeked: ptr float32 = ll.peek()
  check peeked[] == 1.0
  var (sucess, popped) = ll.pop(-1)
  check popped == 1.0
  check sucess
