def substrings(string, lead_only=true, ignore=false)
  string = ignore_it(string) if ignore
  i, limit, arr, start = 0, string.size, [], 0
  if lead_only == false
    while i < limit
     arr, i, start = substrings_all(string, arr, i, limit, start)
    end
  else
    while i < limit
      arr << string[0..i]
      i += 1
    end
  end
  arr
end

def substrings_all(string, arr, i, limit, start)
  arr << string[start..i]
  i += 1
  if i == limit && (start + 1) < limit
    start += 1
    i = start
  end
  return arr, i, start
end

def ignore_it(string)
  string.gsub!(/[^a-z0-9]/i, "")
end

def palindromes(string, ignore=false, ignore_case=false)
  substring_arr = substrings(string, false, ignore)
  i, limit, palindrome_arr = -1, substring_arr.size, []
  if ignore_case
    while i < limit
      i += 1
      next if i == limit
      next if substring_arr[i].size < 2
      palindrome_arr << substring_arr[i] if substring_arr[i].downcase == substring_arr[i].reverse.downcase
    end
  else
    while i < limit
      i += 1
      next if i == limit
      next if substring_arr[i].size < 2
      palindrome_arr << substring_arr[i] if substring_arr[i] == substring_arr[i].reverse
    end
  end
  palindrome_arr
end

puts substrings("abc") == ["a", "ab", "abc"]
puts substrings("a") == ["a"]
puts substrings("xyzzy") == ["x", "xy", "xyz", "xyzz", "xyzzy"]
puts substrings("abcde", false) == [
  "a", "ab", "abc", "abcd", "abcde", 
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e"
]
puts palindromes("abcd") == []
puts palindromes("Mad-am", true, true) #== ["madam", "ada"]
puts palindromes("hello-madam-did-madam-goodbye", true) 
puts palindromes("knitting cassettes") == [
  "nittin", "itti", "tt", "ss", "settes", "ette", "tt"
]

