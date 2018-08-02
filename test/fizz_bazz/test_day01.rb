require 'rspec'
require 'fizz_buzz/day01'

describe 'fizz buzz' do
  it 'has to print "fizz"' do
    expect(fizz_buzz([3])).to eq(['fizz'])
  end

  it 'has to print "buzz"' do
    expect(fizz_buzz([5])).to eq(['buzz'])
  end

  it 'has to print a number' do
    expect(fizz_buzz([1])).to eq(['1'])
  end

  it 'has to print empty array' do
    expect(fizz_buzz([])).to eq([])
  end

  it 'has to print "fizzbuzz"' do
    expect(fizz_buzz([15])).to eq(['fizzbuzz'])
  end
end
