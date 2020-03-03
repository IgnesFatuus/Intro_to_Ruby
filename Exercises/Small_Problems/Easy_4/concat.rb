def short_long_short(str1, str2)
  value = str1 <=> str2
  case value
  when -1
    return str1.prepend(str2).concat(str2)
  when 1
    return str2.prepend(str1).concat(str1)
  end
  return str1.prepend(str2).concat(str2)
 end
 puts short_long_short("hello", "hi")