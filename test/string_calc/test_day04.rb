require 'minitest/autorun'
require 'string_calc/day04'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -10, @calc.compute('-10')
  end

  def test_addition
    assert_equal 4 + 5, @calc.compute('4+5')
  end

  def test_subtraction
    assert_equal 6 - 2, @calc.compute('6-2')
  end

  def test_multiplication
    assert_equal 5 * 4, @calc.compute('5*4')
  end

  def test_division
    assert_equal 30 / 5, @calc.compute('30/5')
  end

  def test_many_operations
    assert_equal 5 + 9 * 3 - 42 / 6, @calc.compute('5+9*3-42/6')
  end

  def test_operations_with_parenthesis
    assert_equal (5 + 9) * 3 - (42 - 32) / 5, @calc.compute('(5+9)*3-(42-32)/5')
  end
end
