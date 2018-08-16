require 'minitest/autorun'
require 'string_calc/day01.rb'

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
    assert_equal 15 - 10, @calc.compute('15-10')
  end

  def test_compute_multiplication
    assert_equal 23 * 3, @calc.compute('23*3')
  end

  def test_compute_division
    assert_equal 49 / 7, @calc.compute('49/7')
  end

  def test_compute_multiple_operations
    assert_equal 3 + 5 * 8 - 16 / 4, @calc.compute('3+5*8-16/4')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (3 + 5) * 8 - (16 + 4) / 4, @calc.compute('(3+5)*8-(16+4)/4')
  end
end
