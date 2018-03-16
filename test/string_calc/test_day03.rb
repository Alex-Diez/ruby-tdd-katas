require 'minitest/autorun'
require 'string_calc/day03'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -13, @calc.compute('-13')
  end

  def test_compute_addition
    assert_equal 5 + 6, @calc.compute('5+6')
  end

  def test_compute_subtraction
    assert_equal 13 - 8, @calc.compute('13-8')
  end

  def test_compute_multiplication
    assert_equal 4 * 6, @calc.compute('4*6')
  end

  def test_compute_division
    assert_equal 25 / 5, @calc.compute('25/5')
  end

  def test_compute_many_operations
    assert_equal 4 + 5 * 3 - 45 / 9 - 141 / 3 + 4 * 8, @calc.compute('4+5*3-45/9-141/3+4*8')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (4 + 5) * 3 - 45 / 9 - (141 + 34) / (3 + 4 * 8), @calc.compute('(4+5)*3-45/9-(141+34)/(3+4*8)')
  end
end
