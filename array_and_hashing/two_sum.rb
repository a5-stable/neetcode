# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  cache = {}
  nums.each_with_index do |num, index|
    sub = target - num
    if cache[sub]
      return [cache[sub], index]
    else
      cache[num] = index
    end
  end
end
