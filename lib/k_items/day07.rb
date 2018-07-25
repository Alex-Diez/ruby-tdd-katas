def k_items(items, k)
  max = []
  k.times { |j| max << items[j] }
  (items.size - k).times.lazy.map { |i| i + k }.each do |i|
    n = k.times.lazy.drop_while { |j| items[i] <= max[j] }.next rescue k
    max[n] = items[i] if n < k
  end
  max
end
