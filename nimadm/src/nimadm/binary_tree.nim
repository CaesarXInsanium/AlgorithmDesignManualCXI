import std/options
type
  TreeNode*[T] = ref object
    left: TreeNode[T]
    right: TreeNode[T]
    height: int
    value: T
  BinaryTree*[T] = ref object
    root: TreeNode[T]
    size: uint

proc newTreeNode[T](value: T): TreeNode[T] =
  ## sample documentation
  result = TreeNode[T](value: value, left: nil, right: nil, height: 0)

proc most_left_child[T](self: TreeNode[T]): TreeNode[T] =
  if self.left == nil:
    return self
  else:
    return most_left_child(self.left)

proc most_right_child[T](self: TreeNode[T]): TreeNode[T] =
  if self.right == nil:
    return self
  else:
    return most_right_child(self.right)


proc get_height*[T](self: TreeNode[T]): int =
  if self == nil:
    return 0
  else:
    return self.height

proc update_height[T](self: TreeNode[T]) =
  self.height = 1 + max(get_height(self.right), get_height(self.left))

proc rotate_right[T](self: TreeNode[T]): TreeNode[T] =
  var x = self.left
  var z = x.right
  x.right = self
  self.left = z
  update_height(self)
  update_height(x)
  return x

proc rotate_left[T](self: TreeNode[T]): TreeNode[T] =
  var x = self.right
  var z = x.left
  x.right = self
  self.left = z
  update_height(self)
  update_height(x)
  return x

proc get_balance[T](self: TreeNode[T]): int = 
  if self == nil:
    return 0
  else:
    get_height(self.right) - get_height(self.left)

proc rebalance[T](z: TreeNode[T]): TreeNode[T] = 
  update_height(z)
  var balance = get_balance(z)

  if balance > 1:
    if (get_height(z.right.right) > get_height(z.right.left)):
      z = rotate_left(z)
    else:
      z.right = rotate_right(z.right)
      z = rotate_left(z)
  elif balance < -1:
    if (get_height(z.left.left) > get_height(z.left.right)):
      z = rotate_right(z)
    else:
      z.left = rotate_left(z.left)
      z = rotate_right(z)
  return z

proc insert[T](node: TreeNode[T], value: T): TreeNode[T] =
  if node == nil:
    return newTreeNode[T](value)
  elif (node.value > value):
    node.left = insert(node.left, value)
  elif (node.value < value):
    node.right = insert(node.right, value)
  else:
    echo "Duplicate value"
  return rebalance(node)

proc delete[T](node: TreeNode[T], key: T): TreeNode[T] =
  if node == nil:
    return node
  elif node.value > key:
    node.left = delete(node.left, key)
  elif node.value < key:
    node.right = delete(node.right, key)
  else:
    if node.left == nil or node.right == nil:
      var node: TreeNode[T]
      if node.left == nil:
        node = node.right
      else:
        node = node.left
    else:
      var most_left = most_left_child(node.right)
      node.value = most_left.value
      node.right = delete(node.right, node.key)

  if node != nil:
    node = rebalance(node)
  return node



proc search[T](node: TreeNode[T], key: T): Option[TreeNode] =
  if node == nil:
    return none(T)
  if node.value == key:
    return some(node)
  if key < node.value:
    return search(node.left, key)
  else:
    return search(node.right, key)

proc has_children[T](node: TreeNode[T]): bool =
  if node == nil:
    return false
  else:
    return node.right != nil and node.right != nil



proc balanced[T](node: TreeNode[T]): bool =
  if node.right == nil or node.left == nil:
    return true
  elif node.right != nil and node.left != nil:
    return abs(node.right.height - node.left.height) > 1

  ## returns true if children on target node are balanced, enum is ignored
  ## if false TreeSide enum will determine which side is bigger

proc balance[T](node: ptr TreeNode[T]) =
  # does this function check if thing are balanced and then
  echo "Balance is doing nothing"



proc `$`[T](self: TreeNode[T]): string =
  if self == nil:
    return "nil"
  else:
    return "TreeNode {\nvalue: " & $self.value & "\n\tright: " & $self.right &
        "\tleft: " & $self.left & "\n}"


proc newBTree*[T](): BinaryTree[T] =
  new result
  result.root = nil
  result.size = 0

proc pop*[T](self: var BinaryTree[T]): Option[T] =
  if self.root == nil:
    return none(T)
  else:
    result = some(self.root.value)
    self.root = delete(self.root, self.root.value)


proc empty*[T](self: BinaryTree[T]): bool =
  result = self.root == nil

proc push*[T](self: BinaryTree[T], value: T) =
  self.root = insert(self.root, value)

proc peek*[T](self: BinaryTree[T]): Option[T] =
  if self.root == nil:
    return none(T)
  else:
    result = some(self.root.value)

proc is_balanced*[T](self: BinaryTree[T]): bool =
  return balanced(self.root)

proc height*[T](self: BinaryTree[T]): int =
  return self.root.height

proc `$`*[T](self: BinaryTree[T]): string =
  result ="Tree -> size: " & $self.size & "\nHead: \t" & $self.root
