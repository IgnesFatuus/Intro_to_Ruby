def greetings(name, status)
  puts "Hello, #{name.join(" ")}. Nice to have a #{status.values.join(" ")} around."
end

name = ["Mario", "Mario"]
occupation = { title: "Master", occupation: "Plumber" }

greetings(name, occupation)
