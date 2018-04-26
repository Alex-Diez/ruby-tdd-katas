class MatrixTransposer
  def transpose(matrix)
    matrix.size.times { |i| (i + 1).times { |j| swap_items(i, j, matrix) } }
  end

  private

  def swap_items(i, j, matrix)
    temp = matrix[i][j]
    matrix[i][j] = matrix[j][i]
    matrix[j][i] = temp
  end
end
