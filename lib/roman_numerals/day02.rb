class RomanNumerals
  def initialize
    @mapper = Hash.new('').merge({1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X'})
  end

  def convert(decimal)
    arabic = @mapper.keys.select { |k| k <= decimal}.last
    roman = @mapper[arabic]
    if arabic
      roman += convert(decimal - arabic)
    end
    roman
  end
end
