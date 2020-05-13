def sequence(int)
  a = []
  1.upto(int.abs) { |n| a << n }
  if int < 0
    a.map! { |x| x *= -1 }
  end
  a
end

puts sequence(-5) == [-1, -2, -3, -4, -5]
puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
