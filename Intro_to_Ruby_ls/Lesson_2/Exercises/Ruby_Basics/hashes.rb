car = { 
	type: "Sedan",
	colour: "blue",
	mileage: "80_000"
}
car[:year] = 2003
car.delete(:mileage)
#puts car[:colour]


vehicles = {
		truck: {type: "pickup", colour: "red", year: 1998},
		car: {type: "Sedan", colour: "blue", year: 2003}
}

numbers = {
	high: 100,
	medium: 50,
	low: 10
}
numbers.each{|x, y| puts "A #{x.to_s} number is #{y.to_s}"}

half = numbers.map{|x, y| y / 2}

low = numbers.select!{|x, y| y < 25}
p low
p numbers

car_arr = [[type: "Sedan"], [color: "blue"], [year: 2003]] #Maintains hash, but creates a nested array containing hashes
car_arr = [[:type, "Sedan"], [:color, "blue"], [:year, 2003]] #Is a fully nested array, no hashes
