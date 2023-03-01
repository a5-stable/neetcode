# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  res = true
  mapping = {}
  box_mapping = {}
  col_mapping = {}

  board.each_with_index do |row, index|
     strs = []
     row.each_with_index do |str, sub_index|
        if str == "."
        else
          mapping[index] ||= []
          mapping[index] << str

          box_index = box_index(index, sub_index)
          box_mapping[box_index] ||= []
          box_mapping[box_index] << str

          col_mapping[sub_index] ||= []
          col_mapping[sub_index] << str

          strs << str
        end
     end

     if strs.size != strs.uniq.size
        res = false
        break
     end
  end

  if res
      mapping.values.each do |map|
          if map.uniq.size != map.size
              res = false
              break
          end
      end

     box_mapping.values.each do |map|
          if map.uniq.size != map.size
              res = false
              break
          end
      end

      col_mapping.values.each do |map|
          if map.uniq.size != map.size
              res = false
              break
          end
      end
  end

  res
end

private

def box_index(row, col)
 return 1 if row <= 2 && col <= 2
 return 2 if row <= 2 && col <= 5
 return 3 if row <= 2 && col <= 8
 return 4 if row <= 5 && col <= 2
 return 5 if row <= 5 && col <= 5
 return 6 if row <= 5 && col <= 8
 return 7 if row <= 8 && col <= 2
 return 8 if row <= 8 && col <= 5
 return 9 if row <= 8 && col <= 8
end

# TODO::refactor
