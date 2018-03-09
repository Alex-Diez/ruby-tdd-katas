class Compressor
  def compress(src)
    src
      .each_char
      .chunk_while { |c, n| c == n }
      .map { |chunk| "#{chunk.size}#{chunk.first}" }
      .join
  end
end
