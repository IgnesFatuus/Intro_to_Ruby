def sum_of_sums(array)
  return 0 if array.size < 1
  sum, i, limit = 0, 0, array.size
  while i <= limit
    sum = sum + array.take(i).sum
    i += 1
  end
  sum
end

puts sum_of_sums([3, 5, 2])
puts sum_of_sums([1, 5, 7, 3])
puts sum_of_sums([4])
puts sum_of_sums([1, 2, 3, 4, 5])