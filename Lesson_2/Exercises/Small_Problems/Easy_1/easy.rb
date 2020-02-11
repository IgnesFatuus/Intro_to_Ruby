def repeat(str, int)
  int.times { puts str }
end

# repeat("Hello", 3)

def is_odd?(num)
  if num.abs % 2 == 1
    true
  else
    false
  end
end
=begin
puts is_odd?(15)
puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)
=end

def splitter(num)
  num = num.to_s.split("")
  num.map(&:to_i)
end
=begin
puts splitter(1564) == [1, 5, 6, 4]
puts splitter(7) == [7]
puts splitter(375290) == [3, 7, 5, 2, 9, 0]
puts splitter(444) == [4, 4, 4]
=end

def redundancy(array, sensitive=true)
  if sensitive == false
    array = lower(array)
  end
  base = array.to_a.sort! { |x, y| x.to_s <=> y.to_s }.uniq
  occurence = {}
  n, b = 0, 0
  base.each do |x|
    while x == array[n]
      n += 1
    end
    occurence[x] = n - b
    b = n
  end
  puts occurence
end

def lower(stuff)
  stuff.each do |x|
    if x.is_a? String
      x.downcase!
    end
  end
  stuff
end

stuff = ["car", "car", "truck", "car", "suv", "SUV", "truck",
  "motorcycle", "motorcycle", "car", "truck", 5, 5, 5]
# redundancy(stuff)

def uno_reverse(str)
  str = str.split(" ").reverse.join(" ")
  str
end
=begin
puts uno_reverse("") == ""
puts uno_reverse("Hello World") == "World Hello"
puts uno_reverse("Reverse these words") == "words these Reverse"
=end

def reverse_five(str)
  str = str.split(" ")
  str.each do |s|
    s.to_s
    s.reverse! if s.length >= 5
  end
  str.join(" ")
end
=begin
puts reverse_five("Professional")          # => lanoisseforP
puts reverse_five("Walk around the block") # => Walk dnuora the kcolb
puts reverse_five("Launch School")
=end

def bi(i)
  string = []
  i.times do |n|
    if n.even?
      string << "1"
    else
      string << "0"
    end
  end
  string.join
end
=begin
puts bi(6) == "101010"
puts bi(9) == "101010101"
puts bi(4) == "1010"
puts bi(7) == "1010101"
=end

def mean(nums)
  sum = nums.reduce { |x, y| x.to_f + y.to_f}
  sum / nums.length.to_f
end
=begin
puts mean([1, 5, 87, 45, 8, 8])
puts mean([9, 47, 23, 95, 16, 52])
=end

def sum(i)
  sum = i.digits.reduce(:+)
  sum
end
=begin
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
=end

def bonus(i, boolean=false)
  return 0 unless boolean
  i / 2
end
=begin
puts bonus(2800, true) == 1400
puts bonus(1000) == 0
puts bonus(50000, true) == 25000
=end

