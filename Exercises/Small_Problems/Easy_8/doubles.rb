def repeater(string)
  string = string.split("")
  string.zip(string).flatten.join("")
end

def double_consonants(string)
  string.chars.map do |l|
    if l =~ /[a-z]/i && l =~ /[^eiou]/i
      l * 2
    else
      l
    end
  end.flatten.join("")
end

puts repeater("Hello") == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater("") == ""
puts double_consonants("String") == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants("") == ""