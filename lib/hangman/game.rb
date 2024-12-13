require_relative 'player.rb'
class Game
  @@word_pool = File.readlines('words.txt', chomp: true)
  attr_accessor :secret_word, :player
  def initialize(player)
    @secret_word = random_word
    @player = player
    initial_guessed_letters(player)
    player.lives = 6
  end

  def show_correct_letters
    player.guessed_words.join('').upcase
  end

  def evaluate_guess(guess)
    if secret_word.include?(guess)
      index = secret_word.index(guess)
      self.secret_word[index] = '-'
      player.guessed_letters[index] = guess
    else
      player.lives -= 1
    end
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

  def initial_guessed_letters(player)
    secret_word.length.times do
      player.guessed_letters << '-'
    end
  end
end

player = Player.new
game = Game.new(player)
p game.secret_word
game.evaluate_guess('i')
p player.lives
p player.guessed_letters

