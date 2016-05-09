module Mastermind
  class ComputerPlayer < Player
    def initialize(name=nil)
      super(name || "CPU")
    end
  end
end
