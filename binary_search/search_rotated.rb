# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  head_index = head_index(nums)

  former = nums[0..head_index - 1]
  latter = nums[head_index..nums.length - 1]

  former_search = binary_search(former, target)
  return former_search if former_search != -1

  latter_search = binary_search(latter, target)
  return latter_search == -1 ? -1 : latter_search + head_index
end

private

def binary_search(nums, target)
 i, j = 0, nums.size - 1
 while i <= j
   mid = (i + j)/2
   if target == nums[mid]
     return mid
   elsif nums[mid] > target
     j = mid - 1
   else
     i = mid + 1
   end
 end
 return -1
end

def head_index(nums)
 min = 0
 max = nums.size - 1
 head_index = -1

 while min <= max
   mid = (min + max) / 2
   tail = nums[mid - 1]
   head = nums[mid]

   if head > tail
     if tail < nums.last
       max = mid - 1
     else
       min = mid + 1
     end
   else
     return mid
   end
 end

 return mid
end
