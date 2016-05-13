require "spec_helper"

module Mastermind
  describe HumanPlayer do
    context "#initialize" do
      it "prompts the user for a name when initialized" do
        player = HumanPlayer.new(name: "Human", num_colors: 6)
        expect(player.name).to eq "Human"
      end
    end
    
    context "#get_guess" do
      it "retrieves a guess from the user" do
        player = HumanPlayer.new(name: "Human", num_colors: 6)
        expect(player.get_guess(nil, "1 2 3 4")).to eq Code.new_from_array([1,2,3,4])
      end

      it "raises error if user inputs number outside of num_colors" do
        player = HumanPlayer.new(name: "Human", num_colors: 6)
        expect { player.get_guess(nil, "1 2 3 7") }.to raise_error(RuntimeError)
      end
    end

  end
end
