require 'spec_helper'

describe Game do
  let (:player_1) { Player.new('X') }
  let (:player_2) { Player.new('O') }
  let (:game) {Game.new([player_1, player_2])}

  context "#initialize" do
    it "sets player one to go first" do
      expect(game.current_player).to eq player_1
      expect(game.other_player).to eq player_2
    end
  end

  context "#players" do
    it "returns both players" do
      expect(game.players).to eq([player_1, player_2])
    end
  end

  context "#board" do
    it "returns a board" do
      expect(game.board.class).to eq(Board)
    end
  end

  context "#switch_players" do
    it "sets the other play to be the current player" do
      expect(game.current_player).to eq(player_1)

      game.switch_players
      expect(game.current_player).to eq(player_2)
      expect(game.other_player).to eq(player_1)
    end
  end

  context "#text_for_human_turn" do
    it "asks where they want to move" do
      expected = "Where do you want to move? Enter the grid coordinates, like A1 or C2."
      expect(game.text_for_human_turn).to eq(expected)
    end
  end

  context "#get_move" do
    it "converts human_move of 'A1' to [0, 0]" do
      expect(game.get_move("A1")).to eq [0, 0]
    end

    it "converts human_move of 'C1' to [0, 2]" do
      expect(game.get_move("C1")).to eq [0, 2]
    end
  end

  context "#game_over_message" do
    it "returns who won if there is a winner" do
      allow_any_instance_of(Game).to receive(:current_player).and_return(player_1)
      allow_any_instance_of(Board).to receive(:game_over).and_return(:winner)
      expect(game.game_over_message).to eq "X won!"
    end
    it "returns a tie if there is a tie" do
      allow_any_instance_of(Board).to receive(:game_over).and_return(:tie)
      expect(game.game_over_message).to eq "The game ended in a tie"
    end
    it "returns a nil if the game isn't over" do
      expect(game.game_over_message).to eq nil
    end
  end
end
