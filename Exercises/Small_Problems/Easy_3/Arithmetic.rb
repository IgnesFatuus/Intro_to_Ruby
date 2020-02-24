x = -1
y = -1
i = 0
until i == 2
  while x < 0
    puts ">> Enter a positive integer: "
    x = gets.chomp.to_i
    puts "Int must be greater than 0" if x <= 0
  end
  i += 1
  while y < 0
    puts ">> Enter another positive integer: "
    y = gets.chomp.to_i
    puts "Int must be greater than 0" if y <= 0
  end
  i += 1
end
puts "#{x} + #{y} = #{x + y}", "#{x} - #{y} = #{x - y}"
puts "#{x}/#{y} = #{x / y}", "#{x} * #{y} = #{x * y}"
puts "#{x} % #{y} = #{x % y}", "#{x}**#{y} = #{x ** y}"