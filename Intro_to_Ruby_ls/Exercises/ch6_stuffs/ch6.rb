#Unshift is the opposite of pop
#Unshift adds an item you specify to the fornt of the array/list
#Pop takes the last item out
=begin
a = [1, 2, 3, 4]
a.pop #=> [1, 2, 3]
a.unshift(0) #=> [0, 1, 2, 3]
p a
#product combines each element of an array with the given variables
p a.product([4, 5]) #=> product is not destructive
#[0, 4], [0, 5], etc...
p a
#.flatten takes a nested array and creates a one dimensional array
#so an array of [[1,2], [3,4]] would become [1, 2, 3, 4], but is not destructive
=end

#Exercise 1
x = [1, 2, 3, 4, 5, 10, 11]
arr = [1, 3, 5, 7, 9, 11]
#p arr.select { |x| x == 3}
x.each{ |x| 
if arr.include?(x)
	puts "#{x} is in the array"
end
}

#Exercise 2
arr = ["b", "a"]
arr = arr.product(Array(1..3))
p arr
p arr.first.delete(arr.first.last)
p arr

 arr = ["b", "a"]
 arr = arr.product([Array(1..3)])
 p arr.first.delete(arr.first.last)
 p arr

 #Exercise 3
 x = "example"
 arr = [["test", "hello", "world"],["example", "mem"]]
 arr2 = arr.flatten
 if arr2.include?(x)
 	puts "I found #{x}!"
 end
 #OR
 p arr.last.first

 #Exercise 4

arr = [15, 7, 18, 5, 12, 8, 5, 1]

p arr.index(5)

#p arr.index[5]

p arr[5]

#Exercise 5

string = "Welcome to America!"
a = string[6] #returns e
b = string[11] # returns A
c = string[19] # returns nil

#Exercise 6

#names = ['bob', 'joe', 'susan', 'margaret']
#names['margaret'] = 'jody'
#returns an error, fix below

names = ['bob', 'joe', 'susan', 'margaret']
names.pop
names << 'jody'
p names
#OR
names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody'
p names

#Exercise 7

x = [1, 2, 3, 4, 5, 10, 11]
p x.map{|x| x + 2}
p x
#OR
x = [1, 2, 3, 4, 5, 10, 11]
x2 = []
x.each { |x| 
	x2 << x + 2
}

p x
p x2