def crunch(string)
  string = string.split("")
  new_string = []
  string.each_with_index do |x, i|
    if i == 0
      new_string << x
    elsif string[i] == string[i - 1]
      next
    else
      new_string << x
    end
  end
  new_string.join
end

puts crunch('ddaaiillyy ddoouubbllee')
puts crunch('4444abcabccba')
puts crunch('ggggggggggggggg')
puts crunch('a')
puts crunch('')
