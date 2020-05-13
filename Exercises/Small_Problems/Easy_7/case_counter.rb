UPPER = ("A".."Z").each_with_object({}) { |l, h| h[l] = true}
LOWER = ("a".."z").each_with_object({}) { |l, h| h[l] = true}

def case_counter(string)
  counter = { upper: 0, lower: 0, neither: 0}
  string = string.split("")
  string.each do |l|
    if UPPER[l] == true
      counter[:upper] += 1
    elsif LOWER[l] == true
      counter[:lower] += 1
    else
      counter[:neither] += 1
    end
  end
    counter
end

# OTHER POSSIBLE SOLUTION USING REGEX

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

puts case_counter("abCdef 123")
puts case_counter('AbCd +Ef')
puts case_counter('123')
puts case_counter('')