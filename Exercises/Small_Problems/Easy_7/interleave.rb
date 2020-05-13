def interleave(arr_1, arr_2)
  arr_3 = []
  limit, i = arr_1.size, 0
  until i == limit
    arr_3 << [arr_1[i], arr_2[i]]
    i += 1
  end
  arr_3.flatten
end

def interleave_zip(arr_1, arr_2)
  arr_1.zip(arr_2).flatten
end

puts interleave_zip([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
#REWRITE USING #zip, REREAD THE PROBLEM