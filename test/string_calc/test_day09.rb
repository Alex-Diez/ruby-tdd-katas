require 'minitest/autorun'
require 'string_calc/day09'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -15, @calc.compute('-15')
  end

  def test_compute_addition
    assert_equal 4 + 9, @calc.compute('4+9')
  end

  def test_compute_subtraction
    assert_equal 15 - 12, @calc.compute('15-12')
  end

  def test_compute_multiplication
    assert_equal 4 * 8, @calc.compute('4*8')
  end

  def test_compute_division
    assert_equal 16 / 4, @calc.compute('16/4')
  end

  def test_compute_many_operations
    assert_equal 4 + 5 * 9 - 10 / 2, @calc.compute('4+5*9-10/2')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (4 + 6) * 3 + (5 - 2) * 9 - (42 + 10) / 2, @calc.compute('(4+6)*3+(5-2)*9-(42+10)/2')
  end
end
