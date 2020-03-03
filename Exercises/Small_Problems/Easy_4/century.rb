def century(year)
  century = (year.to_f / 100.0).ceil.to_s
  qualifier = century.scan(/\d{1,2}$/)[0]
  return century.concat(ordinals(qualifier))
end

def ordinals(int)
  if int =~ /1[1-3]$/
    return "th"
  end
  case int
  when /1$/
    return "st"
  when /2$/
    return "nd"
  when /3$/
    return "rd"
  else
    return "th"
  end
end

puts century(100)
