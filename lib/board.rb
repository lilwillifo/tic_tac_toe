require_relative './cell.rb'
require 'pry'

class Board
  attr_reader :grid

  def initialize
    @grid = default_grid
  end

  def default_grid
    [[Cell.new, Cell.new, Cell.new],
    [Cell.new, Cell.new, Cell.new],
    [Cell.new, Cell.new, Cell.new]]
  end

  def get_cell(x, y)
    grid[y][x]
  end

  def set_cell(x, y, value)
    if get_cell(x,y).value.empty?
      get_cell(x, y).value = value
    end
  end

  def game_over
    return :winner if winner?
    return :tie if tie?
    false
  end

  def winner?
    winning_positions.each do |position|
      values = position.map(&:value)
      next if values.all? { |value| value == '' }
      return true if values.all? { |value| value == values[0] }
    end
    false
  end

  def winning_position_values(winning_position)
    winning_position.map { |cell| cell.value }
  end

  def tie?
    grid.flatten.all? do |cell|
      !cell.value.empty?
    end
  end

  def formatted_grid
    puts '   A B C'
    grid.each_with_index do |row, index|
      row_label = "#{index + 1}| "
      print row_label
      puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
    end
  end

  private

  def winning_positions
    grid + grid.transpose + diagonals
  end

  def diagonals
    [
      [get_cell(0,0), get_cell(1,1), get_cell(2,2)],
      [get_cell(0,2), get_cell(1,1), get_cell(2,0)]
    ]
  end

end
