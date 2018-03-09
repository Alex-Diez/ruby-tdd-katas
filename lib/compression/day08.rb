class Compressor
  def compress(src)
    src
      .each_char
      .chunk_while { |n, c| n == c }
      .map { |chunk| "#{chunk.size}#{chunk.first}"}
      .join
  end
end
