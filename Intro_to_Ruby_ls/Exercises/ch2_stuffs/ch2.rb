#Exercises 1, 3, 4
#=begin
print "Enter your first name please: "
fname = gets.chomp
print "Enter your last name please: "
lname = gets.chomp
p "Welcome, #{fname} #{lname}"
#10.times {p name}
#p "An error has occurred"

#=end

#Exercise 2
=begin
print "Please enter your age: "
age = gets.chomp
arr = [10, 20, 30, 40]

arr.each { |x|
	n_age = age.to_i + x
	p "In #{x} years you will be #{n_age}"
}
=end

#Exercise 5
=begin
x will equal 3 in the first case as inner scopes
can modify variables initialized in an outerscope
and the variable being called upon was initialized in
the same scope its being called to be displayed from
i.e x was initialized in the same scope it's asking to be
displayed in

In example 2, x would be undefined/give an error message
as x was initialized in an inner scoper and therefore
cannot be transferred to an outer scope
initialized outer variables can be transferred and modified
in an inner scope
but not vice versa (initialized in inner and used in outer)
=end
