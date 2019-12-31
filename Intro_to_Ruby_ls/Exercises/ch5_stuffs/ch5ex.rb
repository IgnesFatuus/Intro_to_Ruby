x = gets.chomp.to_i

for i in 1..x do puts i end

	#OR

x = [1, 2, 3, 4, 5]
for i in x do puts i end

puts "Done!"

#A method can call itself within itself

def doubler(start)
	puts start
	if start < 10
		doubler((start * 2)) #Paranthesis to make clear to me the number is start*2
	end
end

doubler(2)
#The above example is of Recursion

def fibonacci(num)
	if num < 2
		num
	else
		fibonacci(num - 1) + fibonacci(num - 2)
	end
end

puts fibonacci(6)
