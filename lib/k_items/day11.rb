def k_items(items, k)
  max = []
  k.times { |j| max << items[j] }
  i = k
  while items.size > i
    j = 0
    j += 1 while j < k && items[i] <= max[j]
    max[j] = items[i] if j < k
    i += 1
  end
  max
end
