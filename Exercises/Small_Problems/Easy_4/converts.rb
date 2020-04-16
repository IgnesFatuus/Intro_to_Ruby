def str_to_int(str_int)
  digit_hash = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}
  total = 0
  total_a = []
  num_a = str_int.split("").reverse
  num_a.length.times do |i|
    if num_a[i] =~ /[^\d]/
      total_a << num_a[i]
      next
    end
    num_temp = digit_hash[num_a[i]]
    base_ten = num_temp * (10**i)
    total += base_ten
  end
  total_a << total
  total = total_a.join
end

def hex_to_int(hexa)
  hexa.hex
end

def int_to_str_simple(int)
  "#{int}"
end

def int_to_string_not_simple(int)
  digit_hash = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}
  str_a = []
  str_a << signed(int) if int < 0
  int *= -1 unless str_a.empty?
  int_a = int.digits.reverse
  for i in 0...int_a.length do
    if digit_hash.value?(int_a[i])
      str_a << digit_hash.key(int_a[i])
    end
  end
  str_a.join
end

def signed(int)
  return "-"
end
