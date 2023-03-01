# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  left, right, res = [], [], []
  l, r = 1, 1

  nums.each_index do |i|
    l *= nums[i]
    r *= nums[-i-1]
    left << l
    right.unshift(r)
  end

  nums.size.times do |i|
    if i == 0
      res << right[i+1]
    elsif i == (nums.size - 1)
      res << left[i-1]
    else
      res << left[i-1] * right[i+1]
    end
  end
  res
end
