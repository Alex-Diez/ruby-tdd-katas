class Compressor
  def compress(src)
    src
      .each_char
      .chunk_while(&:==)
      .map(&:size_and_first)
      .join
  end
end

class Array
  def size_and_first
    "#{size}#{first}"
  end
end
