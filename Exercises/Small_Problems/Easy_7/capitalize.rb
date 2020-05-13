def word_cap(string)
  string = string.split
  string.each { |word| word.capitalize! }
  string.join(" ")
end

def word_cap_other_1(string)
  string = string.split
  string.each do |word|
    word[0] = word[0].upcase
    word[1..-1] = word[1..-1].downcase
  end
  string.join(" ")
end

def word_cap_other_2(string)
  string.downcase!
  string.gsub!(/\s\w|^\w/) { |l| l.upcase}
  string
end




# ANOTHER SOLUTION BELOW

# words.split.map(&:capitalize).join(' ')

puts word_cap_other_2("four score and seven") == "Four Score And Seven"
puts word_cap_other_2("the javaScript language") == "The Javascript Language"
puts word_cap_other_2("this is a 'quoted' word") == "This Is A 'quoted' Word"