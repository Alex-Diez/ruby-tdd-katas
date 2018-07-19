require 'rspec'
require 'k_items/day01'

describe 'k itmes' do
    it 'gets one item from single item array' do
        expect(k_items([1], 1)).to eq([1])
    end

    it 'gets one item from two items array larger is first' do
        expect(k_items([2, 1], 1)).to eq([2])
    end

    it 'gets one item from two items array larger is second' do
        expect(k_items([1, 2], 1)).to eq([2])
    end

    it 'gets one item from three items array' do
        expect(k_items([1, 2, 3], 1)).to eq([3])
    end

    it 'gets two items from three items array' do
        expect(k_items([1, 2, 3], 2)).to include(2, 3)
    end
end
