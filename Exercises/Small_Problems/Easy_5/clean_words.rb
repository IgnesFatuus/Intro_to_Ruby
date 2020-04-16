ALPHABET = ("a".."z").to_a
def cleaner_w_regex(string)
  string.gsub(/[^a-z]+/i, " ")
end

def cleaner_wo_regex(string)
  string_array = string.chars
  string = string_array.map do |char|
    if ALPHABET.include?(char.downcase)
      char
    else
      " "
    end
  end
  string = string.join.squeeze(" ")
end
puts cleaner_w_regex("---what's4 My +*&    line?") == " what s My line "
puts cleaner_wo_regex("---what's4 My +*&    line?") == " what s My line "