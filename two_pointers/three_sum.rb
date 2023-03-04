# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  res = []

  nums.sort!
  nums.each_with_index do |num, index|
     left = index + 1
     right = nums.length - 1

    loop do
      break if left >= right

      calc = num + nums[left] + nums[right]

      case calc <=> 0
      when 1
          right -= 1
      when -1
          left += 1
      when 0
          res << [num, nums[left], nums[right]]
          left += 1
          left += 1 while nums[left] == nums[left - 1] && left < right
      end
    end
  end

  res.uniq
end
