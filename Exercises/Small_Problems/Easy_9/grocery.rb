def grocery_list(list)
  size = list.size
  items = []
  for i in 0...size
    list[i][1].times { |_| items << list[i][0] }
  end
  items
end

puts grocery_list([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]