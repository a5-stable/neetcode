def check_inclusion(s1, s2)
  return false if s1.length > s2.length

  h = Hash.new(0)
  s1.each_char { |c| h[c] += 1 }

  s2.each_char.with_index do |c, i|
    h[c] -= 1
    h[s2[i - s1.length]] += 1 if i >= s1.length # 2

    return true if h.values.all?(0)
  end

  false
end
