require 'yaml'
class Player
  attr_accessor :lives, :guessed_letters
  def initialize
    @lives = nil
    @guessed_letters = []
  end

  def make_guess
    puts ' make your guess:'
    gets.chomp.downcase
  end

  def to_yaml
    YAML.dump({
      :lives => lives,
      :guessed_letters => guessed_letters,
    })
  end

  def self.from_yaml(file)
    contents = YAML.load(file)
    self.new(contents[:lives], contents[:guessed_letters])
  end
end
puts 'player.rb has loaded :>'