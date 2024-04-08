import std/options

type
  Node*[T] = ref object
    next: Node[T]
    value: T

  LinkedList*[T] = ref object
    head: Node[T]
    size: uint

proc newNode[T](value: T): Node[T] =
  result = Node[T](next: nil, value: value)

proc unwrap*[T](self: Node[T]): T =
  return self.value

proc succesor*[T](self: Node[T]): Node[T] = 
  # This can return a null ref
  result = self.next

proc precursor*[T](self: LinkedList[T], b: Node[T]): Node[T] =
  ## This can return a null ref
  if self.head == nil or b == nil:
    return nil
  var cursor = self.head
  while cursor.next != b:
    cursor = cursor.next
  
  if cursor != nil:
    result = cursor
  else:
    result = nil

proc startList*[T](value: T): LinkedList[T] = 
  var head = newNode(value)
  result = LinkedList[T](head: head, size: 1)

proc newList*[T](): LinkedList[T] =
  new result
  result.head = nil
  result.size= 0


proc push*[T](self: LinkedList[T], value: T) = 
  var n = newNode(value)
  n.next = self.head
  self.head = n

  self.size = self.size + 1

proc pop*[T](self: LinkedList[T]): Option[T] =
  if self.head == nil:
    return none(T)
  result = some(self.head.value)
  self.head = self.head.next
  self.size = self.size - 1


proc peek*[T](self: LinkedList[T] ): Option[T] =
  if self.head == nil:
    none(T)
  else:
    some(self.head.value)

proc append*[T](self: LinkedList[T], value: T) =
  if self.head == nil:
    self.push(value)
  else:

    var cursor = self.head
    while cursor.next != nil:
      cursor = cursor.next

    var n = newNode(value)
    cursor.next = n

proc search*[T](self: LinkedList[T], key: T): Option[Node[T]] = 
  if self.head == nil:
    return none(Node[T])
  else:
    var cursor = self.head
    while cursor != nil and cursor.value != key:
      cursor = cursor.next
    if cursor.value == key:
      return some(cursor)
    else:
      return none(Node[T])

proc len*[T](self: LinkedList[T]): uint =
  result = self.size


proc delete*[T](self: LinkedList[T], node: var Node[T]) =
  var before = self.precursor(node)
  before.next = node.next
  self.size = self.size - 1
  # reset function will tell garbage collector that this node is no londer needed
  reset(node)

proc `$`[T](self: LinkedList[T]): string =
  result = "LinkedList: "
  var cursor = self.head
  while cursor != nil:
    result = result & "Item: { " & $cursor.value & "}, "
    cursor = cursor.next
  return result
