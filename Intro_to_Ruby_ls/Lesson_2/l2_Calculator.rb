require "yaml"
MESSAGES = YAML.load_file("calc_msg.yml")
def calculate(operation)
  count = 0
  until count == 2
    b = false
    b2 = false
    while b == false && count.zero?
      b2 = false
      i = 0
      operation.each do |x|
        if x == "*"
          prod = operation[i - 1].to_f * operation[i + 1].to_f
          puts operation[i + 1] = prod
          operation.slice!((i - 1)..i)
          break
        elsif x == "/"
          q = operation[i - 1].to_f / operation[i + 1].to_f
          puts operation[i + 1] = q
          operation.slice!((i - 1)..i)
          break
        end
        i += 1
      end
      operation.each do |x|
        b2 = true if x == "*" || x == "/"
        break if b2
      end
      b = true unless b2
      # puts "loop"
    end
    while b == false && count == 1
      b2 = false
      i = 0
      operation.each do |x|
        if x == "+"
          sum = operation[i - 1].to_f + operation[i + 1].to_f
          puts operation[i + 1] = sum
          operation.slice!((i - 1)..i)
          break
        elsif x == "-"
          diff = operation[i - 1].to_f - operation[i + 1].to_f
          puts operation[i + 1] = diff
          operation.slice!((i - 1)..i)
          break
        end
        i += 1
      end
      operation.each do |x|
        b2 = true if x == "+" || x == "-"
        break if b2
      end
      b = true unless b2
      # puts "loop 2"
    end
    count += 1
    # puts "loop 3"
  end
end

def cleaner(nums, operands)
  i = 0
  nums.each do |x|
    next unless x =~ /\D+/
    puts MESSAGES["NonDigit"]
    return exit
  end
  operands.each do |o|
    if i.zero? && o =~ /\W/
      puts MESSAGES["BadStart"]
      return exit
    end
    if o =~ /\W/
      if o == operands[i + 1]
        puts MESSAGES["OperandAdj"]
        return exit
      end
    end
    i += 1
  end
  puts MESSAGES["valid"]
end

def fix(arr)
  fixed = false
  arr.each_with_index do |n, i|
    if n =~ /^0+\d/
      n = n.to_f
      arr[i] = n
      fixed = true
    end
  end
  arr
end
arr = []
clean = []
puts MESSAGES["welcome"]
puts MESSAGES["input"]
ans = gets.chomp
ans = ans.split(" ").join("") # made it uniform
arr << ans.split(/(\+|\-|\*|\/)/) # used capture group to save split elements
arr = arr.flatten
arr.delete_if {|a| a == "" }
clean << ans.split(/\+*\+|\-*\-|\**\*|\/*\//) # no capture group
clean = clean.flatten
clean.delete_if {|a| a == "" }
clean = fix(clean)
arr = fix(arr)
cleaner(clean, arr)

calculate(arr)

# Split is creating extra nil indices _FIXED 2/5/2020 11:59