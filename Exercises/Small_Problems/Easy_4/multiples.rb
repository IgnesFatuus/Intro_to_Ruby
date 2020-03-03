def multiples(num)
  arr = []
  (0..num).each {|x| arr << x if x % 3 == 0 || x % 5 == 0}
  sum = arr.sum
end

puts multiples(20)