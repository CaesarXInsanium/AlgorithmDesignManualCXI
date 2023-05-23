import std/options
type
  TreeNode*[T] = ref object
    left: TreeNode[T]
    right: TreeNode[T]
    value: T
  BinaryTree*[T] = ref object
    root: TreeNode[T]
    size: uint

proc newTreeNode[T](value: T): TreeNode[T] =
  ## sample documentation
  result = TreeNode[T](value: value, left: nil, right: nil)

proc insert[T](node: TreeNode[T], other: TreeNode[T]) =
  assert other != nil
  if node == nil and other == nil:
    echo "insertion with two nil nodes"
    return
  elif other.value < node.value:
    if node.left == nil:
      node.left = other
    else:
      insert(node.left, other)
  elif other.value > node.value:
    if node.right == nil:
      node.right = other
    else:
      insert(node.right, other)
  elif other.value == node.value:
    return

proc rotate_ll[T](node: ptr TreeNode[T]) =
  var n: TreeNode[T] = node[]
  node[] = n.left
  insert(node[], n)

proc rotate_rr[T](node: ptr TreeNode[T]) =
  var n: TreeNode[T] = node[]
  node[] = n.right
  insert(node[], n)

proc rotate_lr[T](nodeptr: ptr TreeNode[T]) =
  var node: TreeNode[T] = nodeptr[]
  nodeptr[] = node.left.right
  nodeptr.right = node.right
  insert(nodeptr[], node)

proc rotate_rl[T](nodeptr: ptr TreeNode[T]) =
  var node: TreeNode[T] = nodeptr[]
  nodeptr[] = node.right.left
  nodeptr.left = node.left
  insert(nodeptr[], node)


proc delete[T](parent: TreeNode[T], target: TreeNode[T]) =
  if target == nil:
    return
  var left = target.left
  var right = target.right
  if parent.left == target:
    parent.left = left
    insert(parent.right, right)
  elif parent.right == target:
    parent.right = right
    insert(parent.left, left)
  reset(target)



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

proc height[T](node: TreeNode[T]): int =
  if node == nil:
    return 0
  else:
    return 1 + max(height(node.left), height(node.right))

proc balanced[T](node: TreeNode[T]): bool =
  ## returns true if children on target node are balanced, enum is ignored
  ## if false TreeSide enum will determine which side is bigger
  if node == nil:
    return true
  else:
    var num = height(node.right) - height(node.left)
    if num > 2:
      return false
    elif num < (-2):
      return false
    else:
      return true

proc balance[T](node: ptr TreeNode[T]) =
  # does this function check if thing are balanced and then
  echo "Balance is doing nothing"



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

proc pop*[T](self: var BinaryTree[T]): Option[T]  =
  if self.root == nil:
    return none(T)
  else:
    var left = self.root.left
    var right = self.root.right
    result = some(self.root.value)
    if left == nil and right != nil:
      rotate_rr(self.root.addr)
    elif left != nil and right != nil:
      rotate_ll(self.root.addr)
    elif left == nil and right == nil:
      self.root = nil
    else:
      var r = self.root
      self.root = left
      insert(self.root, right)
      reset(r)


proc empty*[T](self: BinaryTree[T]): bool =
  result = self.root == nil

proc push*[T](self: BinaryTree[T], value: T) =
  var node = newTreeNode[T](value)
  if self.root == nil:
    self.root = node
  else:
    insert(self.root, node)

proc peek*[T](self: BinaryTree[T]): Option[T] =
  if self.root == nil:
    return none(T)
  else:
    result = some(self.root.value)

proc is_balanced*[T](self: BinaryTree[T]): bool =
  return balanced(self.root)
