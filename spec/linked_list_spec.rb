require "spec_helper"
module DataStructures
  describe LinkedList do
    subject {  LinkedList.new(2, 9, 10, 19) }


    let(:empty_list){  LinkedList.new  }

    describe '#initialize' do 
      it "set head" do 
         
         expect(subject.head.value).to eq 2
      end

      it "set tail" do 
         linked_list = LinkedList.new(2, 9, 10, 19)
         expect(subject.tail.value).to eq 19
      end
    end

    describe "to_a" do 
      it "return values as an array" do 
        expect(subject.to_a).to eq [2, 9, 10, 19]
      end
    end

    describe "#insert_at" do 
      context "at position 0" do 
        context "empty list" do 
          it "returns only one element" do 
            empty_list.insert_at(11, 0)
            expect(empty_list.to_a).to eq [11]
          end
          it "set head" do 
            empty_list.insert_at(11, 0)
            expect(empty_list.head.value).to eq 11
          end
        end
        it "return value at the first element" do 
          subject.insert_at(9, 0)
          expect(subject.to_a).to eq [9, 2, 9, 10, 19]
        end
        it "set first element as head" do 
          subject.insert_at(29, 0)
          expect(subject.head.value).to eq 29
        end
      end
    end

    describe "#delete_at" do 
      context "at position 0" do 
        it "return the deleted element" do 
          expect(subject.delete_at(0)).to eq 2
        end
        it "raise an error if the index is not defined" do 
          expect{
            empty_list.delete_at(0)
          }.to raise_error EmptyLinkedListError
        end
      end

    end

		describe "#empty" do
			it { expect(subject.empty?).to eq false }
			it { expect(empty_list.empty?).to eq true }
		end

		describe "#find_from_the_end"  do

			it { expect(subject.find_from_the_end(1).value).to eq 10 }
			it { expect(subject.find_from_the_end(3).value).to eq 2 }
			it "raise an error when index is out of bounds" do
				expect{
						subject.find_from_the_end(4)
				}.to raise_error IndexError
			end
		end
    describe '#to_s' do 
      it "prints values" do
         expect(subject.to_s).to eq '[2, 9, 10, 19]'
      end 
		end

		describe '#is_circular?' do
			it "return true when linked list is circual" do
				linked_list = LinkedList.new(92, 28, 21)
				linked_list.tail.next = subject.head
				subject.tail.next = linked_list.tail
				expect(linked_list).to be_circular
			end
		end

		describe "#loop_length_of_circular_list" do
			it "return true when linked list is circual" do
				linked_list = LinkedList.new(92, 28, 21, 100)
				linked_list.tail.next = subject.head
				subject.tail.next = linked_list.tail
				expect(linked_list.loop_length_of_circular_list).to eq 4
			end
		end
  end
end