require 'spec_helper'

describe Game do
  let (:player_1) { Player.new('X') }
  let (:player_2) { Player.new('O') }

  context "#initialize" do
    it "sets player one to go first" do
      game = Game.new([player_1, player_2])
      expect(game.current_player).to eq player_1
      expect(game.other_player).to eq player_2
    end
  end

  context "#players" do
    it "returns both players" do
      game = Game.new([player_1, player_2])
      expect(game.players).to eq([player_1, player_2])
    end
  end

  context "#board" do
    it "returns a board" do
      game = Game.new([player_1, player_2])
      expect(game.board.class).to eq(Board)
    end
  end

  context "#switch_players" do
    it "sets the other play to be the current player" do
      game = Game.new([player_1, player_2])
      expect(game.current_player).to eq(player_1)

      game.switch_players
      expect(game.current_player).to eq(player_2)
      expect(game.other_player).to eq(player_1)
    end
  end
end
