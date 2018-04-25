class MatrixTransposer
  def transpose(matrix)
    i = 1
    while (i < matrix.size)
      j = 0
      while (j < i)
        temp = matrix[i][j]
        matrix[i][j] = matrix[j][i]
        matrix[j][i] = temp
        j += 1
      end
      i += 1
    end
  end
end
