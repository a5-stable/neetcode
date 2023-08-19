def build_tree(preorder, inorder)
  return nil if preorder.empty? || inorder.empty?
  
  root_val = preorder.shift
  root = TreeNode.new(root_val)
  root_index = inorder.index(root_val)
  
  root.left = build_tree(preorder, inorder[0...root_index])
  root.right = build_tree(preorder, inorder[root_index + 1..-1])
  
  return root
end
