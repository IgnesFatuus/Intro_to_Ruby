DEGREE = "\xC2\xB0"
def dms(degree)
  size = decimal_length(degree)
  while degree >= 360 || degree < 0
    degree = large_degree(degree, size)
  end 
  degree_final = degree.floor(0)
  minutes = ((degree - degree_final).round(size)) * 60
  minutes_final = minutes.floor(0)
  seconds = ((minutes - minutes_final).round(size)) * 60
  sprintf("%d%s%02d%s%02d%s", degree_final, DEGREE, minutes_final, "\'", seconds.to_i, "\"")
end

def decimal_length(number)
  string = number.to_s
  string = string.partition(".")
  size = (string[2].length + string[0].length).to_f
  size.to_f
end

def large_degree(degree, size)
  if degree >= 360 
    return degree = degree - ((degree / 360) * 360).round(size)
  end
  if degree <= -360
    degree = degree + ((degree / 360) * -360).round(size)
  else
    degree += 360
  end
  degree
end

puts dms(-690)
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")