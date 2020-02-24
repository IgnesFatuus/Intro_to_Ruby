empty = String.new
		#OR
empty = ""

puts "It\'s now 12 o\'clock."

name = "Roger"

puts name.casecmp?("RoGeR")
puts name.casecmp?("DAVE")

puts "Hello, #{name}!"
fname = "A"
lname = "B"
full_name = "#{fname} #{lname}"
puts full_name

state = "tExAs"
state.capitalize!
puts state

greeting = "Hello!"
greeting.replace("Goodbye!")
puts greeting

alphabet = "abcdefghijklmnopqrstuvwxyz"
print alphabet.split("") #Use puts to display each character separately

puts ""

words = "car human elephant airplane"
words.split(" ").each{|w| puts "#{w}s"}

colors = "blue pink yellow orange"

puts colors.include?("yellow")
puts colors.include?("purple")
		#OR use regex
puts colors =~ /yellow/ ? true : false
puts colors =~ /purple/ ? true : false