def find_fibonacci_index_by_length(int)
  return 1 if int < 2
  size = 0
  i = 1
  array = [0, 1]
  while size < int
    array << (array[i] + array[i - 1])
    size = array[i + 1].to_s.length
    i += 1
  end
  i
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(3) == 12
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847


#SOLUTION BELOW GIVEN BY LESSON
=begin

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

=end