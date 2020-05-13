def fizzbuzz(num1, num2)
  string = []
  num1.upto(num2) do |num|
    if num % 3 == 0 && num % 5 == 0
      string << "FizzBuzz"
    elsif num % 3 == 0
      string << "Fizz"
    elsif num % 5 == 0
      string << "Buzz"
    else
      string << "#{num}"
    end
  end
  puts string.join(", ")
end

fizzbuzz(1, 15)