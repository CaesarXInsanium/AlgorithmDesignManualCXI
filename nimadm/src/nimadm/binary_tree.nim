type
  TreeNode*[T] = ref object
    left: TreeNode[T]
    right: TreeNode[T]
    value: T
  BinaryTree*[T] = ref object
    root: TreeNode[T]
    size: uint

proc newTreeNode[T](value: T): TreeNode[T] = 
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

proc search[T](node: TreeNode[T], key: T): TreeNode =
  if node == nil:
    return nil
  if node.value == key:
    return node
  if key < node.value:
    return search(node.left, key)
  else:
    return search(node.right, key)

proc height[T](node: TreeNode[T]): uint =
  if node == nil:
    return 0
  else:
    return 1 + max(height(node.left), height(node.right))

proc balance[T](node: TreeNode[T]) =
  if height(node.right) > height(node.left) + 1:
    #implement the parent node
    raise IOError


proc newBTree*[T](): BinaryTree[T] =
  new result
  result.root = nil
  result.size = 0

proc pop*[T](self: BinaryTree[T], default: T): T=
  if self.root == nil:
    return default
  else:
    var left = self.root.left
    var right = self.root.right
    result = self.root.value
    raise IOError


proc push*[T](self: BinaryTree[T], value: T) =
  var t = newTreeNode(value)
  if self.root == nil:
    self.root = t
  else:
    self.root.insert(t)

proc peek*[T](self: BinaryTree[T], default: T): T =
  if self.root == nil:
    result = default
  else:
    result = self.root.value

