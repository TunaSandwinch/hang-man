class Game
  @@word_pool = File.readlines('words.txt', chomp: true)
  attr_accessor :secret_word
  def initialize
    @secret_word = random_word
  end

  def random_word
    secret_word = @@word_pool[rand(0..999)]
    if secret_word.length >= 5 && secret_word.length <= 12
      secret_word.split('')
    else
      random_word
    end
  end
end

test = Game.new
p test.secret_word

