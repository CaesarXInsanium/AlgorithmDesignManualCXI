type
  TreeNode*[T] = ref object
    left: TreeNode[T]
    right: TreeNode[T]
    data: T
  BinaryTree*[T] = ref object
    root: TreeNode[T]
    size: uint

proc newTreeNode[T](data: T): TreeNode[T] = 
  result = TreeNode[T](data: data, left: nil, right: nil)

proc insert[T](node: TreeNode[T], new: TreeNode[T]) =
  if new.data < node.data:
    if node.left == nil:
      node.left = new
    else:
      insert(node.left, new)
  else if new.data > node.data:
    if node.right == nil:
      node.right = new
    else:
      insert(node.right, new)


proc newBTree[T](): BinaryTree[T] =
  new result
  result.root = nil
  result.size = 0

proc push[T](self: BinaryTree[T], data: T) =
  var t = newTreeNode(data)
  if self.root == nil:
    self.root = t
  else:
    self.root.insert(t)

proc peek[T](self: BinaryTree)
