require "spec_helper"

module Mastermind
  describe ComputerPlayer do
    context "#initialize" do
      it "is initialized with a default name of CPU" do
        player = ComputerPlayer.new(code_length: 4, num_colors: 6)
        expect(player.name).to eq "CPU"
      end

      it "is initialized with an array of all possible codes" do
        player = ComputerPlayer.new(code_length: 4, num_colors: 6)
        expect(player.possibilities.length).to eq(6**4)
      end
    end

    context "#get_guess" do
      it "returns a Code object" do
        player = ComputerPlayer.new(code_length: 4, num_colors: 6)
        expect(player.get_guess(nil)).to be_a Code
      end

      it "sets a last guess" do
        player = ComputerPlayer.new(code_length: 4, num_colors: 6)
        player.get_guess(nil)
        expect(player.last_guess).to be_a Code
      end

      it "filters possibilities" do
        player = ComputerPlayer.new(code_length: 4, num_colors: 6)
        player.get_guess(nil)
        possibilities1 = Array.new(player.possibilities)
        player.get_guess({exact: 1, color: 1})
        expect(player.possibilities.length).to be < possibilities1.length
      end

    end
        
  end
end
