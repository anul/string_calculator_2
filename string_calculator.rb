# Ruby on Rails code
# execute code using string_calculator.rb

def add(numbers)
	# custom delimiter
  numbers = numbers.to_s
  delimiter = ","
  if numbers[0] == "/" and numbers[1] == "/"
		delimiter = numbers[2]
		numbers = numbers.sub("//"+delimiter,"")
  end

	if numbers.empty?
		total = 0
	else
		total = numbers.split(delimiter).map {|n| n.split("\n")}.flatten
		total = total.map {|n|
			n = n.to_i
			if n < 0
				begin	
				  raise "Negative numbers are not allowed"
				rescue Exception=>ex
				  puts ex.message
				end
				return
			end
			n
		}.inject(&:+)
	end
	total
end

puts 'input: "", output: '+add("").to_s
puts 'input: "1", output: '+add("1").to_s
puts 'input: "1,5", output: '+add("1,5").to_s
puts 'input: "1\n2,3", output: '+add("1\n2,3").to_s
puts 'input: "//;\n1;2", output: '+add("//;\n1;2").to_s
puts add("1,-5")
