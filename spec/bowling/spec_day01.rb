require 'bowling/day01'

RSpec.describe Game do
  context "bowling game" do
    before(:example) do
      @game = Game.new
    end

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

    it "is gutter game" do
      roll_many 20, 0
      expect(@game.score).to eq 0
    end

    it "has all ones" do
      roll_many 20, 1
      expect(@game.score).to eq 20
    end

    it "has one spare" do
      roll_spare
      @game.roll 3
      roll_many 17, 0

      expect(@game.score).to eq 16
    end

    it "has one strike" do
      roll_strike
      @game.roll 4
      @game.roll 3
      roll_many 16, 0

      expect(@game.score).to eq 24
    end

    it "is perfect game" do
      roll_many 12, 10

      expect(@game.score).to eq 300
    end
  end
end
