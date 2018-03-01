class Compressor
  def compress(src)
    src
      .each_char
      .chunk_while { |c, n| c == n }
      .map { |chunk| chunk.size.to_s + chunk.first }
      .to_a
      .join
  end
end
