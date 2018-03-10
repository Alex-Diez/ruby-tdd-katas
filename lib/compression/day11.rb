class Compressor
  def compress(src)
    src
      .each_char
      .chunk_while { |b, a| b == a }
      .map { |c| "#{c.size}#{c.first}" }
      .join
  end
end
