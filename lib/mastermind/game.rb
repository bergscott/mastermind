module Mastermind
  class Game
    attr_reader :turns, :code_length, :colors, :code

    def initialize(input = {})
      @code_length = input.fetch(:code_length, default_code_length)
      @colors = input.fetch(:colors, default_colors)
      @turns = input.fetch(:turns, default_turns)
      @code = Code.new_random((1..colors).to_a, code_length)
    end

    def color_name(n)
      color_dict.fetch(n)
    end

    def get_guess(guess = gets.chomp)
      Code.new_from_array(parse_user_guess(guess))
    end

    private

    def default_code_length
      4
    end

    def default_colors
      6
    end

    def default_turns
      12
    end

    def color_dict
      {1 => "red", 
       2 => "blue", 
       3 => "green", 
       4 => "yellow", 
       5 => "black", 
       6 => "white", 
       7 => "purple", 
       8 => "orange"}
    end

    def parse_user_guess(guess)
      guess.split.map { |v| v.to_i }
    end

  end
end
