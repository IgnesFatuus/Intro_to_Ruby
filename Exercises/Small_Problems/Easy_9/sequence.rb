def sequence(count, start)
  return [] if count.zero?
  arr = []
  for i in 1..count
    arr << i * start
  end
  arr
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []