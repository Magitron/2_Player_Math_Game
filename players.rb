class Player
  attr_accessor :name, :lives, :score
  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def gain_a_point
    @score += 1
  end

  def lose_a_life
    @lives -= 1
  end
end





