def ascii_value(string)
  sum = 0
  string.chars { |c| sum += c.ord }
  sum
end
