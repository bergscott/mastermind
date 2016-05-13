require "spec_helper"

module Mastermind
  describe HumanPlayer do
    context "#initialize" do
      it "prompts the user for a name when initialized" do
        player = HumanPlayer.new(name="Human")
        expect(player.name).to eq "Human"
      end
    end
    
    context "#get_guess" do
      it "retrieves a guess from the user" do
        player = HumanPlayer.new(name="Human")
        expect(player.get_guess(nil, "1 2 3 4")).to eq Code.new_from_array([1,2,3,4])
      end
    end

  end
end
