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

    context "#get_guess" do
      it "retrieves a guess from the user" do
        game = Game.new
        expect(game.get_guess("1 2 3 4")).to eq Code.new_from_array([1,2,3,4])
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
