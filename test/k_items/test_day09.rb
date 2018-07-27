require 'rspec'
require 'k_items/day09'

describe 'k items' do
  it 'has to filter one item from single item list' do
    expect(k_items([1], 1)).to eq([1])
  end

  it 'has to filter one item from two items list larger is first' do
    expect(k_items([2, 1], 1)).to eq([2])
  end

  it 'has to filter one item from two items list larger is last' do
    expect(k_items([1, 2], 1)).to eq([2])
  end

  it 'has to filter one item from three items list' do
    expect(k_items([1, 2, 3], 1)).to eq([3])
  end

  it 'has to filter two items from three items list' do
    expect(k_items([1, 2, 3], 2)).to contain_exactly(2, 3)
  end
end
