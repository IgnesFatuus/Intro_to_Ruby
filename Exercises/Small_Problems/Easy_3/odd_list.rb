def oddities(list)
  odd = []
  i = 0
  until i == list.length
    odd << list[i] if (i - 1).odd?
    i += 1
  end
  odd
end

# FE
def even(list)
  even = []
  i = 0
  until i == list.length
    even << list[i] if (i + 1).even?
    i += 1
  end
  even
end

puts oddities([1, 2, 3, 4, 5, 6])
