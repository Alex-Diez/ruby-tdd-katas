require 'minitest/autorun'
require 'string_calc/day12'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_comptue_negative_number
    assert_equal -9, @calc.compute('-9')
  end

  def test_compute_addition
    assert_equal 4 + 3, @calc.compute('4+3')
  end

  def test_comptue_subtraction
    assert_equal 5 - 1, @calc.compute('5-1')
  end

  def test_compute_multiplication
    assert_equal 4 * 8, @calc.compute('4*8')
  end

  def test_compute_division
    assert_equal 25 / 5, @calc.compute('25/5')
  end

  def test_compute_many_operations
    assert_equal 4 + 3 * 7 - 33 / 3, @calc.compute('4+3*7-33/3')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (4 + 2 * (3 - 1)) * 7 - (31 + 2) / 3, @calc.compute('(4+2*(3-1))*7-(31+2)/3')
  end
end
