module Mastermind
  class Code

    def self.new_random(values, num_cells = 4)
      cells = []
      num_cells.times do 
        cells << Cell.new(values.sample)
      end
      Code.new(cells)
    end

    def self.new_from_array(values)
      Code.new(values.map { |value| Cell.new(value) })
    end

    def initialize(cells)
      @cells = cells
    end

    def length
      @cells.length
    end

    def ==(another_code)
      cells == another_code.cells
    end

    def compare(guess)
      raise "guess of incorrect length" if guess.length != length
      exact = 0
      color_only = 0
      possible_matches = []
      to_match = []
      guess.cells.each_with_index do |guess_cell, i|
        if guess_cell == cells[i]
          exact += 1
        else
          possible_matches << guess_cell
          to_match << cells[i]
        end
      end
      possible_matches.each do |possible_match|
        if to_match.include?(possible_match)
          color_only += 1
          to_match.delete_at(to_match.index(possible_match))
        end
      end
      {exact: exact, color: color_only}
    end

    def to_s
      cells.join(" ")
    end

    protected

    def cells
      @cells
    end

  end
end
