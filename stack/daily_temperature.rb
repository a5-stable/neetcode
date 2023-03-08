# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  ans = Array.new(temperatures.length, 0)
  stack = []

  temperatures.each_with_index do |t, i|
     loop do
        if stack.empty? || stack.last[:t] >= t
          stack << {t:t, i:i}
          break
        else
          pop = stack.pop
          ans[pop[:i]] = i - pop[:i]
        end
     end
  end

  ans
end
