require 'minitest/autorun'
require 'compression/day12'

class CompressorTest < Minitest::Test
  def setup
    @compressor = Compressor.new
  end

  def test_compress_empty_string
    assert_equal '', @compressor.compress('')
  end

  def test_compress_single_char_string
    assert_equal '1a', @compressor.compress('a')
  end

  def test_compress_unique_chars_string
    assert_equal '1a1b1c', @compressor.compress('abc')
  end

  def test_compress_doubled_chars_string
    assert_equal '2a2b2c', @compressor.compress('aabbcc')
  end
end
