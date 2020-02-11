require "yaml"
require "pry"
MESSAGES = YAML.load_file("loan_msg.yml")
def calc(loan, mir, n, t)
  n *= 12 if t == "years"
  loan = 0 unless loan
  mir = 0 unless mir
  return mp = 0 if loan == 0
  return mp = loan / n if mir == 0
  mp = loan * (mir / (1 - (1 + mir)**(-n)))
end

def display_mp(mp)
  "\nYour monthly installments amount to: #{mp}"
end

def month_interest(mir, opt=false)
  if mir =~ /\%/
    tmp = mir.split("")
    tmp.slice!(-1)
    mir = tmp.join.to_f
    mir /= 100.00
    return mir.to_f
  end
  if opt == true
    mir = mir.to_f
    mir /= 100.00
    return mir.to_f
  end
  mir.to_f
end

def duration_p
  puts " >> Loan duration: "
  n = conversion(gets.chomp).to_i
  until n != 0
    puts "Loan duration must not equal 0"
    puts ">> Loan duration: "
    n = conversion(gets.chomp).to_i
  end
  n
end

def conversion(num=0)
  b = false
  i = 0
  if num.split("").last =~ /\%/
    tmp = num.split("").pop
    b = true
  end
  num = num.split("")
  num.map! do |x|
    if x =~ /\D/
      if x == "." && i == 0
        i += 1
        x = x
      else
        x = "0"
      end
    else
      x
      # Keeps digits
    end
  end
  num.append(tmp) if b
  num = num.join
  num
end

def prompts_yml(string, options=[])
  msg = MESSAGES[string]
  return msg % { duration_type: options[:type], alteration: options[:alter] } unless options.empty?
  msg
end

def change(ans, options, target)
  if ans.downcase == "yes" || ans.downcase == "y"
    return "years" if options[target.to_sym] == "months"
    return "months" if options[target.to_sym] == "years"
    return true if options[target.to_sym] == false
    return false if options[target.to_sym] == true
  end
  options[target.to_sym]
end

def settings(options)
  output_o = prompts_yml("options", options)
  puts output_o
  loop do
    options[:type] == "months" ? options[:type_opp] = "years" : options[:type_opp] = "months"
    options[:alter] == false ? options[:alter_opp] = true : options[:alter_opp] = false
    print "Loan duration type: #{options[:type]}\n >>Change to #{options[:type_opp]}? Y/N: "
    choice_type = gets.chomp
    options[:type] = change(choice_type, options, "type")
    print "Value alteration without '%': #{options[:alter]}\n >>Change to #{options[:alter_opp]}? Y/N: "
    choice_alter = gets.chomp
    options[:alter] = change(choice_alter, options, "alter")
    output_o = prompts_yml("options", options)
    print "\nProceed with current settings?\n#{output_o} >>Y/N: "
    permission = gets.chomp
    if permission.downcase == "yes" || permission.downcase == "y"
      puts "Proceeding with current settings"
      return options
    end
  end
end

options = {
  type: "months",
  type_opp: "years",
  alter: false,
  alter_opp: true
}
loan = 0.0
mir = 0.0
n = 0
output_w = prompts_yml("welcome", options)
# Setting up my YAML messages to have variables plugged into
puts output_w
ans = gets.chomp
ans.downcase!
options = settings(options) if ans == "options" || ans == "option"
puts " >> Loan amount: "
loan = conversion(gets.chomp).to_f
puts " >> Monthly Interest Rate: "
mir = conversion(gets.chomp)
options[:alter] == true ? mir = month_interest(mir, true) : mir = month_interest(mir)
puts mir
n = duration_p
pry.binding
mp = calc(loan, mir, n, options[:type])
display_mp(mp)
output_r = prompts_yml("repeat")
puts output_r
ans = gets.chomp
ans.downcase!
exit unless ans == "repeat" || ans == "options" || ans == "option"
