def negative(int)
  -int.abs
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0 