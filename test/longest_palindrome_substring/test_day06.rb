require 'minitest/autorun'
require 'longest_palindrome_substring/day06'

class LongestPalindromeSubstringTest < Minitest::Test
  def setup
    @palindrome = LongestPalindromeSubstring.new
  end

  def test_single_char_palindrome
    assert_equal 'a', @palindrome.longest_substring('a')
  end

  def test_two_chars_palindrome
    assert_equal 'aa', @palindrome.longest_substring('aa')
  end

  def test_three_chars_palindrome
    assert_equal 'aba', @palindrome.longest_substring('aba')
  end

  def test_four_chars_palindrome
    assert_equal 'abba', @palindrome.longest_substring('abba')
  end

  def test_palindrome_at_the_beginning
    assert_equal 'aba', @palindrome.longest_substring('abac')
  end

  def test_palindrome_at_the_end
    assert_equal 'aba', @palindrome.longest_substring('sdfghjklaba')
  end
end
