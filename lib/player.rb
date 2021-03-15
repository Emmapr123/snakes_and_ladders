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
  end

  def move(die1, die2)
    @location = [@location += @turn.count_dice(die1, die2), LOCATION_LADDERS[@location], LOCATION_SNAKES[@location]].compact.last
    near_the_end
    congratz
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
