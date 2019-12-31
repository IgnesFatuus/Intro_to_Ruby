#Exercise 1
=begin
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
=end
#adds 1 to every element in the array 
#But does not mutate it permanently

#Exercise 2
=begin 
ans = "yes"
while ans != "STOP" do
	puts "Wanna go another round?"
	ans = gets.chomp
end
=end

#Exercise 3
a = [1, 2, 3, 4]
a.each_with_index {|x, y| puts "#{x}, index: #{y}" }

#Exercise 4
def countdown(num)
	puts num
	if num > 0
		countdown(num - 1)
	elsif num < 0
		countdown(num + 1)
	end
end

countdown(10)