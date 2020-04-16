def removal(str_arr)
  str_arr.join(" ").delete "aeiouAEIOU"
end

def removal_return_array(str_arr)
  str_arr.map { |string| string.delete("aeiouAEIOU") }
end

puts removal(%w(abcdefghijklmnopqrstuvwxyz))
puts removal(%w(green YELLOW black white))
puts removal(%w(ABC AEIOU XYZ))
