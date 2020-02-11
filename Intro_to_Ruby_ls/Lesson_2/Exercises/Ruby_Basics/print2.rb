puts "Most non-integers will be assigned a value of 0"
a = "yes"
loop do
	print ">> How many output lines do you want to print? Number >= 3 (Q to quit): "
	a = gets.chomp
	until a.to_i >= 3 || a.upcase == "Q"
		print "WE REQUIRE ADDITIONAL PYLONS: "
		a = gets.chomp
	end
	if a.upcase == "Q"
		break
	end
	a.to_i.times {|n| puts "#{n+1} lines"}
end
