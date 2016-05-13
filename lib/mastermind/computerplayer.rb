module Mastermind
  class ComputerPlayer < Player
    attr_reader :possibilities, :last_guess

    def initialize(input)
      @code_colors = input.fetch(:num_colors)
      @code_length = input.fetch(:code_length)
      super(input.fetch(:name, nil) || "CPU")
      @possibilities = init_possibilities(@code_colors, @code_length)
    end

    def get_guess(result)
      if result
        filter_possibilities(result)
      end
      self.last_guess = possibility_to_code(possibilities.sample)
      puts "\nComputer guesses #{last_guess}"
      last_guess
    end

    private
    
    def init_possibilities(num_colors, length)
      (1..num_colors).to_a.repeated_permutation(length).to_a
    end

    def filter_possibilities(result)
      possibilities.select! do |possibility| 
        possibility_to_code(possibility).compare(last_guess) == result
      end
    end

    def possibilities=(list_of_possibilities)
      @possibilities = list_of_possibilities
    end

    def last_guess=(guess)
      @last_guess = guess
    end

    def possibility_to_code(possibility)
      Code.new_from_array(possibility)
    end

  end
end
