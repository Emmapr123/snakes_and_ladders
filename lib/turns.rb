class Turns

  attr_reader :die1, :die2

  def count_dice(die1, die2)
    [die1, die2].sum
  end

  def equal?(die1, die2)
    die1 == die2
  end

end
