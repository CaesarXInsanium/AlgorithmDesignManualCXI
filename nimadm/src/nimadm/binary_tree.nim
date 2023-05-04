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

proc insert[T](node: TreeNode[T], other: TreeNode[T]): TreeSide =
  if other.value < node.value:
    result = TreeSide.Left
    if node.left == nil:
      node.left = other
    else:
      discard insert(node.left, other)
  elif other.value > node.value:
    result = TreeSide.Right
    if node.right == nil:
      node.right = other
    else:
      discard insert(node.right, other)
  elif other.value == node.value:
    return TreeSide.Left

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

proc height[T](node: TreeNode[T]): int =
  if node == nil:
    return 0
  else:
    return 1 + max(height(node.left), height(node.right))

proc balanced[T](node: TreeNode[T]): (bool, TreeSide) =
  ## returns true if children on target node are balanced, enum is ignored
  ## if false TreeSide enum will determine which side is bigger
  if node == nil:
    return (true, TreeSide.Right)
  else:
    var num = height(node.right) - height(node.left)
    if num > 2:
      return (false, TreeSide.Right)
    elif num < (-2):
      return (false, TreeSide.Left)
    else:
      return (true, TreeSide.Right)

proc balance[T](parent: TreeNode[T], node: TreeNode[T], side: TreeSide) =
  # balancing the root
  var (t,sid) = balanced(node)
  if t:
    return
  else:
    case sid:
      of TreeSide.Left: balance(node, node.left, sid)
      of TreeSide.Right: balance(node, node.right, sid)
  case side:
    of TreeSide.Left:
      echo "Left Side is Unbalanced"
      if node.left.right == nil and node.left.left != nil:
        var n = node
        parent.left = node.left
        parent.left.left = n
      elif node.left.left == nil and node.left.right != nil:
        var n = node
        parent.left = node.left.right
        parent.left.right = n
        parent.left.left = n.left
      else:
        balance(node, node.left, TreeSide.Left)

    of TreeSide.Right:
      echo "Right Side is Unbalanced"
      if node.right == nil:
        echo "This Should not be happening" 
      elif node.right.left == nil and node.right.right != nil:
        var n = node
        parent.right = node.right
        parent.right.right = n
      elif node.right.right == nil and node.right.left != nil:
        var n = node
        parent.right = node.right.left
        parent.right.left = n
        parent.right.right = n.right
      else:
        balance(node, node.right, TreeSide.Right)

proc `$`[T](self: TreeNode[T]): string =
  if self == nil:
    return "nil"
  else:
    return "Self {\nvalue: " & $self.value & "\nright: " & $self.right &
        "\nleft: " & $self.left & "\n}"


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
    if left == nil and right != nil:
      var rl = right.left
      var rr = right.right
      self.root = right
      self.root.left = rl
      self.root.right = rr
    elif left != nil and right != nil:
      self.root = left
      discard insert(left.right, right)
      balance(self.root, self.root.right, TreeSide.Right)
    else:
      result = self.root.value
      var r = self.root
      self.root = nil
      reset(r)


proc empty*[T](self: BinaryTree[T]): bool =
  result = self.root == nil

proc push*[T](self: BinaryTree[T], value: T) =
  var t = newTreeNode(value)
  if self.root == nil:
    self.root = t
  else:
    var s = self.root.insert(t)
    balance(self.root, self.root.right, s)

proc peek*[T](self: BinaryTree[T]): T {.raises: EmptyTreeError.} =
  if self.root == nil:
    raise newException(EmptyTreeError, "attempted peek")
  else:
    result = self.root.value

proc is_balanced*[T](self: BinaryTree[T]): bool =
  var (b, t) = balanced(self.root)
  return b
