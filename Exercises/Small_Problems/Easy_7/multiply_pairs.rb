def multiply_all_pairs(arr_1, arr_2)
  return "undefined" if arr_1.size < 1 || arr_2.size < 1
  x, y, result = 0, 0, []
  while x < arr_1.size
    result << (arr_1[x] * arr_2[y])
    y += 1
    x, y = (x + 1), 0 if y == arr_2.size
  end
  result.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2])