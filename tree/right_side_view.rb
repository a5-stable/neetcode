# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  hash = {}
  return [] if root.nil?
  lv_order(root, hash, 0)

  hash.values
end

def lv_order(node, hash, level)
  return hash if node.nil?
  hash[level] ||= node.val

  lv_order(node&.right, hash, level + 1)
  lv_order(node&.left, hash, level + 1)

  hash
end
