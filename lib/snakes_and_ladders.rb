class SnakesAndLadders

attr_reader :turn

  def initialize(player1= Player, player2 = Player)
    @player1 = player1.new
    @player2 = player2.new
    @turn = @player1
  end

  def play(die1, die2)
    @turn == @player1 ? player1_(die1, die2) : player2_(die1, die2)
  end

  def player1_(die1, die2)
    moved = @player1.move(die1, die2)
    return 'Game over' if @player2.finish
    switch_turn(die1, die2)
    "Player 1 is on square #{moved}"
  end

  def player2_(die1, die2)
    moved = @player2.move(die1, die2)
    return 'Game over' if @player1.finish
    switch_turn(die1, die2)
    "Player 2 is on square #{moved}"
  end

  def switch_turn(die1, die2)
    if @turn == @player1 && @player1.next_player?(die1, die2)
      @turn = @player2
    elsif @turn == @player2 && @player2.next_player?(die1, die2)
      @turn = @player1
    end
  end

end
