def swapcase(string)
  string.gsub(/[a-zA-Z]/) do |l|
    if l =~ /[A-Z]/
      l.downcase
    else
      l.upcase
    end
  end
end

def swapcase_other(str)
  str.tr("a-zA-Z", "A-Za-z")
end

puts swapcase("CamelCase") == "cAMELcASE"
puts swapcase("Tonight on XYZ-TV") == "tONIGHT ON xyz-tv"