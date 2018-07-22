require 'rspec'
require 'k_items/day04'

describe 'k items' do
  it 'has to get one item from single item array' do
    expect(k_items([1], 1)).to eq([1])
  end

  it 'has to get one item from two items array first one is largest' do
    expect(k_items([2, 1], 1)).to eq([2])
  end

  it 'has to get one item from two items array last one is largest' do
    expect(k_items([1, 2], 1)).to eq([2])
  end

  it 'has to get one item from three items array' do
    expect(k_items([1, 2, 3], 1)).to eq([3])
  end

  it 'has to get two items from three items array' do
    expect(k_items([1, 2, 3], 2)).to include(2, 3)
  end
end
