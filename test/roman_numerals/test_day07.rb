require 'minitest/autorun'
require 'roman_numerals/day07'

class RomanNumeralsTest < Minitest::Test
  def setup
    @converter = RomanNumerals.new
  end

  def test_convert_zero
    assert_equal '', @converter.convert(0)
  end

  def test_convert_one
    assert_equal 'I', @converter.convert(1)
  end

  def test_convert_five
    assert_equal 'V', @converter.convert(5)
  end

  def test_convert_two
    assert_equal 'II', @converter.convert(2)
  end

  def test_convert_ten
    assert_equal 'X', @converter.convert(10)
  end

  def test_convert_nine
    assert_equal 'IX', @converter.convert(9)
  end

  def test_convert_twenty_nine
    assert_equal 'XXIX', @converter.convert(29)
  end
end
