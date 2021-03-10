class SnakesAndLadders

attr_reader :turn

  def initialize
    @player1 = Player.new
    @player2 = Player.new
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

class Player
LOCATION_LADDERS = {
  2 => 38, 7 => 14, 8 => 31, 15 => 26, 21 => 42, 36 => 44, 51 => 67, 71 => 91, 78 => 98, 87 => 94
}
LOCATION_SNAKES = {
  16 => 6, 46 => 25, 49 => 11, 62 => 19, 64 => 60, 74 => 53, 89 => 68, 92 => 88, 95 => 75, 99 => 80
}

  attr_reader :location

  def initialize(location = 0)
    @location = location
    @turn = Turns.new
    @moving_back = 0
  end

  def move(die1, die2)
    @location = [@location += @turn.count_dice(die1, die2), LOCATION_LADDERS[@location], LOCATION_SNAKES[@location]].compact.last
    near_the_end
    congratz
  end

  def ladders_or_snakes
    [@location += @turn.count_dice(die1, die2), LOCATION_LADDERS[@location], LOCATION_SNAKES[@location]].compact.last
  end

  def next_player?(die1, die2)
    !@turn.equal?(die1, die2)
  end

  def finish
    @location == 100
  end

  def congratz
    finish ? "Congratz! You won" : @location
  end

  def near_the_end
    @location >= 100 ? @location -= ((@location - 100) * 2) : @location
  end

end

class Turns

  attr_reader :die1, :die2

  def count_dice(die1, die2)
    [die1, die2].sum
  end

  def equal?(die1, die2)
    die1 == die2
  end

end
