class Game
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score(frame = 1, roll = 0)
    return 0 if frame > 10
    if is_strike?(roll)
      10 + strike_bonus(roll) + score(frame + 1, roll + 1)
    elsif is_spare?(roll)
      10 + spare_bonus(roll) + score(frame + 1, roll + 2)
    else
      frame_points(roll) + score(frame + 1, roll + 2)
    end
  end

  private

  def is_strike?(index)
    roll_at(index) == 10
  end

  def strike_bonus(roll)
    roll_at(roll + 1) + roll_at(roll + 2)
  end

  def spare_bonus(roll)
    roll_at(roll + 2)
  end

  def is_spare?(index)
    frame_points(index) == 10
  end

  def frame_points(roll)
    roll_at(roll) + roll_at(roll + 1)
  end

  def roll_at(index)
    @rolls[index] || 0
  end
end
