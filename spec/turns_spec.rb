require 'turns'

describe Turns do
  let(:turn) { Turns.new }
  let(:die1) { double :die1 }
  let(:die2) { double :die2 }

  describe '#count_dice' do
    it 'should count up the dice' do
      expect(turn.count_dice(3, 3)).to eq 6
    end
  end

  describe '#equal?' do
    it 'should know if the value of both dice is equal' do
      expect(turn.equal?(die1, die1)).to eq true
    end
    it 'should know if the value is not equal' do
      expect(turn.equal?(die1, die2)).to eq false
    end
  end
end
