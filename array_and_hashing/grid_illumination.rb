# @param {Integer} n
# @param {Integer[][]} lamps
# @param {Integer[][]} queries
# @return {Integer[]}
def grid_illumination(n, lamps, queries)
  ons = []
  res = []

  lamps.each do |lamp|
    ons += get_ons(lamp[0], lamp[1], n)
  end
  ons.uniq!

  queries.each do |query|
    puts "ons: #{ons}"

    if ons.include?("#{query[0]}#{query[1]}")
      res << 1
    else
      res << 0
    end

    offs = turn_offs(query[0], query[1], n)
    puts "offs: #{offs}"
    ons = ons - offs
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
    if 0 < (col + index) && (col + index) < n
      res << "#{row}#{col + index}"
    end
  end

  [-1, 0, 1].each do |index|
    if 0 < (row + index) && (row + index) < n
      res << "#{row + index}#{col}"
    end
  end

  res << "#{row + 1}#{col + 1}" if 0 < row && row + 1 < n && 0 < col && col + 1 < n
  res << "#{row - 1}#{col - 1}" if 0 < row && row - 1 < n && 0 < col && col - 1 < n
  res << "#{row - 1}#{col + 1}" if 0 < row && row - 1 < n && 0 < col && col + 1 < n
  res << "#{row + 1}#{col - 1}" if 0 < row && row + 1 < n && 0 < col && col - 1 < n

  res
end

def same_rows(row, n)
  (0..n-1).map {|index| "#{row}#{index}"}
end

def same_cols(col, n)
  (0..n-1).map {|index| "#{index}#{col}"}
end

def same_diagonals(row, col, n)
  res = ["#{row}#{col}"]
  next_index = 1

  loop do
    next_diagonal = "#{row + next_index}#{col + next_index}"

    if col + next_index < n || row + next_index < n
      res << next_diagonal
      next_index = next_index + 1
    else
       break
    end
  end

  next_index = -1
  loop do
    next_diagonal = "#{row + next_index}#{col + next_index}"

    if 0 <= col + next_index || 0 <= row + next_index
      res << next_diagonal
      next_index = next_index - 1
    else
       break
    end
  end

  return res.uniq
end

