class Game
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score
    Enumerator
    .new { |rolls| generate_roll_indexes(rolls) }
    .take(10)
    .map { |roll| compute_frame_points(roll) }
    .reduce :+
  end

  private

  def compute_frame_points(roll)
    if strike?(roll)
      10 + strike_bonus(roll)
    elsif spare?(roll)
      10 + spare_bonus(roll)
    else
      frame_points(roll)
    end
  end

  def generate_roll_indexes(rolls)
    index = 0
    loop do
      rolls << index
      index = strike?(index) ? index + 1 : index + 2
    end
  end

  def strike?(roll)
    @rolls[roll] == 10
  end

  def strike_bonus(roll)
    @rolls[roll + 1] + @rolls[roll + 2]
  end

  def spare_bonus(roll)
    @rolls[roll + 2]
  end

  def spare?(roll)
    frame_points(roll) == 10
  end

  def frame_points(roll)
    @rolls[roll] + @rolls[roll + 1]
  end
end
