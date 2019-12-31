#Exercise 1

=begin 
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

family[:nuclear] = []
family.each { |k, v| 
	if k == :sisters
		family[:nuclear] << v
	elsif k == :brothers
		family[:nuclear] << v
	elsif k == :parents
		family[:nuclear] << v
	elsif k == :children
		family[:nuclear] << v
	end
}

p family[:nuclear]
#OR
nuclear_fam = family.select { |k, v| 
k == :sisters || k == :brothers
}
nuclear_fam.to_a.flatten
p nuclear_fam
=end

#Exercise 2 showing the difference between merge and merge!

=begin
nuclear_fam = {
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            }

ext_fam = { uncles: ["bob", "joe", "steve"],
		aunts: ["mary","sally","susan"]
			}

mor_fam = { parents: ["diana", "rakan"],
		children: ["nasus","xayah","susan"]
			}

family = nuclear_fam.merge(ext_fam)
p family
p nuclear_fam
p ext_fam
nuclear_fam.merge!(mor_fam)
p nuclear_fam
=end

#Exercise 3 printing keys, values, and then both in a Hash

=begin
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

p family.keys
p family.values
family.each_pair { |k, v| 
	puts k
	print v
	puts " "
	}
=end

#Exercise 4 accessing :name and printing

=begin
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

p person[:name]
=end

#Exercise 5 Using method that asks Hash if it has a certain value or key

=begin 
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

p person.has_value?('50')
p person.has_key?(:age)
=end

#Exercise 6 create program to print out words that are anagrams of each other

=begin
results = {key: ""} #creates empty hash
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

words.each { |word| key = word.split('').sort.join #creates a key that sorts each element into alphabetical order by first splitting each string into separate characters, then sorting them, and then rejoining them
#All words that share the same letters are now all in the exact same order (i.e. "none" becomes "enno" and "neon" becomes "enno" as well)
if results.has_key?(key) #checks to see if it already has the key variable as key
	results[key].push(word) #If the key variable already exists, the variable word then becomes that keys value
else
	results[key] = [word] #if it doesn't have the key variable as key , it becomes the key
end
}
p results.values
#OR
results.each_value { |x| puts "------"
p x
}
=end

#Exercise 7 What is the difference between the two hashes?

#x = "hi there"
#my_hash = {x: "some value"}
#my_hash2 = {x => "some value"}
#x: is a symbol (used for the key), x is a variable (a variable that contains a string in this case), that is being used as the key

#Exercise 8 What is the most likely problem when you see this error message below?

# NoMethodError: undefined method `keys' for Array
#=>There is no method 'keys' for Array objects
#=> There is no method called 'keys' for objects in the Array class
