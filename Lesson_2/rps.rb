require "yaml"
record = YAML.load_file("rps_career.yml")
MESSAGES = YAML.load_file("rps_msg.yml")
VARIATIONS =
  {
    "paper" => { "rock" => 1, "paper" => 2, "scissors" => 3 },
    "rock" => { "scissors" => 1, "rock" => 2, "paper" => 3 },
    "scissors" => { "paper" => 1, "scissors" => 2, "rock" => 3 }
  }
OUTCOMES = { 1 => "won!", 0 => "tied!", -1 => "lost!" }
RECORD_VALUES = { 1 => "wins", 0 => "ties", -1 => "losses" }

def display_records?(record)
  puts MESSAGES["display_record"]
  display_ans = gets.chomp.downcase
  if display_ans =~ /^yes$|^y$/
    puts ">>> current, career, or both?(default is both): "
    type = gets.chomp.downcase
    case type
    when "current"
      puts record["current"]
    when "career"
      puts record["career"]
    else puts record["career"], record["current"]
    end
  end
end

def write_to_records(record, battle)
  record["career"] ["career_#{RECORD_VALUES[battle]}"] += 1
  record["current"] ["current_#{RECORD_VALUES[battle]}"] += 1
  File.open("rps_career.yml", "w") { |l| l.write record.to_yaml }
end

def purge_record_current(record)
  record["current"] ["current_wins"] = 0
  record["current"] ["current_losses"] = 0
  record["current"] ["current_ties"] = 0
  File.open("rps_career.yml", "w") { |l| l.write record.to_yaml }
end
purge_record_current(record)
ans = [0, "z", 2]
again = "y"
puts MESSAGES["greeting"]
until !(again =~ /^yes$|^y$/)
  display_records?(record)
  until ans[1] =~ /^rock$|^paper$|^scissors$/
    ans[0] == 0 ? (puts MESSAGES["prompt_user"]) : (puts MESSAGES["prompt_bad_value"])
    ans[1] = gets.chomp.downcase
    ans[0] = "looped"
  end
  ans = VARIATIONS[ans[1]]
  cpu_value = rand(3) + 1
  cpu_choice = ans.key(cpu_value)
  battle_value = 2 - ans[cpu_choice]
  temp = MESSAGES["result"]
  result = temp % { player_choice: ans.key(2), cpu_choice: cpu_choice, outcome: OUTCOMES[battle_value] }
  puts result
  again = gets.chomp.downcase
  write_to_records(record, battle_value)
end
print "Before you leave, "
display_records?(record)
purge_record_current(record)
