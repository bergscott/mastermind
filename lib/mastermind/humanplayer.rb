module Mastermind
  class HumanPlayer < Player
    def initialize(name=nil)
      unless name
        puts "Enter player's name: "
        name = gets.chomp
      end
      super(name)
    end

    def get_guess(_result, guess=nil)
      unless guess
        puts "\nEnter guess (separate cells with spaces:)"
        guess = gets.chomp
      end
      Code.new_from_array(parse_user_guess(guess))
    end

    private

    def parse_user_guess(guess)
      guess.split.map {|v| v.to_i }
    end

  end
end
