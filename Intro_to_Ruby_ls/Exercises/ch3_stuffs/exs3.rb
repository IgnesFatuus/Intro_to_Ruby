=begin

a = [1, 2, 3, 4]

def mutate(array)
	array.pop
end

p "Before #{a}"
mutate(a)
p "After #{a}"
p a.last
=end

=begin
def add_three(number)
	return number + 3 #<= do not add a puts if you want to chain!
	number + 4
end

value = add_three(4)
puts value

add_three(2).times {puts "I have chained methods"}
#puts returns a nil character at the end, so it cannot be
#used inside the method itself as a nil will or an exception
#will break the whole chain, unless puts is not the last
#executed line
=end

def add(a, b)
	a + b
end

def subtract(a, b)
	a - b
end

def multiply(num1, num2)
	num1 * num2
end

p multiply(add(20, 45), subtract(80, 10))


