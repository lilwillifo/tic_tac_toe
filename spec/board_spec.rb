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

  context "#game_over?" do
    it "returns winner if there is a winner" do
      board = Board.new()
      board.stub(:winner?) { true }
      expect(board.game_over).to eq :winner
    end
    it "returns tie if there is a tie" do
      board = Board.new()
      board.stub(:tie?) { true }
      expect(board.game_over).to eq :tie
    end
    it "otherwise returns false" do
      board = Board.new()
      expect(board.game_over).to eq false
    end
  end

  context "#tie?" do
    it "returns true if all spaces are filled" do
      board = Board.new()
      board.stub(:grid) { [[Cell.new('X'), Cell.new('O'), Cell.new('X')],
                           [Cell.new('X'), Cell.new('O'), Cell.new('X')],
                           [Cell.new('O'), Cell.new('X'), Cell.new('O')]] }
      expect(board.tie?).to eq true
    end
    it "returns false if not all spaces are filled" do
      board = Board.new()
      board.stub(:grid) { [[Cell.new('X'), Cell.new(), Cell.new('X')],
                           [Cell.new('X'), Cell.new('O'), Cell.new('X')],
                           [Cell.new('O'), Cell.new('X'), Cell.new('O')]] }
      expect(board.tie?).to eq false
    end
  end

  context "#winner?" do
    it "returns true if all one row matches" do
      board = Board.new()
      board.stub(:grid) { [[Cell.new('X'), Cell.new('X'), Cell.new('X')],
                           [Cell.new(''), Cell.new(''), Cell.new('X')],
                           [Cell.new('O'), Cell.new('X'), Cell.new('O')]] }
      expect(board.winner?).to eq true
    end
    it "returns true if all one column match" do
      board = Board.new()
      board.stub(:grid) { [[Cell.new('X'), Cell.new(''), Cell.new('O')],
                           [Cell.new('X'), Cell.new('O'), Cell.new('X')],
                           [Cell.new('X'), Cell.new('O'), Cell.new('O')]] }
      expect(board.winner?).to eq true
    end
    it "returns true if all diagonals match" do
      board = Board.new()
      board.stub(:grid) { [[Cell.new('X'), Cell.new('O'), Cell.new('X')],
                           [Cell.new('X'), Cell.new('X'), Cell.new('X')],
                           [Cell.new('O'), Cell.new(''), Cell.new('X')]] }
      expect(board.winner?).to eq true
    end
    it "returns false if no winning position" do
      board = Board.new()
      board.stub(:grid) { [[Cell.new(''), Cell.new('O'), Cell.new('X')],
                           [Cell.new('X'), Cell.new('O'), Cell.new('X')],
                           [Cell.new('O'), Cell.new('X'), Cell.new('O')]] }
      expect(board.winner?).to eq false
    end
  end
end
