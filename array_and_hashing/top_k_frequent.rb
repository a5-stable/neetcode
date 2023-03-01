# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  nums.tally.sort { |(k, v), (k2, v2)| v2 <=> v }.to_h.keys.first(k)
end
