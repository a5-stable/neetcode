# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
    now = head
    dict = {}

    while now do
        if dict[now]
            return true
        else
            dict[now] = true
        end
        
        now = now.next
    end

    false
end
