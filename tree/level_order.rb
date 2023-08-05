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
# @return {Integer[][]}
def level_order(root)
  hash = {}
  return [] if root.nil?
  aligner(root, hash, 0)

  hash.values
end

def aligner(node, hash, now_index)
  return hash if node.nil?
  hash[now_index] ||= []
  hash[now_index] << node.val

  aligner(node&.left, hash, now_index + 1)
  aligner(node&.right, hash, now_index + 1)

  hash
end
