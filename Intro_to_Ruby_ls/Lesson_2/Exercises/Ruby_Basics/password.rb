pass = {"password" => "secret",
	"user" => "admin"}
count = 0
print ">> Please enter your username: "
a = gets.chomp
if a == pass["user"]
	print ">> Enter password: "
	b = gets.chomp
	count += 1
end
until a == pass["user"]
	puts "INVALID"
	print ">> Please enter your username: "
	a = gets.chomp
end
until b == pass["password"] || count > 1
	count += 1
	if b
		puts "INVALID"
	end
	print ">> Please enter your password: "
	b = gets.chomp
end
if count <= 2 && b == pass["password"]
	puts "Welcome, SSM!"
else
	puts "Terminating access"
end