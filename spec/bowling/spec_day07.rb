require 'bowling/day07'

def roll_many(count, pin)
  count.times {@game.roll pin}
end

def roll_spare
  @game.roll 4
  @game.roll 6
end

def roll_strike
  @game.roll 10
end

RSpec.describe "Bowling Game" do
  before(:each) do
    @game = Game.new
  end

  it "processes gutter game" do
    roll_many 20, 0

    expect(@game.score).to eq 0
  end

  it "processes all ones" do
    roll_many 20, 1

    expect(@game.score).to eq 20
  end

  it "processes one spare" do
    roll_spare
    @game.roll 3
    roll_many 17, 0

    expect(@game.score).to eq 16
  end

  it "processes one strike" do
    roll_strike
    @game.roll 4
    @game.roll 3
    roll_many 16, 0

    expect(@game.score).to eq 24
  end

  it "processes perfect game" do
    roll_many 12, 10

    expect(@game.score).to eq 300
  end
end
