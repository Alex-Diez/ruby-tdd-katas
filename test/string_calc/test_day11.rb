require 'minitest/autorun'
require 'string_calc/day11'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -7, @calc.compute('-7')
  end

  def test_compute_addition
    assert_equal 5 + 6, @calc.compute('5+6')
  end

  def test_compute_subtraction
    assert_equal 11 - 5, @calc.compute('11-5')
  end

  def test_compute_multiplication
    assert_equal 2 * 8, @calc.compute('2*8')
  end

  def test_compute_division
    assert_equal 32 / 4, @calc.compute('32/4')
  end

  def test_compute_many_operations
    assert_equal 4 + 3 * 9 - 36 / 3, @calc.compute('4+3*9-36/3')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (4 + 3) * 9 - (36 - 12) / 3, @calc.compute('(4+3)*9-(36-12)/3')
  end
end
