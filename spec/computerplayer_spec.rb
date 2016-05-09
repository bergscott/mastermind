require "spec_helper"

module Mastermind
  describe ComputerPlayer do
    context "#initialize" do
      it "is initialized with a default name of CPU" do
        player = ComputerPlayer.new
        expect(player.name).to eq "CPU"
      end
    end
  end
end
