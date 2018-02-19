class Game
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score(frame = 1, roll = 0)
    return 0 if frame == 11
    if is_strike?(roll)
      10 + strike_bonus(roll) + score(frame + 1, roll + 1)
    elsif is_spare?(roll)
      10 + spare_bonus(roll) + score(frame + 1, roll + 2)
    else
      frame_points(roll) + score(frame + 1, roll + 2)
    end
  end

  private

  def strike_bonus(index)
    @rolls[index + 1] + @rolls[index + 2]
  end

  def is_strike?(index)
    @rolls[index] == 10
  end

  def is_spare?(index)
    frame_points(index) == 10
  end

  def spare_bonus(index)
    @rolls[index + 2]
  end

  def frame_points(roll)
    @rolls[roll] + @rolls[roll + 1]
  end
end
