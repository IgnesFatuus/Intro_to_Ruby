#Below are examples showing some ways to write a rescue block, or an Exception class, in your code

=begin
names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end

a = 0
puts "before"
a.each { |x| puts x} rescue puts "Can't do that!"
puts "after"

def divide(num, div)
	begin
		ans = num / div
	rescue ZeroDivisionError => e
		puts e.message
	end
end

puts divide(16, 4)
puts divide(4, 0)
puts divide(14, 7)
#end of examples
=end

#Exercise 1 create program to check if word contains 'lab' characters and then print word if it does

words = ['laboratory', 'experiment', 'Pans Labyrinth', 'elaborate', 'polar bear']

words.each { |w| if w =~ /lab/
	p w
	end } rescue "Something went wrong"

#Exercise 2 What does the below program output to screen? What does it return?

def execute(&block)
	block
end

execute { puts "hello from inside"} #INITIAL ANSWER outputs "hello from inside" and returns nil
#AFTER TESTING Outputs nothing to the screen (never activated with the .call method, returns Proc object

#Exercise 3 What is exception handling and what problem does it solve?
=begin
ANSWER: Exception handling is essentially a piece of coding that catches errors, and returns something else in it's stead, while continuing on with the code, rather than stopping your program altogether
It allows your program more flexibility when receiving input, and allows it to handle incorrect inputs without shutting the program itself down
=end

#Exercise 4 Edit the code in Ex 2 so that it properly calls the block

def execute(&block)
	block.call
end

execute { puts "hello from inside"}

#Exercise 5 Why does the code below return an error message?
=begin
def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
=end
#Without the &(ampersand), the parameter being passed in is assumed to be a variable (Int, String, etc), and not a block (which is what is being passed in)
#It cannot accept a block as a parameter unless given permission by the & sign

#Exercise 6

