require 'minitest/autorun'
require 'string_calc/day10'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -13, @calc.compute('-13')
  end

  def test_compute_addition
    assert_equal 4 + 3, @calc.compute('4+3')
  end

  def test_compute_subtraction
    assert_equal 13 - 10, @calc.compute('13-10')
  end

  def test_compute_multiplication
    assert_equal 2 * 12, @calc.compute('2*12')
  end

  def test_compute_division
    assert_equal 24 / 2, @calc.compute('24/2')
  end

  def test_compute_many_operations
    assert_equal 4 + 3 * 9 - 21 / 3, @calc.compute('4+3*9-21/3')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (4 + 3) * 2 - 81 / (3 + 4 + 2), @calc.compute('(4+3)*2-81/(3+4+2)')
  end
end
