require_relative 'player.rb'
class Game
  @@word_pool = File.readlines('words.txt', chomp: true)
  attr_accessor :secret_word
  def initialize(player)
    @secret_word = random_word
    @player = player
    initial_guessed_words(player)
    player.lives = 6
  end

  private
  def random_word
    secret_word = @@word_pool[rand(0..999)]
    if secret_word.length >= 5 && secret_word.length <= 12
      secret_word.split('')
    else
      random_word
    end
  end

  def initial_guessed_words(player)
    secret_word.length.times do
      player.guessed_words << '-'
    end
  end
end

player = Player.new
game = Game.new(player)
p player.guessed_words

