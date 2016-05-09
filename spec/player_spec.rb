require "spec_helper"

module Mastermind
  describe Player do
    context "#initialize" do
      it "is initialized with a name" do
        player = Player.new("Test")
        expect(player.name).to eq "Test"
      end
    end
  end
end
