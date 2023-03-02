# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  return 0 if nums.size == 0
  nums.sort!.uniq!
  return 1 if nums.size == 1

  key = 0
  res = {}
  prev = nil
  
  nums.each_with_index do |num, index|
      res[key] ||= [num]

     if prev.nil? || prev + 1 == num
        res[key] << num
        prev = num

      else
        key += 1
        prev = num
        res[key] = [num]
     end

  end

  res.values.map {|value| value.uniq.size }.max
end

# !set.include?(num-1)
# 連続する数の最小をまず見つける
# 最小を見つけたら、長さを求める
# 長さの最大で置き換えていく
def longest_consecutive2(nums)
  set = nums
  set.reduce(0) do |longest, num|
      if !set.include?(num-1)
          length = 0
          while set.include?(num + length) do
              length += 1
          end
          next(longest > length ? longest : length)
      end

      longest
  end
end
