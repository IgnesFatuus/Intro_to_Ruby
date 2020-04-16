NUMBERS_HASH = 
{
  "zero" => 0, "one" => 1, "two" => 2, "three" => 3,
  "four" => 4, "five" => 5, "six" => 6, "seven" => 7,
  "eight" => 8, "nine" => 9,
  "ten" => 10, "eleven" => 11, "twelve" => 12,
  "thirteen" => 13, "fourteen" => 14, "fifteen" => 15,
  "sixteen" => 16, "seventeen" => 17, "eighteen" => 18,
  "nineteen" => 19
}
# Split below to make converting above nineteen easier in possible future
NUMBERS_HASH_BASE = 
{
  "zero" => 0, "one" => 1, "two" => 2, "three" => 3,
  "four" => 4, "five" => 5, "six" => 6, "seven" => 7,
  "eight" => 8, "nine" => 9
}
NUMBERS_HASH_TEEN = 
{
  "ten" => 10, "eleven" => 11, "twelve" => 12,
  "thirteen" => 13, "fourteen" => 14, "fifteen" => 15,
  "sixteen" => 16, "seventeen" => 17, "eighteen" => 18,
  "nineteen" => 19
}
def alphabetic_numbers_sort(nums_arr)
  str_arr = convert_to_number_words(nums_arr)
  str_arr.sort!
  convert_to_ints(str_arr)
end

def convert_to_ints(string_array)
  int_array = []
  string_array.each do |str|
    int_array << NUMBERS_HASH[str]
  end
  int_array
end

def convert_to_number_words(nums)
  str_arr = []
    nums.each do |int|
      str_arr << NUMBERS_HASH.key(int)
    end
  str_arr
end

print alphabetic_numbers_sort((0..19).to_a)

#SOLUTION BELOW GIVEN BY LESSON

=begin 

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

=end