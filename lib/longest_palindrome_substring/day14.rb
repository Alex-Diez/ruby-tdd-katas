class LongestPalindromeSubstring
  def longest_substring(src)
    first = 0
    last = 0
    src.size.times do |i|
      len = max_len(src, i)
      first, last = first_last(len, i) if len > last - first
    end
    src[first..last]
  end

  private

  def max_len(s, index)
    odd_len = expand_around_center(s, index, index)
    even_len = expand_around_center(s, index, index - 1)
    [odd_len, even_len].max
  end

  def expand_around_center(s, left, right)
    while left > -1 && right < s.size && s[left] == s[right]
      left -= 1
      right += 1
    end
    right - left - 1
  end

  def first_last(len, index)
    first = index - len / 2
    last = index + len / 2
    [first, last]
  end
end
