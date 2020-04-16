def time_of_day(num)
  return "00:00" if num == 0
  time_arr = ["%02d", ":", "%02d"]
  hours, minutes = conversion(num)
  time_arr[0] = time_arr[0] % [hours]
  time_arr[2] = time_arr[2] % [minutes]
  time = time_arr.join
  print time
end

def conversion(num)
  og_num = num
  num *= -1 if num < 0
  minutes = num.digits(60)
  hours, minutes = num.digits(60).reverse if num >= 60
  days, hours = hours.digits(24).reverse if hours > 24
  if og_num < 0
    return negative_conditions(hours, minutes)
  end
  return hours, minutes
end

def negative_conditions(hrs, mins)
  hrs += 1 if mins > 0
  mins = 60 if mins == 0
  hrs, mins = 24 - hrs, 60 - mins
  return hrs, mins
end

time_of_day(1500)
