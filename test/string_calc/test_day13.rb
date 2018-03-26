require 'minitest/autorun'
require 'string_calc/day13'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -5, @calc.compute('-5')
  end

  def test_compute_addition
    assert_equal 4 + 6, @calc.compute('4+6')
  end

  def test_compute_subtraction
    assert_equal 10 - 3, @calc.compute('10-3')
  end

  def test_compute_multiplication
    assert_equal 4 * 8, @calc.compute('4*8')
  end

  def test_compute_division
    assert_equal 16 / 4, @calc.compute('16/4')
  end

  def test_compute_many_operations
    assert_equal 4 + 9 * 3 - 12 / 3, @calc.compute('4+9*3-12/3')
  end

  def test_compute_operations_with_parenthesis
    assert_equal 4 + (9 - 2) * 3 - (12 + 9) / 3, @calc.compute('4+(9-2)*3-(12+9)/3')
  end
end
