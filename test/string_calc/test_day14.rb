require 'minitest/autorun'
require 'string_calc/day14'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -5, @calc.compute('-5')
  end

  def test_compute_addition
    assert_equal 4 + 5, @calc.compute('4+5')
  end

  def test_compute_subtraction
    assert_equal 6 - 1, @calc.compute('6-1')
  end

  def test_compute_multiplication
    assert_equal 4 * 8, @calc.compute('4*8')
  end

  def test_compute_division
    assert_equal 15 / 3, @calc.compute('15/3')
  end

  def test_compute_many_operations
    assert_equal 4 + 3 * 7 - 42 / 7, @calc.compute('4+3*7-42/7')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (4 + 3) * 7 - (42 + 14) / 7, @calc.compute('(4+3)*7-(42+14)/7')
  end
end
