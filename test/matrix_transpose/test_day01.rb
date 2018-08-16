require 'minitest/autorun'
require 'matrix_transpose/day01.rb'

class TransposeMatrixTest < Minitest::Test
  def setup
    @transposer = MatrixTransposer.new
  end

  def test_matrix_one_by_one
    matrix = [[1]]
    @transposer.transpose(matrix)

    assert_equal matrix, [[1]]
  end

  def test_matrix_two_by_two
    matrix = [
      [1, 2],
      [3, 4]
    ]
    @transposer.transpose(matrix)

    assert_equal matrix, [
      [1, 3],
      [2, 4]
    ]
  end

  def test_matrix_three_by_three
    matrix = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    @transposer.transpose(matrix)

    assert_equal matrix, [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end
end
