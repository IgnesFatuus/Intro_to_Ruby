#Exercise 1
=begin
1. (32 * 4) >= 129 => false
2. false != !true => false
3. true == 4 => false
4. false == (847 == '874') => true
5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false =>true 
=end
#Exercise 2
=begin 
def tenplus(string)
	if string.is_a? String
		if string.length > 10
			return string.upcase
		else
			return string.downcase
		end
	else
		string = string.to_s
		if string.length > 10
			return string.upcase + "!!!!!!!!!!!!!!!!!!!!!"
		else
			return string.downcase + "..............."
		end
	end
end

p tenplus(10)
=end
#Exercise 3
=begin
printf "Please enter a number between 0 and 100: "
num = gets.chomp
num = num.to_i
count = 0
while (num > 100 || num < 0) && count < 5
	printf "\n 0-100..."
	num =gets.chomp
	num = num.to_i
	count += 1
end
if num < 50 && num >= 0
	p "The number is less than 50!"
elsif num > 50 && num <= 100
	p "The number is greater than 50!"
else
	p "Can't even follow simple instructions, huh?"
end
=end
#Exercise 4
=begin
	1. '4' == 4 ? puts("TRUE") : puts("FALSE") =>   FALSE

2. x = 2
   if ((x * 3) / 2) == (4 + 4 - x - 3)
     puts "Did you get it right?" => Did you get it right?
   else
     puts "Did you?"
   end

3. y = 9
   x = 10
   if (x + 1) <= (y)
     puts "Alright."
   elsif (x + 1) >= (y)
     puts "Alright now!" => Alright now!
   elsif (y + 1) == x
     puts "ALRIGHT NOW!"
   else
     puts "Alrighty!"
   end
=end
#Exercise 5

def pick(num)
	count = 0
	while (num > 100 || num < 0) && count < 5
		printf "\n 0-100..."
		num = gets.chomp.to_i
		count += 1
	end
	case num
	when num < 0
		puts "Can't even follow simple instructions, huh?"
	when num <= 50
		puts "#{num} is less than 50!"
	when num <= 100
		puts "#{num} is greater than 50!"
	else
		puts "Can't even follow simple instructions, huh?"
	end
end
printf "Please enter a number between 0 and 100: "
num = gets.chomp.to_i

pick(num)

#BELOW IS WHAT I USED TO TROUBLESHOOT MY OWN CODE
#USING CASE NUM INSTEAD OF JUST CASE CAUSE A LOT OF PROBLEMS FOR ME
=begin
def evaluate_num(number)
  case
  when number < 0
    puts "You can't enter a negative number!"
  when number <= 50
    puts "#{number} is between 0 and 50"
  when number <= 100
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is above 100"
  end
end
puts "Please enter a number between 0 and 100."
number = gets.chomp.to_i

evaluate_num(number)
=end
#END OF TROUBLESHOOTING CODE

#Exercise 6
=begin
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)
OUTPUT
#exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end
=end


#Essentially, you left an open bracket, but in this case it's
#an open block that requires an end to close it
#such as if end, or def end, or do end, etc
#To fix, add the closing end keyword after if else statements