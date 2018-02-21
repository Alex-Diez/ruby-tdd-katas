class Game
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score
    (1..9)
      .inject([0]) { |indexes, _| indexes << map_to_roll(indexes.last) }
      .flat_map
      .map { |roll| map_to_frame_points(roll) }
      .reduce(:+)
  end

  private

  def map_to_frame_points(roll)
    if strike?(roll)
      10 + strike_bonus(roll)
    elsif spare?(roll)
      10 + spare_bonus(roll)
    else
      frame_points(roll)
    end
  end

  def map_to_roll(index)
    if strike?(index)
      index + 1
    else
      index + 2
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
