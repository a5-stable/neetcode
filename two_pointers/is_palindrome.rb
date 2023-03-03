# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  alphanumeric_str = s.gsub(/[^a-zA-Z\d]/, "").downcase
  alphanumeric_str.reverse == alphanumeric_str
end
