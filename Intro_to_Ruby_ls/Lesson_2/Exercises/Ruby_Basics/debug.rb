def predict_weather
  sunshine = [true, false].sample #Changed "true", "false" to boolean values

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end



def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i #added.to_i to convert to integer

puts "The result is #{multiply_by_five(number)}!"



pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] << 'bowser' #Changed = to << to add to values rather than replace

p pets



numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n| #change.map to .select
  n if n.even?
end

p even_numbers



def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end
#Refactored into an if/elsif statement rather than three independent if statements
#Another solution is adding in explicit return statements to each independent if statement and NOT refactoring
puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'



# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end
total = 0 #initialized variable total
[january, february, march].each do |month|
  balance = calculate_balance(month)
  total += balance #Added variable total to track total amount of variable balance compounding through each month
end

puts total #changed to total to represent total amount left in bank rather than current balance of the last month



colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i >= things.length
  #Changed colors.length to things.length as 
  #things had less elements in its array
  #Also change > to >= as .length = 7 but 
  #the indices is defined as 0-6


  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end



def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1 #Changed product starting point to 1, as anything *0 is 0

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')



# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}
i = 0 #Initializing my trip
boolean = false #Initializing my boolean value
until boolean == true
	if i == 0
		puts 'Please type your class (warrior, thief, scout, mage):'
		input = gets.chomp.downcase
	else
		puts 'Class not available. Please type your class (warrior, thief, scout, mage):'
		input = gets.chomp.downcase
	end
	#Added if/else statement for clarity
	character_classes.each{|c_class, value|
		if c_class == input.to_sym
			boolean = true
		end
	}
	i = 1
end
#Added a clause to prevent the attempt to use unusable classes
#more or less an exception catcher
player.merge!(character_classes[input.to_sym]) 
#added a .to_sym
#Changed .merge to .merge! so it is destructive

puts 'Your character stats:'
puts player