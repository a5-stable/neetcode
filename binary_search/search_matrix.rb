# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  output = false

  # dimension
  m = matrix.size
  n = matrix[0].size

  # tester
  row_left = 0
  row_right = m - 1

  while row_left <= row_right
      row_mid = (row_left + row_right) / 2


      if target < matrix[row_mid][0]
          row_right = row_mid - 1
      elsif target > matrix[row_mid][n - 1]
          row_left = row_mid + 1
      else
          res = binary_search(matrix[row_mid], target)
          output = res != -1
          break
      end
  end

  output
end


def binary_search(row, target)
  index = -1
  left, right = 0, row.size - 1

  while left <= right
    mid = (left + right) / 2
    if row[mid] == target
      index = mid
      break
    elsif row[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end

  index
end
