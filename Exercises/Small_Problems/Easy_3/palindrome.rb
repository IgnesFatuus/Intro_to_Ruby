def palindrome?(string)
  string = string.to_s
  string.downcase! #This makes it case insensitive
  string = string.split("")
  string = string.map {|x| x if x =~ /\w/}
  string = string.join
  string == string.reverse
end

puts palindrome?(01005050010)