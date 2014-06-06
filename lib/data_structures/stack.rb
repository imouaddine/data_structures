module DataStructures
	#Underflow
  class EmptyStackError < StandardError; end


  class Stack

    def initialize(*args)
      @a = LinkedList.new(*args)
    end

    def to_a
      @a.to_a
    end


		def top
			@a.head
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

		def length
			@a.length
		end

		alias_method :size, :length
  end

  
  

end