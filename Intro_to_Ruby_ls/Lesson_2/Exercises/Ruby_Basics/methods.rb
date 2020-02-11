def print_me
	return "Im printing"
end

def hello
	return "Hello"
end

def world
	return "World"
end

def greet
	return "#{hello} #{world}"
end

def car(make, model)
	puts "#{make} #{model}"
end
daylight = [true, false].sample
def time(t)
	if t
		puts "It's daytime!"
	else
		puts "It's night time!"
	end
end

def dog(name)
	return name
end

def cat(name="Ginger")
	return name
end

def assign(name="Bob")
	return name
end

def add(x, y)
	return x + y
end

def multiply(a, b)
	return a * b
end

names = ["Dave", "Sally", "George", "Lucy"]
activities = ["walking", "running", "racing", "swimming"]

def activity(stuff)
	return stuff.sample
end

def people(name)
	return name.sample
end

def sentence(name, stuff)
	return "#{name} went #{stuff} today"
end

puts sentence(people(names), activity(activities))