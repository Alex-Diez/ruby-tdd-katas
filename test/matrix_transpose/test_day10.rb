require 'minitest/autorun'
require 'matrix_transpose/day10'

class TransposeMatrixTest < Minitest::Test
  def setup
    @transposer = MatrixTransposer.new
  end

  def test_one_by_one_matrix
    matrix = [[1]]
    @transposer.transpose matrix

    assert_equal [[1]], matrix
  end

  def test_two_by_two_matrix
    matrix = [[1, 2], [3, 4]]
    @transposer.transpose matrix

    assert_equal [[1, 3], [2, 4]], matrix
  end

  def test_three_by_three_matrix
    matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @transposer.transpose matrix

    assert_equal [[1, 4, 7], [2, 5, 8], [3, 6, 9]], matrix
  end
end
