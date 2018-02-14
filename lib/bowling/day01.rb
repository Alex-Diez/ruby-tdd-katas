class Game
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score
    compute_score(1, 0)
  end

  def compute_score(frame_index, roll_index)
    return 0 if frame_index == 11
    if strike? roll_index
      10 + strike_bonus(roll_index) + compute_score(frame_index + 1, roll_index + 1)
    elsif spare?(roll_index)
      10 + spare_bonus(roll_index) + compute_score(frame_index + 1, roll_index + 2)
    else
      frame_points(roll_index) + compute_score(frame_index + 1, roll_index + 2)
    end
  end

  def strike?(roll_index)
    roll_at(roll_index) == 10
  end

  def strike_bonus(roll_index)
    roll_at(roll_index + 1) + roll_at(roll_index + 2)
  end

  def spare?(roll_index)
    roll_at(roll_index) + roll_at(roll_index + 1) == 10
  end

  def spare_bonus(roll_index)
    roll_at(roll_index + 2)
  end

  def frame_points(roll_index)
    roll_at(roll_index) + roll_at(roll_index + 1)
  end

  def roll_at(roll_index)
    @rolls[roll_index] || 0
  end
end
