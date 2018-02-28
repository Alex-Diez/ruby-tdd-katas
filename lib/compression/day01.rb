class Compressor
  def compress(src)
    ret = ""
    index = 0
    while index < src.size
      counter = 1
      index += 1
      while index < src.size && src[index] === src[index - 1]
        counter += 1
        index += 1
      end
      ret += counter.to_s + src[index - 1]
    end
    ret
  end
end
