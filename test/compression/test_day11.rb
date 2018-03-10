require 'minitest/autorun'
require 'compression/day11'

class CompressorTest < Minitest::Test
  def setup
    @compressor = Compressor.new
  end

  def test_empty_string
    assert_equal '', @compressor.compress('')
  end

  def test_unique_chars_string
    assert_equal '1a1b1c', @compressor.compress('abc')
  end

  def test_doubled_chars_string
    assert_equal '2a2b2c', @compressor.compress('aabbcc')
  end
end