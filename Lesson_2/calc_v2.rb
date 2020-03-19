require "yaml"
require "pry"

DIGITS =
  {
    "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
    "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
  }

VALIDS =
  {
    "(" => true, ")" => true, "*" => true, "**" => true,
    "/" => true, "+" => true, "-" => true
  }

def clean_expression(operation)
  clean_op = operation.map { |value| clean_digits(value) }
end

def clean_digits(digit)
  if digit =~ /\d/
    return digit
  elsif digit =~ /\W/
    return clean_operators(digit)
  end
  digit
end

def clean_operators(operator)
  if operator =~ /\-+/
    operator.split("").length.even? ? operator = "+" : operator = "-"
  elsif operator =~ /\++/
    operator = "+"
  end
  operator
end

def validate(equation, errors=[], error_count=0)
  equation = equation.split("")
  error_count, errors = validate_individuals(equation, errors, error_count)
  error_count, errors = validate_paranthesis_count(equation, errors, error_count)
  error_count, errors = validate_operator_space(equation, errors, error_count)
  error_count, errors = validate_operator_combos(equation, errors, error_count)
  error_count, errors = validate_first_operator(equation, errors, error_count)
  error_count, errors = validate_last_operator(equation, errors, error_count)
  # add better error details for validate first and last
  # include up to last/first digit in equation
  if error_count > 0
    return false, error_count, errors
  end
  return true, error_count, errors
end

def validate_last_operator(equation, errors, error_count)
  if equation.last =~ /[\d\)]$/
    return error_count, errors
  else
    error_count += 1
    errors << ["Invalid ending to an expression", equation.last]
  end
  return error_count, errors
end

def validate_first_operator(equation, errors, error_count)
  if equation.first =~ /^[\d\-\+\(]/
    return error_count, errors
  else
    error_count += 1
    errors << ["Invalid start of expression", equation.first]
  end
  return error_count, errors
end

def validate_operator_combos(equation, errors, error_count)
  equation = equation.join
  temp = equation.split(/\w+/)
  temp.each_with_index do |x, i|
    if x =~ /[\*\-\+](?=\/)/
      error_count += 1
      errors << ["Invalid operator combination", temp[i]]
    elsif x =~ /[\/\-\+](=?\*+)/
      error_count += 1
      errors << ["Invalid operator combination", temp[i]]
    elsif x =~ /[\/\-\+\=\*](=?\=+)/
      error_count += 1
      errors << ["Invalid operator combination", temp[i]]
    elsif x =~ /\=(=?[\=+\+\-\*\/])/
      error_count += 1
      errors << ["Invalid operator combination", temp[i]]
    end
  end
  return error_count, errors
end

def validate_operator_space(equation, errors, error_count)
  equation = equation.join
  # (/(\(+)|(\)+)|(\-+)|(\++)|(\*+)|(\\+)/)
  temp = equation.split(/(\()|(\))|(\-+)|(\++)|(\*+)|(\/+)/)
  temp.each_with_index do |x, i|
    if x =~ /\*{3,}|\/{2,}/
      error_count += 1
      errors << ["Operators are too crowded!", temp[i]] if x.length > 3
      errors << ["Operator parties are not allowed", temp[i]] if x.length == 3
      errors << ["Divisors cannot provide company", temp[i]] if x.length == 2
    end
  end
  return error_count, errors
end

def validate_paranthesis_count(equation, errors, error_count)
  l_para, r_para = 0, 0
  equation.each do |para|
    l_para += 1 if para =~ /\(/
    r_para += 1 if para =~ /\)/
  end
  if l_para != r_para
    error_count += 1
    if multiple?(l_para, r_para)
      errors << ["Multiple unclosed paranthesis", (l_para - r_para).abs]
    else
      errors << ["Unclosed paranthesis present", 1]
    end
  end
  return error_count, errors
end

def multiple?(left, right)
  if (left - right).abs > 1
    return true
  end
  false
end

def validate_individuals(equation, errors, error_count)
  equation.each_with_index do |v, i|
    next if VALIDS.key?(v)
    next if DIGITS.key?(v)
    error_count += 1
    errors << [ "Not a valid operand!", equation[i]]
  end
  return error_count, errors
end

def display_errors(amount, errors)
  puts "Uh-oh! We seem to have found some errors"
  puts "#{amount}, in fact!"
  puts "Here's the list: "
  errors.each { |type, offender| puts "#{type} => #{offender}" }
end

def calculate(operation)
  operation.instance_eval(operation)
end
again = ""
valid_express = false
error_count = 0
errors = []
until again =~ /^NO$|^N$/
  until valid_express
    puts ">>>Enter an expression: "
    expression = gets.chomp
    exit if expression.downcase == "exit"
    expression = expression.split(" ").join("")
    
    valid_express, error_count, errors = validate(expression)
    
    display_errors(error_count, errors) if error_count > 0
  end
  group = expression.split(/(\(+)|(\)+)|(\-+)|(\++)/)
  expression = clean_expression(group)
  expression = expression.select { |blank| !(blank.empty?) }
  #everything above is cleaning up the expression (excluding validate)
  expression = expression.join

  #done cleaning
  print "#{expression} = "
  puts calculate(expression)
  puts "Would you like to calculate something else? Y/N: "
  again = gets.chomp.upcase
end