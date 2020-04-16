def before_midnight(time)
  return 0 if time =~ /^00\:00$|^24\:00$/
  time = time.partition(":")
  time[0], time[2] = time[0].to_i, time[2].to_i
  time[0] *= 60
  minutes = 1440 - (time[0] + time[2])
end

def after_midnight(time)
  return 0 if time =~ /^00\:00$|^24\:00$/
  time = time.partition(":")
  time[0], time[2] = time[0].to_i, time[2].to_i
  time[0] *= 60
  minutes = time[0] + time[2]
end

puts after_midnight("12:34")

puts before_midnight("12:34")