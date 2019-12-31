def factorial(n)
	if n < 0
		return nil
	end

	if n == 0
		return 1
	end

	result = 1
	while n > 0
		result = result * n
		n -= 1
	end

	return result
end
movies = {
		m1: 1956,
		m2: 1865,
		m3: 6895
}
movies.each{ |x, y| puts y}
movies_a = movies.to_a
movies_a.each{ |x, y| 
	print "#{y}, "
		}
# Code exercise 2
puts " "
a = [5, 6, 7, 8]
a.each { |x| puts factorial(x)}

# Code exercise 3
f = [2.0, 5.0, 6.4]
f.each { |x| puts x**2}
