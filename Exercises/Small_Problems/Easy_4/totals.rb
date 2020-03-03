def running_totals(nums)
  sum = 0
  nums.each_with_object([]) {|x, a| a << sum += x}
end

print running_totals([5, 4, 3, 2, 1])