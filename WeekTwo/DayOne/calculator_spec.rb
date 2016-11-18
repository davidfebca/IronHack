require 'rspec'
require './calculator.rb'

describe 'Calculator' do
  describe '#add' do
    it 'returns 0 for no numbers' do
      result = Calculator.add('')
      expect(result).to eq(0)
    end
    it 'resturns 6 for 1,2,3' do
      result = Calculator.add('1,2,3')
      expect(result).to eq(6)
    end
    it 'resturns 0 if nil' do
      result = Calculator.add(nil)
      expect(result).to eq(0)
    end
    it 'resturns 2 if "abc,2,ula"' do
      result = Calculator.add("2,abc,ula")
      expect(result).to eq(2)
    end
  end
end
