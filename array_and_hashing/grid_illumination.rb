# @param {Integer} n
# @param {Integer[][]} lamps
# @param {Integer[][]} queries
# @return {Integer[]}
def grid_illumination(n, lamps, queries)
  ons = {}
  res = []

  lamps.each do |lamp|
    ons["#{lamp[0]}#{lamp[1]}"] = get_ons(lamp[0], lamp[1], n)
  end
  a = {
    25 => ["20", "21", "22", "23", "24", "25", "05", "15", "35", "45", "55", "14", "03", "34", "43", "52"],
03 => ["00", "01", "02", "03", "04", "05", "13", "23", "33", "43", "53", "14", "25", "12", "21", "30"],
05 => ["00", "01", "02", "03", "04", "05", "15", "25", "35", "45", "55", "14", "23", "32", "41", "50"],
14 => ["10", "11", "12", "13", "14", "15", "04", "24", "34", "44", "54", "03", "25", "05", "23", "32", "41", "50"],
10 => ["10", "11", "12", "13", "14", "15", "00", "20", "30", "40", "50", "21", "32", "43", "54", "01"],
  }.values.flatten.uniq

  queries.each do |query|
    if ons.values.flatten.include?("#{query[0]}#{query[1]}")
      res << 1
    else
      res << 0
    end
    ons.delete("#{query[0]}#{query[1]}")

    offs = turn_offs(query[0], query[1], n)
    offs.each do |off|
      ons.delete("#{off[0]}#{off[1]}")
    end
  end

  return res
end

private

def get_ons(row, col, n)
  ( same_rows(row, n).to_a + same_cols(col, n).to_a + same_diagonals(row, col, n).to_a ).uniq
end

def turn_offs(row, col, n)
  res = []
  [-1, 0, 1].each do |index|
    [-1, 0, 1].each do |sub_index|
      next if index == 0 && sub_index == 0
      next if row + index < 0 || row + index >= n || col + index < 0 || col + index >= n
      res << "#{row + index}#{col + sub_index}"
    end
  end

  res
end

def same_rows(row, n)
  (0..n-1).map {|index| "#{row}#{index}"}
end

def same_cols(col, n)
  (0..n-1).map {|index| "#{index}#{col}"}
end

def same_diagonals(row, col, n)
  cells = []
  # 左上方向
  r = row - 1
  c = col - 1
  while r >= 0 && c >= 0
    cells << "#{r}#{c}"
    r -= 1
    c -= 1
  end
  # 右下方向
  r = row + 1
  c = col + 1
  while r < n && c < n
    cells << "#{r}#{c}"
    r += 1
    c += 1
  end
  # 右上方向
  r = row - 1
  c = col + 1
  while r >= 0 && c < n
    cells << "#{r}#{c}"
    r -= 1
    c += 1
  end
  # 左下方向
  r = row + 1
  c = col - 1
  while r < n && c >= 0
    cells << "#{r}#{c}"
    r += 1
    c -= 1
  end

  cells.uniq
end

