def penultimate(string)
  return string if string.split.size <= 1
  (string.split)[-2]
end

def middle_man(string, pref="literal")
  if string.is_a? Array
    string.flatten!
    string = string.join(" ")
  end
  string = string.to_s
  return string if string.split.size <= 1
  size = string.split.size
  if size.even?
    case pref
    when "up"
      return string.split[size / 2]
    when "both"
      return string.split[(size / 2) - 1)..(size / 2)]
    else
      return string.split[(size / 2) - 1]
    end
  else
    return string.split[(size - 1) / 2]
  end
end

puts middle_man(["the last", "word"])
puts middle_man("Launch School is great!", "both")
