require 'minitest/autorun'
require 'string_calc/day02'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -15, @calc.compute('-15')
  end

  def test_compute_addition
    assert_equal 4 + 3, @calc.compute('4+3')
  end

  def test_compute_subtraction
    assert_equal 15 - 3, @calc.compute('15-3')
  end

  def test_compute_multiplication
    assert_equal 4 * 3, @calc.compute('4*3')
  end

  def test_compute_division
    assert_equal 15 / 5, @calc.compute('15/5')
  end

  def test_compute_many_operations
    assert_equal 15 - 4 * 8 + 36 / 6, @calc.compute('15-4*8+36/6')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (15 - 4) * 8 + (35 - 6 + 1) / 8, @calc.compute('(15-4)*8+(35-6+1)/8')
  end
end
