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
    "Where do you want to move?"
  end

  def get_move(move = gets.chomp)
    MAPPING[move]
  end

  def game_over_message
    return "#{current_player.letter} won!" if board.game_over == :winner
    return "The game ended in a tie" if board.game_over == :tie
  end

  def play
    "Welcome!"
    while true
      board.formatted_grid
      puts ""
      puts text_for_human_turn
      x, y = get_move
      board.set_cell(x, y, current_player.letter)
      if board.game_over
        puts game_over_message
        board.formatted_grid
        return
      else
        switch_players
      end
    end
  end
end
