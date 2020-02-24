require "yaml"
MESSAGES = YAML.load_file("searching_assist.yml")

def not_found(query, list)
  print "I did not find #{query} in #{list}\n"
end

def found(query, list)
  print "I found #{query} in #{list}\n"
end
i = 1
searcher = ""
numbers = []
until i == 6
  order_list = MESSAGES[i]
  puts ">> Enter the #{order_list} number: "
  number = gets.chomp
  numbers << number.to_i if number =~ /\d/
  i += 1 if numbers.length == i
end

until searcher.is_a? Integer
  puts ">> Enter a number to search: "
  searcher = gets.chomp
  searcher = searcher.to_i if searcher =~ /\d/
end

numbers.include?(searcher) ? found(searcher, numbers) : not_found(searcher, numbers)
