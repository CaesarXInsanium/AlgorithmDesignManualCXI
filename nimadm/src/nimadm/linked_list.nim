type
  Node*[T] = ref object
    next: Node[T]
    data: T

  LinkedList*[T] = ref object
    head: Node[T]
    size: uint

proc newNode[T](data: T): Node[T] =
  result = Node[T](next: nil, data: data)

proc unwrap*[T](self: Node[T]): T =
  return self.data

proc succesor*[T](self: Node[T]): Node[T] = 
  result = self.next

proc precursor*[T](self: LinkedList[T], b: Node[T]): Node[T] =
  if self.head == nil or b == nil:
    return nil
  var cursor = self.head
  while cursor.next != b:
    cursor = cursor.next
  
  if cursor != nil:
    result = cursor
  else:
    result = nil

proc startList*[T](data: T): LinkedList[T] = 
  var head = newNode(data)
  result = LinkedList[T](head: head, size: 1)

proc newList*[T](): LinkedList[T] =
  new result
  result.head = nil
  result.size= 0


proc push*[T](self: LinkedList[T], data: T) = 
  var n = newNode(data)
  n.next = self.head
  self.head = n

  self.size = self.size + 1

proc pop*[T](self: LinkedList[T], default: T): T =
  if self.head == nil:
    return default
  result = self.head.data
  self.head = self.head.next
  self.size = self.size - 1


proc peek*[T](self: LinkedList[T], default: T): T =
  ## must provide default value in case that list is empty
  if self.head != nil:
     result = self.head.data
  else:
    result = default

proc append*[T](self: LinkedList[T], data: T) =
  var cursor = self.head
  while cursor.next != nil:
    cursor = cursor.next

  var n = newNode(data)
  cursor.next = n

proc search*[T](self: LinkedList[T], key: T): Node[T] = 
  var cursor = self.head
  while cursor != nil and cursor.data != key:
    cursor = cursor.next
  result = cursor

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
    result = result & "Item: { " & $cursor.data & "}, "
    cursor = cursor.next
  return result



