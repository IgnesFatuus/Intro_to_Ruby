=begin

numbers = [1, 2, 2, 3]
numbers.uniq
  prints out 1\n2\n2\n3\n using puts


Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
  ! can identify something as destructive, or operate as a bang(flipping the boolean value of something)
  ? can indicate the ternary version of if...else, or that a boolean is being returned if at the end of a method name
  However, ! and ? in method names are just a part of that name, and although it can denote a specific action occuring
  it is NOT a part of Ruby syntax

What is != and where should you use it?
  != represents "not equal to", and would be used to determine if var x is not equal to var y

Put ! before something, like !user_name
  Doing so would make the truthy variable false

Put ! after something, like words.uniq!
  Typically denotes that the method you're using is destructive (mutates the caller)
  However, in reality it is part of the method name, and NOT part of Ruby syntax

Put ? before something
  ?: is the ternary operator of if...else (otherwise I don't know what it's doing at the front)

Put ? after something
  Can indicate a boolean value being returned, however it is part of the method name
  and NOT part of ruby syntax

Put !! before something, like !!user_name
  Double bang, flasifies a falsify. !!user_name turns the truthy value to false, and then turns that false into true again
  Example: !!x => The opposite of the opposite of the boolean value of x


advice = "Few things in life are as important as house training your pet dinosaur."
  advice.gsub!("important", "urgent")


numbers = [1, 2, 3, 4, 5]
  
numbers.delete_at(1)
  delete_at(1) targets a specific index, in this case, it deletes index 1 (int 2)

numbers.delete(1)
  delete(1) deletes a specified object, in this case it deletes all cases of integer 1
                  <BOTH ARE DESTRUCTIVE>


Programmatically determine if 42 lies between 10 and 100.
  42.between?(10, 100) // (10..100)cover?(42)


Show two different ways to put the expected "Four score and " in front of it.
famous_words = "seven years ago..."
  "Four score and ".concat(famous_words)
  "Four score and " << famous_words
  famous_words.prepend("Four score and ")


Make this into an un-nested array.
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
  flinstones.flatten!


Turn this into an array containing only two elements: Barney's name and Barney's number.
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
  barney_array = [flinstones.key(2), flinstones["Barney"]]
  flinstones.assoc("Barney")


=end


