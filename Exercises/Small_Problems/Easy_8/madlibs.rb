def madlibs
  noun, verb, adj, adverb = prompts
  puts "Do you #{verb} your #{adj} #{noun} #{adverb}?"
end

def prompts
  print "Enter a noun: "
  noun = gets.chomp
  print "Enter a verb: "
  verb = gets.chomp
  print "Enter an adjective: "
  adj = gets.chomp
  print "Enter an adverb: "
  adverb = gets.chomp
  return noun, verb, adj, adverb
end

madlibs

#COULD READ IN A TEXT FILE, MODIFY TO DO SO IN SEPARATE FUNCTION