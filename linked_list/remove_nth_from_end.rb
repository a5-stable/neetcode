# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return [] if head.next.nil?
  length = get_length(head)

  count = 0
  now = head
  remove_target_index = length - n
  while now do
    if count == remove_target_index - 1
      remove_target = now.next
      far = remove_target.next
      now.next = far
      break
    elsif count == remove_target_index
      head = now.next
      break
    else
      now = now.next
      count += 1
    end
  end

  head
end

def get_length(head)
  count = 0
  now = head

  while now do
    count += 1
    now = now.next
  end

  count
end
