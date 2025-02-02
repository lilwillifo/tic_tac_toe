class Game
  attr_reader :players, :board, :current_player, :other_player
  def initialize(players, board = Board.new)
    @players = players
    @board = board
    @current_player= players.first
    @other_player = players.last
  end

  MAPPING = {
              "A1" => [0, 0],
              "A2" => [1, 0],
              "A3" => [2, 0],
              "B1" => [0, 1],
              "B2" => [1, 1],
              "B3" => [2, 1],
              "C1" => [0, 2],
              "C2" => [1, 2],
              "C3" => [2, 2]
            }

  def switch_players
    @current_player, @other_player = other_player, current_player
  end

  def text_for_human_turn
    "Where do you want to move? Enter the grid coordinates, like A1 or C2."
  end

  def get_move(move = gets.chomp)
    if MAPPING.keys.include? move.upcase
      MAPPING[move.upcase]
    else
      puts "...You sure about that coordinate? Enter something like B3 or A2."
      get_move
    end
  end

  def game_over_message
    return "#{current_player.letter} won!" if board.game_over == :winner
    return "The game ended in a tie" if board.game_over == :tie
  end

  def play
    "Welcome!"
    while true
      current_player.is_computer ? take_computer_turn : take_human_turn
      if board.game_over
        puts game_over_message
        board.formatted_grid
        return
      else
        switch_players
      end
    end
  end

  def take_computer_turn
    puts "I'm thinking...."
    sleep(2)
    x = rand(0..2)
    y = rand(0..2)
    while !board.get_cell(x, y).value.empty?
      x = rand(0..2)
      y = rand(0..2)
    end
    board.set_cell(x, y, current_player.letter)
  end

  def take_human_turn
    board.formatted_grid
    puts ""
    puts text_for_human_turn
    x, y = get_move

    while !board.get_cell(x, y).value.empty?
      puts "Look closely! That spot already has a #{board.get_cell(x, y).value}!"
      puts "Try another coordinate"
      x, y = get_move
    end
    board.set_cell(x, y, current_player.letter)
  end
end
