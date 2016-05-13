module Mastermind
  class Game
    attr_reader :turns, :code_length, :colors, :code, :player

    def initialize(input = {})
      @code_length = input.fetch(:code_length, default_code_length)
      @colors = input.fetch(:colors, default_colors)
      @turns = input.fetch(:turns, default_turns)
      @code = Code.new_random((1..colors).to_a, code_length)
    end

    def winner?(guess_hash)
      guess_hash[:exact] == code_length
    end

    def play
      @player ||= get_player
      result = nil
      turns_left = turns
      while turns_left > 0
        puts "\n#{turns_left} guesses remaining"
        result = evaluate_guess(result)
        if winner?(result)
          puts "\n#{player.name} wins after #{1+turns-turns_left} guesses!"
          return true
        else 
          puts show_result(result)
          turns_left -= 1
        end
      end
      puts "\nYou lose! secret code was #{code}"
      false
    end

    def get_player(choice=nil, name=nil)
      loop do
        unless choice
          puts "Enter 'H' for human guesser or 'C' for CPU guesser:"
          choice = gets.chomp
        end
        case choice.upcase
        when "H"
          return HumanPlayer.new(name: name, num_colors: colors)
        when "C"
          return ComputerPlayer.new(name: name, code_length: code_length,
                                    num_colors: colors)
        else
          puts "Invalid choice, try again!"
          choice = nil
        end
      end
    end

    private

    def evaluate_guess(result)
      code.compare(player.get_guess(result))
    rescue RuntimeError
      puts "\nInvalid guess!"
      retry
    end

    def default_code_length
      4
    end

    def default_colors
      6
    end

    def default_turns
      12
    end

    def show_result(result)
      "\nGuessed #{result[:exact]} slots correctly, and have #{result[:color]}"\
      " numbers correct, but in the wrong position.\n"
    end

  end
end
