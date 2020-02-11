sun = ["visible", "hidden"].sample

puts "The sun is so bright!" if sun == "visible"


puts "The clouds are blocking the sky!" unless sun == "visible"

boolean = [true, false].sample

boolean ? puts("true") : puts("false")

stoplight = ["green", "yellow", "red"].sample

case stoplight

when "green"; puts "Go!"

when "yellow"; puts "Caution"

when "red"; puts "Stop!" #OR else in normal format

end
#You can assign a case to a variable (Code written by Weston Ludeke)
#As it will be assigned the last line of code ran in a case statement
#Hence no puts/prints/p commands, much like how a method returns a value
stoplight = ['green', 'yellow', 'red'].sample

traffic_signal = case stoplight
when "green"; "Go!"; when "yellow"; "Slow down!"; else "Stop!"
end 

puts traffic_signal
#Convert to an if statement
=begin

if stoplight == "green"
	puts "Go!"
elsif stoplight == "yellow"
	puts "Caution"
else
	puts "Stop!"
end	
	
=end

status = ["awake", "tired"].sample

if status == "awake"
	puts "Be productive!"
else
	puts "Go to sleep!"
end

number = rand(10)

if number == 5
	puts "5 is a cool number"
else
	puts "Other numbers are cool too!"
end
