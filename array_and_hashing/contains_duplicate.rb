# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  nums.size != nums.uniq.size
end
