print "Enter a word or phrase: "
phrase = gets.chomp
temp = phrase.split("").select { |x| x =~ /\S/}
length = temp.length
puts "There are #{length} characters in \"#{phrase}\"."
