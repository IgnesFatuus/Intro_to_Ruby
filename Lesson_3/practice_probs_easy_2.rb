=begin


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
See if "Spot" is present.
  ages.assoc("Spot")
  ages.key?("Spot")
  ages.include?("Spot")
  ages.member?("Spot")


munsters_description = "The Munsters are creepy in a good way."
Convert the string in the following ways
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
  munsters_description.chars.map! do |x|
    if x =~ /[A-Z]/
      x.downcase!
    else
      x.upcase!
    end
  end
  munsters_description.swapcase! (does the above)
  munsters_description.capitalize!
  munsters_description.downcase!
  munsters_description.upcase!


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
Add ages for Marilyn and Spot to the existing hash
  ages.merge!(additional_ages)


advice = "Few things in life are as important as house training your pet dinosaur."
See if the word "Dino" appears
  advice.scan(/^dino$/)
  advice.match?(/^Dino$/)


flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
What is an easier way to write this array?
  flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
How can we add "Dino" to the array?
  flintstones << "Dino"


How can we add multiple Items to our array? (Dino and Hoppy)
  flintstones.push("Dino").push("Hoppy")
  flintsones.concat(%w(Dino Hoppy))


advice = "Few things in life are as important as house training your pet dinosaur."
Remove everything up to house (leave advice var with everything that was not removed)
  advice.slice!(/.*house /)
  advice = advice.slice(/.*house /) # Using #slice isn't destructive


statement = "The Flintstones Rock!"
Using a one liner, count the number of lowercase t characters
  statement.count("t")
  statement.count(/t/)


title = "Flintstone Family Members"
How could we easily center the title above a table with 40 spaces?
title.center(40)



=end