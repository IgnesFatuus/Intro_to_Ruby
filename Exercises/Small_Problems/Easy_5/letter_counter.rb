def letter_count(string, count_hash={})
  str_array  =  string.split(" ")
  str_array.each do |x|
    cond = -1
    while cond != x.length
      cond = x.length
      x.slice!(/\d+|\W+/)
    end
  end
  print str_array
  c_length_arr = str_array.map { |word| word.length }

  c_length_arr.sort!

  c_length_arr_unique = c_length_arr.uniq

  c_length_arr_unique.each do |x|
    count_hash[x.to_i] = c_length_arr.count(x)
  end
  puts count_hash
end

letter_count("Four score and seven")
letter_count('Hey diddle diddle, the cat and the fiddle!')
letter_count("What's up doc?")
letter_count('')
# SOLUTION BELOW GIVEN BY LESSON FOR PART 1
=begin

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

#SOLUTION BELOW GIVEN BY LESSON FOR PART 2

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end
=end