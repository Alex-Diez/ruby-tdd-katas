require 'minitest/autorun'
require 'longest_palindrome_substring/day01'

class LongestPalindromeSubstringTest < Minitest::Test
  def setup
    @palindrome = LongestPalindromeSubstring.new
  end

  def test_single_char_string_is_substring_for_itself
    assert_equal 'a', @palindrome.longest_substring('a')
  end

  def test_string_of_the_same_char_is_substring_for_itself
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
    assert_equal 'aba', @palindrome.longest_substring('caba')
  end

  def test_very_long_string_palindrome_at_the_end
    assert_equal 'aba', @palindrome.longest_substring('cdefghjklmnoprstaba')
  end
end
