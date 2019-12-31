#Exercise 1

def greet(name="Slim Shady")
	if name == "Slim Shady"
		p "Will the real Slim Shady please stand up?"
	else
		p "Hello #{name}"
	end
end
greet("Joe")

#Exercise 2
=begin (in irb)
In Irb what is the last returned value
i.e what does it evaluate to
1. x = 2 => 2
2. puts x = 2 => nill	
3. p name = "Joe" => "Joe"
4. four = "four" => "four"
5. print something = "nothing" => nill

=end

#Exercise 3

def multiply(a, b)
	a * b
end

p multiply(5, 2)
#Exercise 4
=begin
def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

#This returns nothing	
=end
#Exercise 5
=begin
def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")
#This now returns a nil character at the end due to puts, but it now outputs stuff to the screen
=end

#Exercise 6
=begin
ArgumentError: wrong number of arguments (1 for 2)
  from (irb):1:in `calculate_product'
  from (irb):4
  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
An incorrect amount of arguments is being provided for a method called calculate product
It requires 2, but has only been provided 1 (line 56 '... wrong number of arguments (1 for 2)')
=end