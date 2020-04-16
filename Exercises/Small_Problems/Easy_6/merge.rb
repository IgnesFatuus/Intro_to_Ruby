def merge(arr_1, arr_2)
  arr_1 << arr_2
  arr_1.flatten!.uniq!
  arr_1
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# SOLUTION GIVE BY LESSON

# array_1 | array_2, | is defined as Set Union, in which it binds both arrays together
# and it excludes any duplicates while preserving the order from the given arrays