def swap(string)
  string = string.split(" ")
  string = string.map do |word|
    word = word.split("")
    word[-1], word[0] = word[0], word[-1]
    word.join
  end
  string.join(" ")
end

puts swap("Oh what a wonderful day it is")

=begin
FURTHER EXPLORATION
def f_l(a, b)
  a, b = b, a
end

def swap(string)
  string = string.split(" ")
  string = string.map do |word|
    word = word.split("")
    word[0], word[-1] = f_l(word[0], word[-1])
    word.join
  end
  string.join(" ")
end

puts swap("Oh what a wonderful day it is")

=end