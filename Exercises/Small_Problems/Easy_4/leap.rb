def leap_year?(year)
  year = absolute(year) if year <= 0
  (return true if year % 4 == 0 unless year % 100 == 0 && year % 400 != 0) if year > 1752
  (return true if year % 4 == 0) if year <= 1752
  false
end

def absolute(int)
  while int <= 0
    puts "Year must be greater than 0"
    int = gets.chomp.to_i
  end
  int
end
puts leap_year?(1900)