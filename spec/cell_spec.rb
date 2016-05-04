require "spec_helper"

module Mastermind
  describe Cell do

    context "#initialize" do
      it "is initialized with a value of '' by default" do
        cell = Cell.new
        expect(cell.value).to eq ''
      end

      it "can be initialized with a value of 'X'" do
        cell = Cell.new("X")
        expect(cell.value).to eq "X"
      end
    end

    context "#==" do
      it "returns true if the values of two cells are equal" do
        cell1 = Cell.new(1)
        cell2 = Cell.new(1)
        expect(cell1 == cell2).to be true
      end

      it "returns false if the values of two cells are not equal" do
        cell1 = Cell.new("a")
        cell2 = Cell.new(2)
        expect(cell1 == cell2).to be false
      end
    end

  end
end
