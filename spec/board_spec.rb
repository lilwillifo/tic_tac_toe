require 'spec_helper'

describe Board do
  let(:board) { Board.new()}

  context "#initialize" do
    it "sets up the board with a grid" do
      expect{board.grid}.to_not raise_error
    end
  end

  context "#grid" do
    it "defaults to a 3x3 array" do
      expect(board.grid.length).to eq(3)
      board.grid.each do |row|
        expect(row.length).to eq(3)
      end
    end
  end

  context "#get_cell" do
    it "returns the value of the cell object at a (x, y) coordinate" do
      board.get_cell(0, 0)
      expect(board.get_cell(0, 0).value).to eq ""
    end
  end

  context "#set_cell" do
    it "updates the value of the cell object at a (x, y) coordinate" do
      board.set_cell(0, 0, "X")
      expect(board.get_cell(0, 0).value).to eq "X"
    end
  end

  context "#game_over?" do
    it "returns winner if there is a winner" do
      allow_any_instance_of(Board).to receive(:winner?).and_return(true)
      expect(board.game_over).to eq :winner
    end
    it "returns tie if there is a tie" do
      allow_any_instance_of(Board).to receive(:tie?).and_return(true)
      expect(board.game_over).to eq :tie
    end
    it "otherwise returns false" do
      expect(board.game_over).to eq false
    end
  end

  context "#tie?" do
    let(:x) { Cell.new('X') }
    let(:o) { Cell.new('O') }
    let(:empty) { Cell.new('') }
    it "returns true if all spaces are filled" do
      grid = [ [x, o, x],
               [x, o, x],
               [o, x, o] ]
      allow_any_instance_of(Board).to receive(:grid).and_return(grid)
      expect(board.tie?).to eq true
    end
    it "returns false if not all spaces are filled" do
      grid = [ [x, empty, x],
               [x, o, x],
               [o, x, o] ]
      allow_any_instance_of(Board).to receive(:grid).and_return(grid)
      expect(board.tie?).to eq false
    end
  end

  context "#winner?" do
    let(:x) { Cell.new('X') }
    let(:o) { Cell.new('O') }
    let(:empty) { Cell.new('') }
    it "returns true if all one row matches" do
      grid = [[x, x, x],
              [empty, empty, x],
              [o, x, o] ]
      allow_any_instance_of(Board).to receive(:grid).and_return(grid)
      expect(board.winner?).to eq true
    end
    it "returns true if all one column match" do
      grid = [ [x, empty, o],
               [x, o, x],
               [x, o, o] ]
      allow_any_instance_of(Board).to receive(:grid).and_return(grid)
      expect(board.winner?).to eq true
    end
    it "returns true if all diagonals match" do
      grid = [ [x, o, x],
               [x, x, x],
               [o, empty, x] ]
      allow_any_instance_of(Board).to receive(:grid).and_return(grid)
      expect(board.winner?).to eq true
    end
    it "returns false if no winning position" do
      grid = [ [empty, o, x],
               [x, o, x],
               [o, x, o] ]
      expect(board.winner?).to eq false
    end
  end
end
