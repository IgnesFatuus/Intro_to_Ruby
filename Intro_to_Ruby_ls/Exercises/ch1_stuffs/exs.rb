=begin
In the below snippets of code, I will demonstrate how variables can be used as pointers, and two different
operands that mutate the value and reassign an address respectively
=end

a = "hey"
b = a
a << "there"
#in this case, both a and b equal "hey there", as the << operand mutates the value, but not the address

a = "hey"
b = a
a = "no"
#in this case, a = "no" and b = "hey" as a was assigned to an entirely different address after b was assigned to it's pervious one
def test(b)
	b.map { |letter| "Letter: #{letter}"}
end

a = ['a', 'b', 'c']
p test(a)
p a