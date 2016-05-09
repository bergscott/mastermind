require "spec_helper"

module Mastermind
  describe Game do
    context "#initialize" do
      it "is initialized with 12 turns remaining by default" do
        game = Game.new
        expect(game.turns).to eq 12
      end
      it "is initialized with code length of 4 by default" do
        game = Game.new
        expect(game.code_length).to eq 4
      end
      it "is initialized with 6 colors by default" do
        game = Game.new
        expect(game.colors).to eq 6
      end
      it "is initilized with a random code of length 4 by default" do
        game = Game.new
        expect(game.code.length).to eq 4
      end
    end

    context "#turns" do
      it "returns the number of turns remaining" do
        game = Game.new({turns: 8})
        expect(game.turns).to eq 8
      end
    end

    context "get_player" do
      it "returns a HumanPlayer when user inputs H" do
        game = Game.new
        expect(game.get_player(choice="h", name="Test")).to be_a HumanPlayer
      end

      it "returns a ComputerPlayer when user inputs C" do
        game = Game.new
        expect(game.get_player(choice="c", name="Bot")).to be_a ComputerPlayer
      end
    end

    context "#winner?" do
      it "returns true if code was guessed correctly" do
        game = Game.new
        expect(game.winner?({exact: 4})).to be true
      end
      it "returns false if code does not match exactly" do
        game = Game.new
        expect(game.winner?({exact: 3})).to be false
      end
    end
        
  end
end
