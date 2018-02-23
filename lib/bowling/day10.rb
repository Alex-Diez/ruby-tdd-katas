class Game

  NUMBER_OF_FRAMES = 10

  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score
    Enumerator
      .new { |rolls| generate_roll_indexes(rolls) }
      .take(NUMBER_OF_FRAMES)
      .map { |index| compute_frame_points(index) }
      .reduce :+
  end

  private

  def generate_roll_indexes(rolls)
    index = 0
    loop do
      rolls << index
      index += strike?(index) ? 1 : 2
    end
  end

  def compute_frame_points(index)
    if strike?(index)
      10 + strike_bonus(index)
    elsif spare?(index)
      10 + spare_bonus(index)
    else
      frame_points(index)
    end
  end

  def strike_bonus(roll)
    @rolls[roll + 1] + @rolls[roll + 2]
  end

  def strike?(roll)
    @rolls[roll] == 10
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
