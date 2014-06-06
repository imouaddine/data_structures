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
					expect(subject.to_a).to eq [29, 2, 9, 10, 19]
        end
			end
			context "at position greater than 0 and less than length" do
				it "insert node at position" do
					subject.insert_at(29, 2)
					expect(subject.to_a).to eq [2, 9, 29, 10, 19]
				end
			end
			context "at length" do
				it "insert node at position" do
					subject.insert_at(29, subject.length)
					expect(subject.to_a).to eq [2, 9, 10, 19, 29]

				end
				it "set as tail" do
					subject.insert_at(29, subject.length)
					expect(subject.tail.value).to eq 29
				end
			end

			context "position is greater than length" do
				it "raise error" do
					expect{
						subject.insert_at(29, subject.length + 2)
					}.to raise_error IndexError
				end
			end
		end
	 	describe "#reverse!" do
			context "more than one element" do
				it "reverse elements" do
					expect(subject.reverse!.to_a).to eq [19, 10, 9 ,2]
				end
				it "tail should be head" do
					expect(subject.reverse!.head.value).to eq 19
				end
				it "head should be tail" do
					expect(subject.reverse!.tail.value).to eq 2
				end
			end
			context "only one element" do
				subject { LinkedList.new(1) }
				it "reverse elements" do
					expect(subject.reverse!.to_a).to eq [1]
				end
				it "tail should be head" do
					expect(subject.reverse!.head.value).to eq 1
				end
				it "head should be tail" do
					expect(subject.reverse!.tail.value).to eq 1
				end
			end
			context "empty" do

				it "reverse elements" do
					expect(empty_list.reverse!.to_a).to eq []
				end
				it "tail should be head" do
					expect(empty_list.reverse!.head).to eq nil
				end
				it "head should be tail" do
					expect(empty_list.reverse!.tail).to eq nil
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
			context "at position greater than 0 and less than length" do
				it "insert node at position" do
					subject.delete_at(2)
					expect(subject.to_a).to eq [2, 9, 19]
				end
			end
			context "at length - 1" do
				it "insert node at position" do
					subject.delete_at(subject.length - 1)
					expect(subject.to_a).to eq [2, 9, 10 ]

				end
				it "set as tail" do
					subject.delete_at(subject.length - 1)
					expect(subject.tail.value).to eq 10
				end
			end

			context "position is greater than length" do
				it "raise error" do
					expect{
						subject.delete_at(subject.length )
					}.to raise_error IndexError
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

		describe '#length' do
			it "return the correct length" do
				expect(subject.length).to eq 4
				expect(empty_list.length).to eq 0
			end
		end

		describe '#size' do
			it "alias of length" do
				expect(subject.size).to eq subject.length
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