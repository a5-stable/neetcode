# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  cache = {}
  strs.each do |str|
    key = str.chars.sort
    if cache[key]
      cache[key] << str
    else
      cache[key] = [str]
    end
  end

  cache.values
  # strs.group_by { |str| str.chars.sort }.values
end
