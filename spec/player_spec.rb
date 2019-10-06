require 'spec_helper'

describe Player do
  context "#initialize" do
    it "sets the letter of the player with X" do
      player = Player.new('X')
      expect(player.letter).to eq 'X'
    end

    it "sets the letter of the player with O" do
      player = Player.new('O')
      expect(player.letter).to eq 'O'
    end

    it "is case insensitive" do
      player = Player.new('x')
      expect(player.letter).to eq 'X'
    end

    it "defaults to X if no letter is specified" do
      player = Player.new()
      expect(player.letter).to eq 'X'
    end

    it "defaults back to X if another letter is selected" do
      player = Player.new('A')
      expect(player.letter).to eq 'X'
    end
  end
end
