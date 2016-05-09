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
  end
end
