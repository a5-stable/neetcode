# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1 if n.zero?
  return 1 / my_pow(x, -n) if n.negative?
  return x * my_pow(x, n - 1) if n.odd?

  my_pow(x * x, n / 2)
end
