class RomanNumerals
  def initialize
    @mapper = Hash.new('')
      .merge({ 1 => 'I', 5 => 'V', 10 => 'X', 9 => 'IX' })
  end

  def convert(decimanl)
    arabic = @mapper.keys.select { |k| k <= decimanl }.sort.last
    roman = @mapper[arabic]
    if arabic
      roman += convert(decimanl - arabic)
    end
    roman
  end
end
