# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  copies = {}
  
  now = head
  while now
      copies[now] = Node.new(now.val)
      now = now.next
  end
  
  now = head
  while now
      copies[now].next = copies[now.next]
      copies[now].random = copies[now.random]
      now = now.next
  end
  
  copies[head]
end
