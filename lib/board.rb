require_relative './cell.rb'

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
end
