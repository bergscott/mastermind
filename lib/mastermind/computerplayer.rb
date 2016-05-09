module Mastermind
  class ComputerPlayer < Player
    attr_reader :possibilities

    def initialize(input)
      super(input.fetch(:name, nil) || "CPU")
      @possibilities = init_possibilities(input.fetch(:num_colors),
                                          input.fetch(:code_length))
    end

    private
    
    def init_possibilities(num_colors, length)
      (1..num_colors).to_a.repeated_permutation(length).to_a
    end

  end
end
