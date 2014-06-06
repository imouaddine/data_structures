module DataStructures
	class EmptyLinkedListError < StandardError;
	end

	class LinkedList
		attr_accessor :head, :tail



		def initialize(*args)
			return unless args
			@head = nil
			@tail = nil
			current = nil
			args.each do |value|
				node = Node.new(value)
				unless @head
					@head = node
					current = @head
				else
					current.next = node
					current = node
				end
			end
			@tail = current
		end

		def to_a
			output = []
			current = head
			while current
				output << current.value
				current = current.next
			end
			output
		end

		def insert_at(value, index)
			node = Node.new(value)
			if index == 0
				if @head
					old_head = @head
					node.next = old_head
					@head = node
				else
					@head = @tail = node
				end
			else
				current = head
				previous = nil
				counter = 0
				while current
					if index == counter
						previous.next = node
						node.next = current
						return node
					end
					counter += 1
					previous = current
					current = current.next
				end

				if index == counter
					previous.next = node
					self.tail = node
				else
					raise IndexError, "position is greater than the length of the array"
				end

			end
		end

		def delete_at(index)
			value = nil
			if empty?
				raise EmptyLinkedListError, "Cannot delete from empty list"
			else
				if index == 0
					value = head.value
					self.head = head.next
				else
					current = head
					previous = nil
					counter = 0
					while current
						if index == counter
							previous.next = current.next
							if previous.next == nil
								self.tail = previous
							end
							return current
						end
						counter += 1
						previous = current
						current = current.next
					end


						raise IndexError, "position is greater than the length of the array"

				end
			end
			value
		end


		def reverse!
			if empty?
				return self
			end
			current = head
			previous = nil
			while current
				_next = current.next
				current.next = previous
				previous = current
				current = _next
			end
			self.tail = head
			self.head = previous
			self
		end


		def circular?
			return false if empty?

			slow_pointer = head
			fast_pointer = head

			while slow_pointer && fast_pointer
				fast_pointer = fast_pointer.next

				if fast_pointer == slow_pointer
					return true
				end

				if fast_pointer == nil
					return false
				end

				fast_pointer = fast_pointer.next

				if fast_pointer == slow_pointer
					return true
				end


				slow_pointer = slow_pointer.next
			end

			return false
		end

		def loop_length_of_circular_list
			slow_pointer = head
			fast_pointer = head

			is_circular = false
			while slow_pointer && fast_pointer
				fast_pointer = fast_pointer.next

				if fast_pointer == slow_pointer
					is_circular = true
					break
				end

				if fast_pointer == nil
					is_circular = false
					break
				end

				fast_pointer = fast_pointer.next

				if fast_pointer == slow_pointer
					is_circular = true
					break
				end


				slow_pointer = slow_pointer.next
			end

			if is_circular
				counter = 0
				fast_pointer = fast_pointer.next
				while slow_pointer != fast_pointer
					fast_pointer = fast_pointer.next
					counter += 1
				end
				counter
			end

		end

		def find_from_the_end(k)
			if empty?
				raise EmptyLinkedListError
			end

			current = head
			i = 0
			while current && i <= k
				current = current.next
				i += 1
			end

			if i <= k
				raise IndexError, "#{k} is greater than the length of the list"
			end

			behind = head
			while current
				current = current.next
				behind = behind.next
			end

			behind

		end

		def empty?
			head.nil?
		end

		def length
			to_a.length
		end

		alias_method :size, :length

		def to_s
			to_a.to_s
		end

		class Node
			attr_accessor :value, :next

			def initialize(value)
				@value = value
			end
		end
	end


end
