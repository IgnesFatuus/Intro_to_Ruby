#How Old is Teddy?
age = rand(20..200)
puts "Teddy is #{age} years old!"

#How big is this Room?

puts ">> Enter the length of room 1 in meters: "
l = gets.chomp.to_f
puts ">> Enter the width of room 1 in meters: "
w = gets.chomp.to_f
area_m = l * w
area_f = area_m * 10.7639
puts "The area of room_1 is #{area_m.round(2)} square meters(#{area_f.round(2)} square feet)"
=end
#Tip Calculator

print ">> Bill subtotal: "
subtotal = gets.chomp.to_f
print "Tip percentage(exclude \%): "
tip_p = gets.chomp.to_f
tip = (tip_p / 100) * subtotal
total = subtotal + tip
printf "%s %.2f %s", "The tip is", tip.round(2), "\n"
printf "%s %.2f %s","The total is", total.round(2), "\n"

#When Will I Retire?

date = Time.now
year = date.year
print ">> Your age: "
age = gets.chomp.to_i
print ">> Ideal retirement age: "
age_r = gets.chomp.to_i
years_left = age_r - age
year_retire = year + years_left
puts "It's #{year}! You will retire in #{year_retire}"
puts "You only have #{years_left} of years left to work"

#Greeting a User

print ">> Name: "
name = gets
name.chomp!
if name =~ /\!+$/
  name.chop!
  puts "HELLO #{name.upcase}! WHAT'S GOING ON!?"
  exit
end
puts "Hello #{name}"

#Odd Numbers

def oddity(min, max)
  for x in min..max do
    puts x if x.odd?
  end
end

def oddity_alt(min, max)
  min.upto(max) { |x| puts x if x % 2 != 0}
end

oddity(1, 99)
oddity_alt(1, 99)

#Even Numbers

def evenity(min, max)
  for x in min..max do
    puts x if x.even?
  end
end

def evenity_alt(min, max)
  min.upto(max) { |x| puts x if x % 2 == 0}
end

evenity(1, 99)
evenity_alt(1, 99)

# Sum or Product of Consecutive Integers

input_i = 0
ans = ""
loop do
  puts ">> Please enter an integer greater than 0: "
  input_i = gets.to_i
  puts "#{input_i} is =< 0" unless input_i > 0
  break if input_i > 0
end
loop do
  puts ">> Enter 's' for sum of, or 'p' for product of ints between 1 to #{input_i}: "
  ans = gets.chomp
  puts "#{ans} is not a valid input" unless ans == "s"|| ans == "p"
  break if ans == "s"|| ans == "p"
end
case ans
  when "s"
    sum = (1..input_i).reduce(:+)
    puts "The sum of all ints between 1 and #{input_i} is #{sum}"
  when "p"
    product = (1..input_i).reduce(:*)
    puts "The product of all ints between 1 and #{input_i} is #{product}"
end
