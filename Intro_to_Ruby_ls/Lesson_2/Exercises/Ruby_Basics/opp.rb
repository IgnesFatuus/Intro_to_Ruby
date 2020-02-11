def valid?(n)
	n.to_i.to_s == n && n.to_i != 0
end
a = 0
b = 0
print ">> Please enter a (+) or (-) integer: "
a = gets.chomp
until valid?(a)
	print ">> INVALID. Enter (+) or (-) integer: "
	a = gets.chomp
end
until valid?(b)
	if a.to_i < 0
		until b.to_i > 0
			print ">> Must enter a (+) integer: "
			b = gets.chomp
		end
	elsif a.to_i > 0
		until b.to_i < 0
			print ">> Must enter a (-) integer: "
			b = gets.chomp
		end
	end
end
c = a.to_i + b.to_i
puts "#{a} + #{b} = #{c}"