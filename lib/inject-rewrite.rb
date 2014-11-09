class Array

	def my_inject
		temp_array = self.dup
		accum = temp_array[0]
		temp_array.delete_at(0)
		temp_array.count.times do
			accum = yield(accum, temp_array[0])
			temp_array.delete_at(0)
			end
		return accum
	end

end

a = [1,2,3,4]
sum_proc = Proc.new{|memo, num| memo + num}
puts a.inject(&sum_proc)
puts a.my_inject(&sum_proc)
puts "........"
b = [2,3,4,5,6]
multi_proc = Proc.new{|memo, num| memo * num}
puts b.inject(&multi_proc)
puts b.my_inject(&multi_proc)
puts "........"
c = [1000, 2, 4]
div_proc = Proc.new{|memo, num| memo / num}
puts c.inject(&div_proc)
puts c.my_inject(&div_proc)
puts "........"
d = ["the", "inject", "method"]
string_proc = Proc.new{|memo, word| memo << word}
puts d.inject(&string_proc)
e = ["the", "inject", "method"]
puts e.my_inject(&string_proc)
