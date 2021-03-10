require 'snakes_and_ladders'

describe SnakesAndLadders do
  let(:game) { SnakesAndLadders.new }
  let(:player) { Player.new }

  describe '#player1_' do
    let(:die1) { 1 }
    let(:die2) { 1 }
    it 'should roll dice and move a piece for a player' do
      expect(game.player1_(die1, die2)).to eq "Player 1 is on square #{player.move(die1,die2)}"
    end
  end

  describe '#player2_' do
    let(:die1) { 4 }
    let(:die2) { 1 }
    it 'should roll dice and move player 2' do
      expect(game.player2_(die1, die2)).to eq "Player 2 is on square #{player.move(die1, die2)}"
    end
  end

  describe '#switch_turn' do
    it 'should switch whose turn it is' do
      player1 = Player.new
      game.player1_(1, 4)
      expect(game.turn)
    end
  end

  describe '#game_over' do
    it 'should say game over if a player has won' do
      game.play(98, 2)
      expect(game.play(5, 1)).to eq 'Game over'
    end
  end
end

describe Player do
  let(:player) { Player.new }

  describe '#next_player?' do
    it 'should decide if the player can go again' do
      expect(player.next_player?(1, 1)).to eq false
    end
    it 'should know the next player can go' do
      expect(player.next_player?(4, 1 )).to eq true
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


describe Turns do
let(:turn) { Turns.new }

  describe '#count_dice' do
    it 'should count up the dice' do
      expect(turn.count_dice(3, 3)).to eq 6
    end
  end

  describe '#equal?' do
    it 'should know if the value of both dice is equal' do
      expect(turn.equal?(3, 3)).to eq true
    end
    it 'should know if the value is not equal' do
      expect(turn.equal?(4, 2)).to eq false
    end
  end
end
