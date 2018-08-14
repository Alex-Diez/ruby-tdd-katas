def fizz_buzz(numbers)
  numbers.map do |item|
    ret = ''
    ret += 'fizz' if (item % 3).zero?
    ret += 'buzz' if (item % 5).zero?
    ret += item.to_s if ret.empty?
    ret
  end
end
