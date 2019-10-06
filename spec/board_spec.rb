require 'spec_helper'

describe Board do
  context "#initialize" do
    it "sets up the board with a grid" do
      board = Board.new()
      expect{board.grid}.to_not raise_error
    end
  end
  context "#grid" do
    it "defaults to a 3x3 array" do
      board = Board.new()
      expect(board.grid.length).to eq(3)
      board.grid.each do |row|
        expect(row.length).to eq(3)
      end
    end
  end
  context "#get_cell" do
    it "returns the value of the cell object at a (x, y) coordinate" do
      board = Board.new()
      board.get_cell(0, 0)
      expect(board.get_cell(0, 0).value).to eq ""
    end
  end
  context "#set_cell" do
    it "updates the value of the cell object at a (x, y) coordinate" do
      board = Board.new()
      board.set_cell(0, 0, "X")
      expect(board.get_cell(0, 0).value).to eq "X"
    end
  end
end
