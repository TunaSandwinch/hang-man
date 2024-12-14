require_relative 'lib/hangman.rb'

player = Player.new
game = Game.new(player)

while player.lives.positive?
  puts "current lives: #{player.lives}"
  game.show_correct_letters
  game.evaluate_guess(player.make_guess)
  puts ''
  puts ''
 
  
  if game.player_win?
    p 'you win! :>'
    break
  elsif player.lives == 0
    p  'you lose! :<'
  end


end