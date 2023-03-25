class TimeMap
  def initialize()
      @hash = {}
  end


=begin
  :type key: String
  :type value: String
  :type timestamp: Integer
  :rtype: Void
=end
  def set(key, value, timestamp)
      @hash[key] ||= {}
      @hash[key][timestamp] = value
  end


=begin
  :type key: String
  :type timestamp: Integer
  :rtype: String
=end
  def get(key, timestamp)
      choice = @hash.dig(key) || {}
      min = Float::INFINITY
      now = nil

      choice.each do |k, v|
          diff = timestamp - k
          if diff < min && diff >= 0
              min = diff
              now = k
          end
      end

      now.nil? ? "" : choice[now]
  end


end

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap.new()
# obj.set(key, value, timestamp)
# param_2 = obj.get(key, timestamp)
