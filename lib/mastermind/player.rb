module Mastermind
  class Player
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def get_guess(_result)
      raise NotImplementedError
    end

  end
end
