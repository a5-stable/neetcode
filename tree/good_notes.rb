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
# @return {Integer}
def good_nodes(root)
  count_goods(root, -Float::INFINITY)
end

def count_goods(node, challenger)
  return 0 if node.nil?

  is_good = node.val >= challenger
  next_challenger = [node.val, challenger].max

  l_good_count = count_goods(node.left, next_challenger)
  r_good_count = count_goods(node.right, next_challenger)

  good_count = l_good_count + r_good_count

  is_good ? good_count + 1 : good_count
end

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
# @return {Integer}
def good_nodes(root)
  winners = goods(root, [], [])
  puts winners.map(&:val)
  winners.size
end

def goods(node, challengers, winners)
  return winners if node.nil?

  winners << node if challengers.all? {|challenger| node.val >= challenger.val }
  new_challengers = challengers + [node]

  goods(node.left, new_challengers, winners)
  goods(node.right, new_challengers, winners)
end
