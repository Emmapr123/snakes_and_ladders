require 'player'

describe Player do
    let(:player) { Player.new }
    let(:die1) { double :die1 }
    let(:die2) { double :die2 }

    describe '#next_player?' do
      it 'should decide if the player can go again' do
        expect(player.next_player?(die1, die1)).to eq false
      end
      it 'should know the next player can go' do
        expect(player.next_player?(die1, die2)).to eq true
      end
    end

    describe '#location' do
      it 'should know its current location' do
        expect(player.location).to eq 0
      end
    end

    describe '#move' do
      it 'should ba able ot make a normal move' do
        expect(player.move(1, 4)).to eq 5
      end
      it 'should be able to move its location with ladder' do
        player.move(4, 2)
        expect(player.location).to eq 6
      end
      it 'should be able to move its location with snake' do
        expect(player.move(45, 1)).to eq 25
      end
    end

    describe '#finish' do
      it 'should know when the player has won' do
        expect(player.move(98, 2)).to eq 'Congratz! You won'
      end
    end

    describe '#near_the_end' do
      it 'should go backwards if gone over 100' do
        expect(player.move(98, 4)).to eq 98
      end
    end
  end
