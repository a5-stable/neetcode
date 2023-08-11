def is_valid_bst(root)
  return true if root.nil?
  is_valid_bst_helper(root, -Float::INFINITY, Float::INFINITY)
end

def is_valid_bst_helper(node, min_val, max_val)
  return true if node.nil?
  
  if node.val <= min_val || node.val >= max_val
      return false
  end
  
  left_valid = is_valid_bst_helper(node.left, min_val, node.val)
  right_valid = is_valid_bst_helper(node.right, node.val, max_val)
  
  left_valid && right_valid
end
