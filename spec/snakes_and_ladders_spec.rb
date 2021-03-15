require 'snakes_and_ladders'

describe SnakesAndLadders do
  let(:game) { SnakesAndLadders.new }
  let(:player1) { double :player1 }
  let(:player2) { double :player2 }

  describe '#player1_' do
    let(:die1) { 1 }
    let(:die2) { 1 }
    it 'should roll dice and move a piece for a player' do
      allow(player1).to receive(:move) { 38 }
      expect(game.player1_(die1, die2)).to eq "Player 1 is on square #{player1.move(die1,die2)}"
    end
  end

  describe '#player2_' do
    let(:die1) { 4 }
    let(:die2) { 1 }
    it 'should roll dice and move player 2' do
      allow(player2).to receive(:move) { 5 }
      expect(game.player2_(die1, die2)).to eq "Player 2 is on square #{player2.move(die1, die2)}"
    end
  end

  describe '#switch_turn' do
    let(:die1) { 1 }
    let(:die2) { 4 }
    it 'should switch whose turn it is' do
      allow(game).to receive(:switch_turn)
      game.player1_(die1, die2)
      expect(game).to have_received(:switch_turn)
    end
  end

  describe '#game_over' do
    it 'should say game over if a player has won' do
      game.play(98, 2)
      expect(game.play(5, 1)).to eq 'Game over'
    end
  end
end
