=begin

Write a one line program that outputs a string ten times, each time indented one space further
  
  10.times{ |x| puts "The Flintstones Rock!".rjust(x + "The Flintstones Rock!".length) }


The result of the following statement will be an error
puts "the value of 40 + 2 is " + (40 + 2)
Why is this and what are two possible ways to fix this?
  
  (40+2) is an integer that ruby is attempting to concatenat into a string, raising a TypeError
  To fix this one would need to convert it into a string first
  Fix 1: (40+2).to_s
  Fix 2: STRING #{40 + 2}


Write the below code without using begin/end/until and so that it does not break a nonpositive number
What is the purpose of the number % divisor == 0 ?
  
  To determine whole number factors (i.e. Looks for a remainder of 0)

What is the purpose of the second-to-last line (line 8)
in the method (the factors before the method's end)?
  
  To return the array of factors


def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

  def factors(number)
    divisor = number
    factors = []
    while divisor > 0
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end
    factors
  end

Alyssa was asked to write an implementation of a rolling buffer.
Elements are added to the rolling buffer and if the buffer becomes full,
then new elements that are added will displace the oldest elements in the buffer.
She wrote two implementations saying, "Take your pick.
Do you like << or + for modifying the buffer?".
Is there a difference between the two,
other than what operator she chose to use to add an element to the buffer?

  Yes, << will modify the original object passed in (i.e. it will modify the caller),
  while using x = a + b will not modify the original, but instead create a new reference to point to.


limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

What's wrong with the above code? How would you fix it?

  limit variable is assigned outside the scope of the method being called
  pass the limit variable into the method as an argument: fib(limit, x, y)


answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
What is the output of the above code?
  
  34


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
Does the above code permanently alter the hash? Why or why not?

  Yes it permanently alters the hash. It directly alters the caller, rather than creating a dummy variable first,
  in this case var demo_hash is, which is pointing at munsters, being direclty manipulated.
    >> Lesson answer <<"In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash."


def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
What does this ouput?
  paper


def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)
What does this output?

  no

=end
