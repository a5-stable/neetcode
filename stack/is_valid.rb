### First Solution
# @param {String} s
# @return {Boolean}
def is_valid(s)
  array = s.chars
  parent_stack = []
  res = true

  loop do
    str = array.shift

    if str.nil?
      break
    end

    if end?(str)
      now_parent = parent_stack.pop
      unless match?(now_parent, str)
          res = false
          break
      end
    else
      parent_stack << str
    end
  end

  res = false if parent_stack.size > 0

  res
end

def end?(str)
  ["}", "]", ")"].include?(str)
end

def match?(s, e)
  case s
  when "{"
    return e == "}"
  when "("
    return e == ")"
  when "["
    return e == "]"
  end
end

### https://leetcode.com/problems/valid-parentheses/solutions/491448/simple-ruby-solution/?orderBy=most_votes&languageTags=ruby
# @param {String} s
# @return {Boolean}
def is_valid(s)
  return true if s.empty?
  
  stack = []
  s.each_char do |c|
      case c
      when '(', '{', '['
          stack.push(c)
      when ')'
          return false if stack.pop() != '('
      when '}'
          return false if stack.pop() != '{'
      when ']'
          return false if stack.pop() != '['
      end
  end
  return stack.empty?
end

### refactor

def is_valid(s)
  return true if s.empty?

  stack = []
  s.each_char do |c|
    if open?(c)
      stack << c
    else
      return false unless match?(stack.pop, c)
    end
  end

  return stack.empty?
end

def open?(str)
  ["{", "[", "("].include?(str)
end

def match?(s, e)
  case s
  when "{"
    return e == "}"
  when "("
    return e == ")"
  when "["
    return e == "]"
  end
end
