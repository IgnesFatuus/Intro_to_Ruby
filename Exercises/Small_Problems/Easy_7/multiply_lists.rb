def multiply_list(arr_1, arr_2)
  result = []
  arr_1.zip(arr_2) { |a, b| result << (a * b) }
  result
end
#SOLUTION BELOW GIVEN BY STUDENT
=begin
def multiply_lists(array1, array2)
  array1.zip(array2).map { |arr| arr[0] * arr[1] }
end

From my understanding, arr.zip(arr_2).map works by how the zip
method invokes the block for each output array, in this case
the output arrays are: [3, 9], [5, 10], [7, 11]
meaning #map isn't called just once, but three times
once for each array that was outputted  
=end
puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]