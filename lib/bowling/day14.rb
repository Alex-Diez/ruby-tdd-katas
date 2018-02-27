class Game
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score
    Enumerator
      .new do |rolls| generate_rolls_indexes(rolls) end
      .take(10)
      .map do |roll| compute_frames_points(roll) end
      .reduce(:+)
  end

  private

  def generate_rolls_indexes(rolls)
    index = 0
    loop do
      rolls << index
      index += strike?(index) ? 1 : 2
    end
  end

  def compute_frames_points(roll)
    if strike?(roll)
      10 + strike_bonus(roll)
    elsif spare?(roll)
      10 + spare_bonus(roll)
    else
      frame_points(roll)
    end
  end

  def strike?(roll)
    @rolls[roll] == 10
  end

  def strike_bonus(roll)
    @rolls[roll + 1] + @rolls[roll + 2]
  end

  def spare?(roll)
    frame_points(roll) == 10
  end

  def spare_bonus(roll)
    @rolls[roll + 2]
  end

  def frame_points(roll)
    @rolls[roll] + @rolls[roll + 1]
  end
end