def print_in_box(string)
  length =  string.length + 3
  puts tertiary_layer(length)
  puts secondary_layer(length)
  puts main_layer(string)
  puts secondary_layer(length)
  puts tertiary_layer(length)
end

def tertiary_layer(size)
  tl = Array.new(size) do |x|
    if x == 0
      x = "+"
    else
      x = "-"
    end
  end
  tl[size] = "+"
  tl.join
end

def secondary_layer(size)
  sl = Array.new(size) do |x|
    if x == 0
      x = "|"
    else
      x = " "
    end
  end
  sl[size] = "|"
  sl.join
end

def main_layer(str)
  string = str.center((str.length + 4))
  string[0] = "|"
  string[string.length - 1] = "|"
  string
end

print_in_box("To boldly go where no one has gone before.")

#SOLUTION GIVEN BY LESSON

=begin 

def print_in_box(message)
   horizontal_rule = "+#{'-' * (message.size + 2)}+"
   empty_line = "|#{' ' * (message.size + 2)}|"

   puts horizontal_rule
   puts empty_line
   puts "| #{message} |"
   puts empty_line
   puts horizontal_rule
end

=end