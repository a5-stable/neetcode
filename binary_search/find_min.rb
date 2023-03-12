# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  min = 0
  max = nums.size - 1

  while min <= max
       mid = ( min + max ) / 2
       tail = nums[mid - 1]
       head = nums[mid]


       if head > tail
           if tail < nums.last
               max = mid - 1
           else
               min = mid + 1
           end
       else
           return head
       end
  end 
end
