require "spec_helper"

module Mastermind
  describe Code do
    
    context ".new_random" do
      
      it "returns a new code object" do
        code = Code.new_random([:red, :yellow, :blue, :green])
        expect(code).to be_instance_of(Code)
      end

      it "by default returns a code object with 4 cells" do
        code = Code.new_random([:red, :yellow, :blue, :green])
        expect(code.length).to eq 4
      end

      it "can create codes of varying lengths" do
        code = Code.new_random([:red, :yellow, :blue, :green], 6)
        expect(code.length).to eq 6
      end

    end    

    context ".new_from_array" do
      it "returns a code of same length as input" do
        input = [1,2,3,4]
        expect(Code.new_from_array(input).length).to eq input.length
      end
    end
    
    context "#initialize" do
      it "initializes the code with a number of cells equal to the length of
      the array parameter" do
        code = Code.new([1,2,3,4])
        expect(code.length).to eq(4)
      end
    end

    context "#length" do
      it "reports its length (number of cells)" do
        code = Code.new([1,2,3,4])
        expect(code.length).to eq 4
      end
    end

    context "#==" do
      it "returns true if two code's cells are equal" do
        code1 = Code.new_from_array([1,2,3,4])
        code2 = Code.new_from_array([1,2,3,4])
        expect(code1 == code2).to be true
      end
      it "returns false if two code's cells are not equal" do
        code1 = Code.new_from_array([1,2,3,4])
        code2 = Code.new_from_array([1,2,3,5])
        expect(code1 == code2).to be false
      end
    end

    context "#compare" do

      it "raises an error if guess is of different length than code" do
        code = Code.new([1,2])
        guess = Code.new([1])
        expect { code.compare(guess) }.to raise_error(RuntimeError)
      end

      it "returns hash of exact and color-only matches" do
        code = Code.new([1,2,3,1])
        guess = Code.new([3,1,3,4])
        guess2 = Code.new([1,2,3,1])
        guess3 = Code.new([2,1,1,3])
        guess4 = Code.new([5,5,5,5])
        guess5 = Code.new([2,1,3,1])
        expect(code.compare(guess)).to eq({exact: 1, color: 1})
        expect(code.compare(guess2)).to eq({exact: 4, color: 0})
        expect(code.compare(guess3)).to eq({exact: 0, color: 4})
        expect(code.compare(guess4)).to eq({exact: 0, color: 0})
        expect(code.compare(guess5)).to eq({exact: 2, color: 2})
      end
    end

  end
end
