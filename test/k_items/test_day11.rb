require 'rspec'
require 'k_items/day11'

describe 'k items' do
  it 'has to filter one item from single item array' do
    expect(k_items([1], 1)).to eq([1])
  end

  it 'has to filter one item from two items array larger is first' do
    expect(k_items([2, 1], 1)).to eq([2])
  end

  it 'has to filter one item from two items array larger is last' do
    expect(k_items([1, 2], 1)).to eq([2])
  end

  it 'has to filter one item from three items array' do
    expect(k_items([1, 2, 3], 1)).to eq([3])
  end

  it 'has to filter two item from three items array' do
    expect(k_items([1, 2, 3], 2)).to contain_exactly(2, 3)
  end
end
