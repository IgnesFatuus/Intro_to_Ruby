def xor?(bool_1, bool_2)
  return true if !!bool_1 ^ !!bool_2
  false
end
# Double bangs to evaluate the truthiness of integers (if int is first)
