def middleman(string)
  return nil if string.empty?
  size = string.size
  return string[(size - 1) / 2] if size.odd?
  string[((size / 2) - 1)..(size / 2)]
end

puts middleman("I love ruby") == "e"
puts middleman("Launch School") == " "
puts middleman("Launch") == "un"
puts middleman("Launchschool") == "hs"
puts middleman("x") == "x"