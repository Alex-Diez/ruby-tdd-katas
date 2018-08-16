require 'minitest/autorun'
require 'bowling/day01.rb'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  private

  def roll_many(n, pin)
    n.times {@game.roll(pin)}
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

    assert_equal @game.score, 0
  end

  def test_all_ones
    roll_many 20, 1
    assert_equal @game.score, 20
  end

  def test_one_spare
    roll_spare
    @game.roll 3
    roll_many 17, 0

    assert_equal @game.score, 16
  end

  def test_one_strike
    roll_strike
    @game.roll 4
    @game.roll 3
    roll_many 16, 0

    assert_equal @game.score, 24
  end

  def test_perfect_game
    roll_many 12, 10

    assert_equal @game.score, 300
  end
end
