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
# @return {Boolean}
def is_balanced(root)
  max_depth(root)[1]
end

def max_depth(node)
 return [0, true] if node.nil?
 return [1, true] if node.left.nil? && node.right.nil?

 l_max, l_res = max_depth(node.left)
 r_max, r_res = max_depth(node.right)

 res = !l_res || !r_res ? false : (l_max - r_max).abs <= 1

 [[l_max, r_max].max + 1, res]
end
