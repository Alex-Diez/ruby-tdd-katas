class LongestPalindromeSubstring
  def longest_substring(s)
    i = 0
    first = 0
    last = 0
    while i < s.size
      odd_len = expand_around_center(s, i, i)
      even_len = expand_around_center(s, i - 1, i)
      len = [odd_len, even_len].max
      if len > last - first
        first = i - len / 2
        last = i + len / 2
      end
      i += 1
    end
    s[first..last]
  end

  private

  def expand_around_center(s, left, right)
    while left > -1 && right < s.size && s[left] == s[right]
      left -= 1
      right += 1
    end
    right - left - 1
  end
end
