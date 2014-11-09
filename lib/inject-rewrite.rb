a = [5,6,7,8,9]

class Array

	def my_inject
		temp_array = self.dup
		num = temp_array[0]
		temp_array.delete_at(0)
		iterations = temp_array.count
		iterations.times do
			num = yield(num, temp_array[0])
			temp_array.delete_at(0)
		end
		return num
	end
end

add = Proc.new {|num, n|num + n}
puts "MY METHOD"
puts a.my_inject(&add)
puts "......."
puts "INJECT METHOD"
puts a.inject(&add)
