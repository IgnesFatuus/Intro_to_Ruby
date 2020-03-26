require "yaml"
$swap = 3
record_ls = YAML.load_file("rpsls_career.yml")
record = YAML.load_file("rps_career.yml")
MESSAGES = YAML.load_file("rpsls_msg.yml")
VARIATIONS =
  {
    "paper" => { "rock" => 1, "paper" => 2, "scissors" => 3 },
    "rock" => { "scissors" => 1, "rock" => 2, "paper" => 3 },
    "scissors" => { "paper" => 1, "scissors" => 2, "rock" => 3 }
  }

VARIATIONS_SL =
  {
    "paper" => { ["rock", "spock"] => 1, "paper" => 2, ["scissors", "lizard"] => 3 },
    "rock" => { ["scissors", "lizard"] => 1, "rock" => 2, ["paper", "spock"] => 3 },
    "scissors" => { ["paper", "lizard"] => 1, "scissors" => 2, ["rock", "spock"] => 3 },
    "spock" => { ["rock", "scissors"] => 1, "spock" => 2, ["paper", "lizard"] => 3 },
    "lizard" => { ["paper", "spock"] => 1, "lizard" => 2, ["scissors", "rock"] => 3 }
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

def write_to_records(record, battle, file_to_write)
  record["career"] ["career_#{RECORD_VALUES[battle]}"] += 1
  record["current"] ["current_#{RECORD_VALUES[battle]}"] += 1
  File.open(file_to_write, "w") { |l| l.write record.to_yaml }
end

def purge_record_current(record, file_to_purge)
  record["current"] ["current_wins"] = 0
  record["current"] ["current_losses"] = 0
  record["current"] ["current_ties"] = 0
  File.open(file_to_purge, "w") { |l| l.write record.to_yaml }
end

def classic(record)
  again = "y"
  until again =~ /^[^y][^e][^s]$|^[^y]$|^swap$/
    display_records?(record)
    ans = [0, "z", 2]
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
    write_to_records(record, battle_value, "rps_career.yml")
  end
  $swap = 0
  $swap = 2 if again == "swap"
end

def battle_outcome(slot)
  slot = VARIATIONS_SL[slot[1]]
  cpu_value = rand(3) + 1
  if cpu_value == 2
    cpu_choice = slot.key(cpu_value)
    battle_value = 2 - slot[cpu_choice]
  else
    array_choice = slot.key(cpu_value)
    cpu_choice = array_choice[rand(2)]
    battle_value = 2 - cpu_value
  end
  return battle_value, cpu_choice, slot
end
      
def version_sl(record_ls)
  again = "y"
  until again =~ /^[^y][^e][^s]$|^[^y]$|^swap$/
    display_records?(record_ls)
    ans = [0, "z", 2]
    until ans[1] =~ /^rock$|^paper$|^scissors$|^lizard$|^spock$/
      ans[0] == 0 ? (puts MESSAGES["prompt_user_sl"]) : (puts MESSAGES["prompt_bad_value_sl"])
      ans[1] = gets.chomp.downcase
      ans[0] = "looped"
    end

    battle_value, cpu_choice, ans = battle_outcome(ans)
    temp = MESSAGES["result"]
    result = temp % { player_choice: ans.key(2), cpu_choice: cpu_choice, outcome: OUTCOMES[battle_value] }
    
    puts result
    
    again = gets.chomp.downcase
    write_to_records(record_ls, battle_value, "rpsls_career.yml")
  end
  $swap = 0
  $swap = 1 if again == "swap"
end

purge_record_current(record, "rps_career.yml")
purge_record_current(record_ls, "rpsls_career.yml")

puts MESSAGES["greeting"], MESSAGES["note"]
version = gets.chomp.to_i

while $swap > 0
  version = $swap if $swap != 3
  if version == 2
    puts MESSAGES["swap_sl"] if $swap == 2
    version_sl(record_ls)
    next if $swap == 1
    print "Before you leave, "
    display_records?(record_ls)
  else
    puts MESSAGES["swap_classic"] if $swap == 1
    version = 1
    classic(record)
    next if $swap == 2
    print "Before you leave, "
    display_records?(record)
  end
end

purge_record_current(record, "rps_career.yml")
purge_record_current(record_ls, "rpsls_career.yml")

