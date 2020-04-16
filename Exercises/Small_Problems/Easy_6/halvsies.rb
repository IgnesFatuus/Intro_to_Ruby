def halvsies(array)
  half = (array.size / 2.0).ceil(0)
  array[0], array [1] = array.take(half), array.drop(half)
  array = [array[0], array[1]]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]