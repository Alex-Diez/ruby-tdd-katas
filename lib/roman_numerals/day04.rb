class RomanNumerals
  def initialize
    @mapper = Hash.new('')
    .merge({ 1 => 'I', 5 => 'V', 4 => 'IV', 10 => 'X', 9 => 'IX' })
  end

  def convert(digit)
    arabic = @mapper.keys.select { |k| k <= digit }.sort.last
    roman = @mapper[arabic]
    if arabic
      roman += convert(digit - arabic)
    end
    roman
  end
end
