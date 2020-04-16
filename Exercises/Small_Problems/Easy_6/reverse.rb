def reversal!(arr)
  return arr if arr.size < 2
  x = 0
  y = -1
  arr[x], arr[y] = arr[y], arr[x]
  until arr[x] == arr[y] || y.abs == (arr.size / 2).to_f
    x += 1
    y -= 1
    arr[x], arr[y] = arr[y], arr[x]
  end
  arr
end

def reversal(perm_arr)
  return perm_arr if perm_arr.size < 2
  arr = perm_arr
  arr.reverse_each
  arr
end


puts reversal!([1,2,3,4])
puts reversal(["c", "d", "e", "b", "a"])