def include?(arr, value)
  i = 0
  while i < arr.size
    return true if arr[i] == value
    i += 1
  end
  false
end

# SOLUTION GIVEN BY LESSON
# !!array.find_index(value)

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false