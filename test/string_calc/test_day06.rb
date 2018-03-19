require 'minitest/autorun'
require 'string_calc/day06'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -12, @calc.compute('-12')
  end

  def test_compute_addition
    assert_equal 4 + 3, @calc.compute('4+3')
  end

  def test_compute_subtraction
    assert_equal 5 - 1, @calc.compute('5-1')
  end

  def test_compute_multiplication
    assert_equal 4 * 8, @calc.compute('4*8')
  end

  def test_compute_division
    assert_equal 16 / 4, @calc.compute('16/4')
  end

  def test_compute_many_operations
    assert_equal 4 + 3 * 8 - 27 / 3, @calc.compute('4+3*8-27/3')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (4 + 3) * 8 - ((27 + 3) * 8) / 3, @calc.compute('(4+3)*8-((27+3)*8)/3')
  end
end
