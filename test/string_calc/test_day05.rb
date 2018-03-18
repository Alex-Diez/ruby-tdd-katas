require 'minitest/autorun'
require 'string_calc/day05'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -6, @calc.compute('-6')
  end

  def test_compute_addition
    assert_equal 4 + 6, @calc.compute('4+6')
  end

  def test_compute_subtraction
    assert_equal 10 - 9, @calc.compute('10-9')
  end

  def test_compute_multiplication
    assert_equal 5 * 4, @calc.compute('5*4')
  end

  def test_compute_division
    assert_equal 40 / 8, @calc.compute('40/8')
  end

  def test_many_operations
    assert_equal 10 + 6 * 8 - 56 / 7, @calc.compute('10+6*8-56/7')
  end

  def test_operations_with_parenthesis
    assert_equal (10 + 6) * 8 - (2 * 56) / 7, @calc.compute('(10+6)*8-(2*56)/7')
  end
end
