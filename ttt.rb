require_relative "./lib/tic_tac_toe.rb"

puts "Welcome to tic tac toe"
puts "Which player do you want to be? X or O?"
response = gets.chomp
until ['X', 'O'].include? response.upcase
  puts "Let's try that again. Please enter X or O."
  response = gets.chomp
end
player_1 = Player.new(response.upcase)
player_2 = Player.new((['X', 'O'] - [response.upcase]).first)
Game.new([player_1, player_2]).play
