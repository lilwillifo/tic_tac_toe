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

    it "letter is case insensitive" do
      player = Player.new('x')
      expect(player.letter).to eq 'X'
    end

    it "defaults to not being a computer user" do
      player = Player.new('x')
      expect(player.is_computer).to eq false
    end

    it "allows you to set is computer to true" do
      player = Player.new('x', true)
      expect(player.is_computer).to eq true
    end
  end
end
