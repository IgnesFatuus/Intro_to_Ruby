def valid?(n)
	n.to_i.to_s == n
end

print ">> Please enter the numerator: "
x = gets.chomp
until valid?(x)
	puts "Invalid input. Only integers are allowed."
	print ">> Please enter the numerator: "
	x = gets.chomp
end
print ">> Please enter the denominator: "
y = gets.chomp
until valid?(y)
	puts "Invalid input. Integers only."
	print ">> Please enter the denominator: "
	y = gets.chomp
end
a = x.to_f / y.to_f
print "#{x} / #{y} is #{a} \n"