# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  first = get_number(l1)
  second = get_number(l2)
  sum = first + second

  nums = sum.to_s.each_char.to_a
  next_node = nil
  res = []
  
  nums.size.times do |index|
      now_val = nums[nums.size - index - 1]
      res << now_val.to_i
      node = ListNode.new(val: now_val.to_i, _next: next_node)
      next_node = node
  end

  return res
end

def get_number(list_node)
  now = list_node
  number = 0
  index = 0

  while now do
      number += now.val * (10 ** index)

      now = now.next
      index += 1
  end

  number
end
