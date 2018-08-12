require 'rspec'
require 'fizz_buzz/day11'

describe 'fizz buzz' do
  it 'has to return empty array' do
    expect(fizz_buzz([])).to eq([])
  end

  it 'has to return ["fizz"]' do
    expect(fizz_buzz([3])).to eq(['fizz'])
  end

  it 'has to return ["buzz"]' do
    expect(fizz_buzz([5])).to eq(['buzz'])
  end

  it 'has to return ["#number"]' do
    expect(fizz_buzz([1])).to eq(['1'])
  end

  it 'has to return ["fizzbuzz"]' do
    expect(fizz_buzz([15])).to eq(['fizzbuzz'])
  end
end
