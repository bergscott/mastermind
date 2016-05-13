module Mastermind
  class HumanPlayer < Player
    attr_reader :num_colors

    def initialize(input)
      @num_colors = input.fetch(:num_colors)
      name = input.fetch(:name, nil)
      unless name
        puts "Enter player's name: "
        name = gets.chomp
      end
      super(name)
    end

    def get_guess(_result, guess=nil)
      unless guess
        puts "\nEnter guess (separate cells with spaces):"
        guess = gets.chomp
      end
      raise RuntimeError unless valid_guess?(guess)
      Code.new_from_array(parse_user_guess(guess))
    end

    private

    def parse_user_guess(guess)
      guess.split.map {|v| v.to_i }
    end

    def valid_guess?(guess)
      parse_user_guess(guess).all? {|cell| 0 < cell && cell <= num_colors}
    end

  end
end
