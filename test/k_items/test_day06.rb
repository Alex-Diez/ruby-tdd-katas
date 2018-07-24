require 'rspec'
require 'k_items/day06'

describe 'k items' do
  it 'has to get one item from single item array' do
    expect(k_items([1], 1)).to eq([1])
  end

  it 'has to get one item from two items array larger first' do
    expect(k_items([2, 1], 1)).to eq([2])
  end

  it 'has to get one item from two items array larger last' do
    expect(k_items([1, 2], 1)).to eq([2])
  end

  it 'has to get one item from three items array' do
    expect(k_items([1, 2, 3], 1)). to eq([3])
  end

  it 'has to get two items from three items array' do
    expect(k_items([1, 2, 3], 2)).to contain_exactly(2, 3)
  end
end
