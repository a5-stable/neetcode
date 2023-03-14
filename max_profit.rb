# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  min = prices[0]
  output = 0

  prices.each do |price|
      if price < min
          min = price
      end

      if price - min > output
          output = price - min 
      end
  end

 output
end
