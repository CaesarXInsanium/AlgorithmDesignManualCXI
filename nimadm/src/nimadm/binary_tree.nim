import math

type
  TreeNode*[T] = ref object
    left: TreeNode[T]
    right: TreeNode[T]
    value: T
  BinaryTree*[T] = ref object
    root: TreeNode[T]
    size: uint
  EmptyTreeError* = object of Exception
  TreeSide = enum
    Left
    Right

proc newTreeNode[T](value: T): TreeNode[T] =
  ## sample documentation
  result = TreeNode[T](value: value, left: nil, right: nil)

proc insert[T](node: TreeNode[T], other: TreeNode[T]) =
  if other.value < node.value:
    if node.left == nil:
      node.left = other
    else:
      insert(node.left, other)
  elif other.value > node.value:
    if node.right == nil:
      node.right = other
    else:
      insert(node.right, other)

proc delete[T](parent: TreeNode[T], target: TreeNode[T]) =
  var left = target.left
  var right = target.right
  if parent.left == target:
    parent.left = left
    insert(parent.right, right)
  elif parent.right == target:
    parent.right = right
    insert(parent.left, left)
  else:
    raise IOError
  reset(target)



proc search[T](node: TreeNode[T], key: T): TreeNode =
  if node == nil:
    return nil
  if node.value == key:
    return node
  if key < node.value:
    return search(node.left, key)
  else:
    return search(node.right, key)
proc has_children[T](node: TreeNode[T]): bool =
  if node ==nil:
    return false
  else:
    return node.right != nil and node.right != nil

proc height[T](node: TreeNode[T]): uint =
  if node == nil:
    return 0
  else:
    return 1 + max(height(node.left), height(node.right))

proc balanced[T](node: TreeNode[T]): bool =
  if node == nil:
    result = true
  else:
    result = abs(height(node.right) - height(node.left)) > 1

proc balance[T](parent: TreeNode[T], node: TreeNode[T], side: TreeSide) {.deprecated.} =
  if not has_children(node):
    return
      # left is unbalanced
  elif height(node.left) > height(node.right) + 1:
    if balanced(node.right):
      # do normal thins
       
          




proc newBTree*[T](): BinaryTree[T] =
  new result
  result.root = nil
  result.size = 0

proc pop*[T](self: BinaryTree[T]): T {.raises: EmptyTreeError.} =
  if self.root == nil:
    raise newException(EmptyTreeError, "pop operation on empty tree")
  else:
    var left = self.root.left
    var right = self.root.right
    result = self.root.value
    if left == nil:
      self.root = right
      balance(self.root)
    else:
      self.root = left
      insert(left.right, right)

proc empty*[T](self: BinaryTree[T]): bool =
  result = self.root == nil

proc push*[T](self: BinaryTree[T], value: T) =
  var t = newTreeNode(value)
  if self.root == nil:
    self.root = t
  else:
    self.root.insert(t)
    balance(self.root)

proc peek*[T](self: BinaryTree[T]): T {.raises: EmptyTreeError.} =
  if self.root == nil:
    raise newException(EmptyTreeError, "attempted peek")
  else:
    result = self.root.value
