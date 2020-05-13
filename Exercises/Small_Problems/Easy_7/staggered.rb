def staggered_case(string, first="upper", ignore=false)
  order, limit, i = 0, string.length, 0
  types = [:odd?, :even?]
  order = 1 if first.downcase == "lower"

  return staggered_case_ignore(string, order, limit) if ignore


  while i < limit
    style = i.method(types[order])

    string[i] = string[i].upcase
    string[i] = string[i].downcase if i.zero? && order == 1 || style.call

    i += 1
  end
  string
end

def staggered_case_ignore(string, order, limit)
  string.downcase!
  i = -1
  while i < limit - 1
    i += 1
    next if string[i] =~ /[^A-Za-z]/
    if order == 1
      string[i] = string[i].downcase
      order -= 1
    else
      string[i] = string[i].upcase
      order += 1
    end
  end
  string
end

puts staggered_case("I Love Launch School!", "upper", true)
puts staggered_case("ALL_CAPS", "", true)
puts staggered_case("ignore 77 the 444 numbers", "up", true)