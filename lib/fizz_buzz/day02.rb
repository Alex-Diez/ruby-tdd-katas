def fizz_buzz(items)
  items.map do |item|
    ret = ''
    ret += 'fizz' if item % 3 == 0
    ret += 'buzz' if item % 5 == 0
    ret += item.to_s if ret.empty?
    ret
  end
end
