class Player
  attr_accessor :lives, :guessed_letters
  def initialize
    @lives = nil
    @guessed_letters = []
  end
end
puts 'player.rb has loaded :>'