#Exercise 1 Iterate over an Array and print out it's values using .ech method

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |x| p x}

#Exercise 2 Now only print out values larger than 5

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

p arr.select { |x| x > 5}

#Exercise 3 Using the same array, extract all odd numbers into a new array using select

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odd_arr = arr.select { |x| x % 2 == 1}
p odd_arr

#Exercise 4 Append 11 to end of array, prepend 0 to beginning of OG array

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr = arr.unshift(0)
arr << 11 #=> OR arr.push(11)
p arr

#Exercise 5 get rid off 11 and append a 3

arr.pop
arr << 3
p arr

#Exercise 6 Get rid of duplicates w/o specifcally deleting a value

arr.uniq!
p arr

#Exercise 7 What's the main difference between a Has and Array?
=begin 
A Hash has custom key-value pairs, whereas Arrays have a standard key-value  pair (commonly referred to as indices or index)
so a Hash can have a key-value pair of :name => "Joe" whereas an Array will have it as 0 => "Joe"
Simplified: Hashes use key-value pairs and reference by keys, whereas Arrays have indices and reference by indices
=end

#Exercise 8 Create a Hash with one key-value pair using both Ruby syntax styles
#Other style of creating hash is hash = {:new => "new"}
hash = Hash.new

hash[:new] = "new"
p hash

hash = { new1: "new",
	new2: "new2"}
p hash

#Exercise 9 Get value of :b, add e:5 to hash, remove all pairs whose value is less than 3.5

h = {a:1, b:2, c:3, d:4}
p h[:b]
h[:e] = 5
h.delete_if{ |k, v| v < 3.5}
p h

#Exercise 10 Can hash values be arrays? can you have an array of hashes?

family = {parents: ["Xayah", "Rakan"],
	children: ["Xayra", "Rahxan"]}
h = {a:1, b:2, c:3, d:4}
hash = { new1: "new",
	new2: "new2"}

arr_hash = [family, h, hash]
#Yes you can to both

#Exercise 11 What online ruby documentation is your favorite?
# need more info first, but ruby-docs 2.5.1 core is my go to right now

#Exercise 12 Given the following data structure, create a program that copiues the info from the array to a hash
#if you altered the contact_data to include the name itself of the contact info, it would be easier to creat a program that can just update and add any number of recipients
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
			["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
arr = []
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}


contact_data.each { |x| comp = x.first.partition("@").first 
	contacts.each {|key, value| arr = key.scan(/\w+/).first.downcase
		if comp == arr
			contacts[key][:email] = x.first
			contacts[key][:address] = x[1]
			contacts[key][:phone] = x.last
		end
	}
}
p contacts

#Exercise 13 Access Joe's email and Sally's phone number from above

p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]

#Exercise 14 completed in Exercise 12, example solution shown below with the assumption of manual entry used as solution in Exercise 12
=begin
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end
=end

#Exercise 15 delete all words that begin with 's', recreate og arr, then delete all words that start with 's' and 'w'
arr_2 = []
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |x| if x.start_with?("s")
						arr_2 << x
					end
				}
p arr_2
p arr
arr << arr_2
arr = arr.flatten
arr.delete_if { |x| if x.start_with?("s") || x.start_with?("w")
						arr_2 << x
					end}
p arr
p arr_2

#Exercise 16 Using the following array, turn it into a new array that consists of single worded strings. Look into using .map, .flatten, and .split

#Without using .split:
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a.map! { |x| x = x.scan(/\w+/)}
a = a.flatten
p a

#With .split
=begin
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a.map! { |x| x.split }
a = a.flatten
p a
=end
#Exercise 17 What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end
#BEFORE TEST: output should be "These Hashes are not the same!"
#AFTER TEST: output is These Hashes are the same!
#REASONING: I was wrong because I treated a hash the same way I treated an array,
# and that is by index, which is important in an array as it is ordered,
# whereas, hash is by key:value pairs and order is irrelevant when compared, as it 
#only uses the key:value pairs to compare with each other
