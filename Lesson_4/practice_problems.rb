# QUESTION 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flint_hash = flintstones.each_with_object({}) { |name, h| h[name] = flintstones.index(name) }

# QUESTION 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = 0
ages.each { |k, v| sum += v }

# QUESTION 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |_, v| v < 100 }

# QUESTION 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# QUESTION 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
ind = nil
flintstones.each_with_index{ |n, i| ind = i if n =~ /^Be.*/ }

# QUESTION 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name| 
  name[0, 3]
end

# QUESTION 7

alphabet = ("a".."z").each_with_object({}) { |l, h| h[l] = 0 }.merge(("A".."Z").each_with_object({}) { |l, h| h[l] = 0 })

statement = "The Flintstones Rock"

statement.chars do |l|
  alphabet[l] += 1 if alphabet[l].is_a? Integer
end

# QUESTION 8

numbers = [1, 2, 3, 4]
numbers.each do |number|
  #p number
  numbers.pop(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  #p number
  numbers.shift(1)
end

str_answer = "by shifting/popping the value at index 1, the next value becomes the value at that index"
answer = [1, 3]

# QUESTION 9

def method_1(string)
  string = string.split
  string.map! { |n| n.capitalize }
  string.join(" ")
end

def method_2(string)
  string.gsub!(/\s\w|^\w/) { |l| "#{l.upcase}"}
end

words = "the flintstones rock"

#QUESTION 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, v|
  if v["age"] < 18
    v["age_group"] = "child"
  elsif v["age"] < 64
    v["age_group"] = "adult"
  else
    v["age_group"] = "senior"
  end
end

puts munsters