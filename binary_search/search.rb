# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  length = nums.size
  index = -1

  loop do
    search_index = length / 2
    challenge = nums[search_index]
    
    if challenge == target
      break
    end
  end
end
