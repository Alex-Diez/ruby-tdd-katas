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

  def compute_score(frame, roll)
    return 0 unless frame < 11
    if is_strike?(roll)
      10 + strike_bonus(roll) + compute_score(frame + 1, roll + 1)
    elsif is_spare?(roll)
      10 + spare_bonus(roll) + compute_score(frame + 1, roll + 2)
    else
      frame_points(roll) + compute_score(frame + 1, roll + 2)
    end
  end

  def is_strike?(index)
    roll_at(index) == 10
  end

  def strike_bonus(index)
    roll_at(index + 1) + roll_at(index + 2)
  end

  def is_spare?(index)
    frame_points(index) == 10
  end

  def spare_bonus(index)
    roll_at(index + 2)
  end

  def frame_points(index)
    roll_at(index) + roll_at(index + 1)
  end

  def roll_at(index)
    @rolls[index] || 0
  end
end
