require_relative 'player.rb'
class Game
  @@word_pool = File.readlines('lib/hangman/words.txt', chomp: true)
  attr_accessor :secret_word, :player
  def initialize(player)
    @secret_word = random_word
    @player = player
    initial_guessed_letters(player)
    player.lives = 6
  end

  def show_correct_letters
    p player.guessed_letters.join(' ').upcase
  end
  def player_win?
    if player.guessed_letters.include?('___')
      false
    else
      true
    end
  end
  def evaluate_guess(guess)
    puts ''
    puts 'type "save" to save the game!'
    if guess.downcase == 'save'
      save_game
      puts 'game saved sucessfully!'
    elsif secret_word.include?(guess.downcase)
      index = secret_word.index(guess.downcase)
      self.secret_word[index] = '___'
      player.guessed_letters[index] = guess.downcase
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
      player.guessed_letters << '___'
    end
  end

  def save_game
    File.open("lib/hangman/saves/#{Time.now.strftime("%Y-%m-%d_%H-%M-%S")}.yml", 'w') do |file|
      file.write(player.to_yaml)
    end
  end
end

# player = Player.new
# game = Game.new(player)
# p game.secret_word
# game.evaluate_guess('i')
# p player.lives
# p player.guessed_letters

