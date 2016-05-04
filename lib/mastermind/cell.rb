module Mastermind
  class Cell
    attr_reader :value
    
    def initialize(value = "")
      @value = value
    end

    def ==(another_cell)
      value == another_cell.value  
    end
    
  end
end
