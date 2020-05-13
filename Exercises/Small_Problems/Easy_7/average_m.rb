def show_multiplicative_average(array)
  return "undefined" if array.size < 1
  product, multiplicative_average = 1.0, 0.0
  array.each { |num| product *= num }
  size = product.to_i.to_s.size
  multiplicative_average = (product / array.size).round(size + 3)
  puts sprintf("%s %.3f", "The result is ", multiplicative_average)
end

# ALTERNATIVE SOLUTION
# array.inject(:*) / array.size.to_f
# WILL MULTIPLY ALL NUMBERS IN ARRAY TOGETTHER

show_multiplicative_average([3, 5])

show_multiplicative_average([6])

show_multiplicative_average([2, 5, 7, 11, 13, 17])
