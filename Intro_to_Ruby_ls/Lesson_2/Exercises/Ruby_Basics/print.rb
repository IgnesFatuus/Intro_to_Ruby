print ">> How many output lines do you want to print? Number >= 3: "
a = gets.chomp.to_i
if a >= 3
	a.times {|n| puts "#{n} lines"}
else
	until a >= 3
		puts "BUILD ADDITIONAL PYLONS"
		print ">>  Enter a number >= 3: "
		a = gets.chomp.to_i
		if a >= 3
			a.times {|n| puts "#{n} lines"}
		end
	end
end