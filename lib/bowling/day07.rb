class Game
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score(frame = 1, pin = 0)
    return 0 if frame == 11
    if is_strike?(pin)
      10 + strike_bonus(pin) + score(frame + 1, pin + 1)
    elsif is_spare?(pin)
      10 + spare_bonus(pin) + score(frame + 1, pin + 2)
    else
      frame_points(pin) + score(frame + 1, pin + 2)
    end
  end

  private

  def is_strike?(index)
    @rolls[index] == 10
  end

  def strike_bonus(index)
    @rolls[index + 1] + @rolls[index + 2]
  end

  def spare_bonus(index)
    @rolls[index + 2]
  end

  def is_spare?(index)
    frame_points(index) == 10
  end

  def frame_points(pin)
    @rolls[pin] + @rolls[pin + 1]
  end
end