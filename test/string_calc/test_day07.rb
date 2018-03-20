require 'minitest/autorun'
require 'string_calc/day07'

class StringCalcTest < Minitest::Test
  def setup
    @calc = StringCalc.new
  end

  def test_compute_negative_number
    assert_equal -5, @calc.compute('-5')
  end

  def test_compute_addition
    assert_equal 4 + 5, @calc.compute('4+5')
  end

  def test_compute_subtraction
    assert_equal 13 - 10, @calc.compute('13-10')
  end

  def test_compute_multiplication
    assert_equal 2 * 8, @calc.compute('2*8')
  end

  def test_compute_division
    assert_equal 16 / 2, @calc.compute('16/2')
  end

  def test_compute_many_operations
    assert_equal 24 + 3 * 7 - 64 / 8, @calc.compute('24+3*7-64/8')
  end

  def test_compute_operations_with_parenthesis
    assert_equal (24 + 3) * 7 - (64 + 128) / 8, @calc.compute('(24+3)*7-(64+128)/8')
  end
end
