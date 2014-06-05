require "spec_helper"

module DataStructures
  describe Stack do 

    subject{ Stack.new(5, 2, 1, 9) }
    let(:empty_stack) { Stack.new}
    describe "#to_a" do 
        it "return an array" do 
          expect(subject.to_a).to eq [5, 2, 1, 9]
        end
    end
    describe "#push" do 
      it "push values to the stack" do 
        subject.push(22)
        expect(subject.to_a).to eq [22,5,2,1,9]
      end

      it "push values to empty stack" do 
        empty_stack.push(22)
        expect(empty_stack.to_a).to eq [22]
      end
    end
    describe "#pop" do 
      it "remove the first element" do 
        subject.pop
        expect(subject.to_a).to eq [2,1,9]
      end
      it "return the first element" do 
        expect(subject.pop).to eq 5
				expect(subject.pop).to eq 2
				expect(subject.pop).to eq 1
      end
      it "raise an error when stack is empty" do 
        expect{
          empty_stack.pop  
        }.to raise_error EmptyStackError
        
      end
		end

		describe "#empty" do
			it { expect(empty_stack.empty?).to eq true }
			it { expect(subject.empty?).to eq false }
		end
  end
end