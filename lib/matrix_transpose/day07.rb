class MatrixTransposer
  def transpose(matrix)
    (matrix.size - 1).times { |i| (i + 1).times { |j| swap(i + 1, j, matrix) } }
  end

  private

  def swap(i, j, matrix)
    temp = matrix[j][i]
    matrix[j][i] = matrix[i][j]
    matrix[i][j] = temp
  end
end
