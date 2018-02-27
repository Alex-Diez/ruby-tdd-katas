require 'minitest/autorun'
require 'bowling/day14'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  private

  def roll_many(count, pin)
    count.times { @game.roll pin }
  end

  def roll_spare
    @game.roll 4
    @game.roll 6
  end

  def roll_strike
    @game.roll 10
  end

  public

  def test_gutter_game
    roll_many 20, 0

    assert_equal 0, @game.score
  end

  def test_all_ones
    roll_many 20, 1

    assert_equal 20, @game.score
  end

  def test_one_spare
    roll_spare
    @game.roll 3
    roll_many 17, 0

    assert_equal 16, @game.score
  end

  def test_one_strike
    roll_strike
    @game.roll 4
    @game.roll 3
    roll_many 16, 0

    assert_equal 24, @game.score
  end

  def test_perfect_game
    roll_many 12, 10

    assert_equal 300, @game.score
  end
end
