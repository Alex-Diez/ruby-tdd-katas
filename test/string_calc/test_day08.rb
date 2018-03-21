require 'minitest/autorun'
require 'string_calc/day08'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -7, @calc.compute('-7')
  end

  def test_compute_addition
    assert_equal 4 + 9, @calc.compute('4+9')
  end

  def test_compute_subtraction
    assert_equal 12 - 5, @calc.compute('12-5')
  end

  def test_compute_multiplication
    assert_equal 5 * 8, @calc.compute('5*8')
  end

  def test_compute_division
    assert_equal 18 / 3, @calc.compute('18/3')
  end

  def test_compute_many_operations
    assert_equal 4 + 5 * 2 - 81 / 9, @calc.compute('4+5*2-81/9')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (8 + 3) * 7 - 64 / (13 - 5), @calc.compute('(8+3)*7-64/(13-5)')
  end
end
