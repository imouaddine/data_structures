module DataStructures
  class EmptyStackError < StandardError; end


  class Stack

    def initialize(*args)
      @a = LinkedList.new(*args)
    end

    def to_a
      @a.to_a
    end

    def push(value)
     @a.insert_at(value, 0)
    end

    def pop
			if empty?
				raise EmptyStackError
			else
      	@a.delete_at(0)
			end
		end

		def empty?
			@a.head.nil?
		end

  end

  
  

end