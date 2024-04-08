type
  Node*[T] = object
    next: ptr Node[T]
    value: T

  LinkedList*[T] = object
    head: ptr Node[T]
    size: uint

proc newNode[T](data: T): ptr Node[T] =
  ## Allocates new pointer opject on the heap
  result = cast[ptr Node[T]](alloc0(sizeof(Node[T])))
  result.value = data
  result.next = nil


proc newRawList*[T](): LinkedList[T] =
  result = LinkedList[T](head: nil, len: 0)

proc push*[T](self: ptr LinkedList[T], data: T) =
  var n = newNode[T](data)
  n[].next = self[].head
  self.head = n

proc peek*[T](self: ptr LinkedList[T]): ptr T =
  if self.head == nil:
    return nil
  else:
    result =  self.head.value.addr

proc pop*[T](self: ptr LinkedList[T], default: T): (bool, T) =
  var to_delete: ptr Node[T] = self.head
  var next = self.head.next
  if self.head == nil:
    return (false, default)
  else:
    var data = to_delete.value
    self.head = next
    reset(to_delete)
    return (true, data)


proc newLinkedList[T](): ptr LinkedList[T] = 
  result = cast[ptr LinkedList[T]](alloc0(sizeof(LinkedList[T])))
  result.head = nil
  result.size = 0

when isMainModule:
  echo "Hello World!"
  var list  = newLinkedList[int]()
