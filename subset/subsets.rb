# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  result = [[]]  # Initialize with an empty subset
  
  nums.each do |num|
      new_subsets = []
      result.each do |subset|
          new_subsets << subset + [num]  # Add the current number to existing subsets
      end
      result += new_subsets
  end
  
  return result
end
