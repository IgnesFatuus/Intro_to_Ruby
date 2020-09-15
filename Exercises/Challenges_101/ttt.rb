require_relative "ttt_cpu.rb"
require_relative "ttt_cpu_conditions.rb"

COMMANDS = [["TL", "TC", "TR"], ["ML", "MC", "MR"], ["BL", "BC", "BR"]]
LOCATIONS = { TL: [0, 0], TC: [0, 1], TR: [0, 2],
              ML: [1, 0], MC: [1, 1], MR: [1, 2],
              BL: [2, 0], BC: [2, 1], BR: [2, 2]
            }.freeze
ERROR = ["This spot is already taken! Enter a new command!", "Uh-oh! That's not part of the command list!"]

def play_tic_tac_toe
  counter, input = 0, "filler"
  marker, pc_marker = pick_marker
  row_1, row_2, row_3 = { TL: ["-"], TC: ["-"], TR: ["-"] }, { ML: ["-"], MC: ["-"], MR: ["-"] }, { BL: ["-"], BC: ["-"], BR: ["-"] }
  board = [row_1, row_2, row_3]
  commands
  weighted_board = create_scale(board[0].values, board[1].values, board[2].values, marker, pc_marker)
  loop do
    display_board(board)
    current, counter = alternate_player(counter)
    board, input, weighted_board = make_a_move(current, board, weighted_board, input, marker, pc_marker)
    break puts game_over(board, marker, pc_marker) if board_full?(board) || someone_won?(board, marker, pc_marker)
    counter += 1
  end
end

def alternate_player(x)
  current = [1, 2]
  x = 0 if x > 1
  return current[x], x
end

def make_a_move(current, board, weighted_board, input, marker, pc_marker)
  case current
  when 1
    board, input = mark_board_human(user_input, marker, board)
  when 2
    board, weighted_board = cpu(board, weighted_board, input.to_sym, pc_marker, marker)
  end
  return board, input, weighted_board
end

def display_board(board)
  print board[0].values, "\n", board[1].values, "\n", board[2].values, "\n"
end

def user_input
  puts "Your turn!"
  gets.chomp.upcase
end

def commands
  puts "Below are the commands to mark a location on the board when prompted."
  print COMMANDS[0], "\n", COMMANDS[1], "\n", COMMANDS[2], "\n", "exit", "\n"
end

def mark_board_human(input, marker, board)
  input = check_board(input, marker, board)
  case input[0]
  when /t/i
    board[0][input.to_sym] = [marker]
  when /m/i
    board[1][input.to_sym] = [marker]
  when /b/i
    board[2][input.to_sym] = [marker]
  else
    puts ERROR[1]
    board, input = mark_board_human(input, marker, board)
  end
  return board, input
end

def check_board(input, marker, board)
  exit if input =~ /^exit$/i
  case input[0]
  when /t/i
    input_c = check_error(input, board, 0)
  when /m/i
    input_c = check_error(input, board, 1)
  when /b/i
    input_c = check_error(input, board, 2)
  end
  input = check_board(input_c, marker, board) if !!input_c
  input.upcase
end

def check_error(input, board, x)
  input_c = false
  if !(board[x].keys.include?(input.to_sym))
    puts ERROR[1]
    input_c = gets.chomp.upcase
  elsif board[x][input.to_sym] != ["-"]
    puts ERROR[0]
    input_c = gets.chomp.upcase
  end
  input_c
end

def cpu(board, weighted_board, input, pc_marker, h_mark)
  weighted_board = apply_human_pressure(weighted_board, input)
  weighted_board = check_conditions(weighted_board, h_mark, pc_marker, board)
  location = cpu_mark(weighted_board)
  weighted_board = apply_cpu_pressure(weighted_board, LOCATIONS.key(location))
  board[location[0]][board[location[0]].keys[location[1]]] = [pc_marker]
  return board, weighted_board
end

def apply_human_pressure(weighted_board, input)
  weighted_board[LOCATIONS[input][0]][LOCATIONS[input][1]] = -2
  weighted_board = horizontal_pressure(weighted_board, LOCATIONS[input][0], LOCATIONS[input][1], 3.0)
  weighted_board = vertical_pressure(weighted_board, LOCATIONS[input][0], LOCATIONS[input][1], 3.0)
  weighted_board = diagonal_pressure(weighted_board, LOCATIONS[input][0], LOCATIONS[input][1], 3.0)
  weighted_board
end

def apply_cpu_pressure(weighted_board, cpu_input)
  weighted_board[LOCATIONS[cpu_input][0]][LOCATIONS[cpu_input][1]] = -1
  weighted_board = horizontal_pressure(weighted_board, LOCATIONS[cpu_input][0], LOCATIONS[cpu_input][1], 2.0)
  weighted_board = vertical_pressure(weighted_board, LOCATIONS[cpu_input][0], LOCATIONS[cpu_input][1], 2.0)
  weighted_board = diagonal_pressure(weighted_board, LOCATIONS[cpu_input][0], LOCATIONS[cpu_input][1], 2.0)
  weighted_board
end

def board_full?(board)
  !get_markers(board).any?("-")
end

def get_markers(board)
  markers = []
  board.each do |h|
    markers << h.values
  end
  markers.flatten
end

def game_over(board, h_mark, pc_mark)
  if someone_won?(board, h_mark, pc_mark)
    return "#{detect_winner(board, h_mark, pc_mark)}"
  elsif board_full?(board)
    return "Cat's game~"
  end
end

def someone_won?(board, h_mark, pc_mark)
  !!detect_winner(board, h_mark, pc_mark)
end

def detect_winner(board, h_mark, pc_mark)
  winning_lines = [[:TL, :TC, :TR], [:ML, :MC, :MR], [:BL, :BC, :BR]] + # rows
                  [[:TL, :ML, :BL], [:TC, :MC, :BC], [:TR, :MR, :BR]] + # columns
                  [[:TL, :MC, :BR], [:TR, :MC, :BL]] # diagonal
  for x in 0..7 do
    return detect_rows(board, x, winning_lines, h_mark, pc_mark) if x < 3 && !!detect_rows(board, x, winning_lines, h_mark, pc_mark)
    return "player wins!" if board[0][winning_lines[x][0]] == [h_mark] && board[1][winning_lines[x][1]] == [h_mark] && board[2][winning_lines[x][2]] == [h_mark]
    return "computer wins!" if board[0][winning_lines[x][0]] == [pc_mark] && board[1][winning_lines[x][1]] == [pc_mark] && board[2][winning_lines[x][2]] == [pc_mark]
  end
  false
end

def detect_rows(board, x, winning_lines, h_mark, pc_mark)
  i = x
  return "player wins!" if board[i][winning_lines[x][0]] == [h_mark] && board[i][winning_lines[x][1]] == [h_mark] && board[i][winning_lines[x][2]] == [h_mark]
  return "computer wins!" if board[i][winning_lines[x][0]] == [pc_mark] && board[i][winning_lines[x][1]] == [pc_mark] && board[i][winning_lines[x][2]] == [pc_mark]
  false
end

def pick_marker
  hash_markers = { "X" => "X", "O" => "O" }
  puts "Would you like to be 'X' or 'O'?"
  marker = gets.chomp
  until marker =~ /^O$|^X$/i
    puts "Valid choices are 'X' or 'O'"
    marker = gets.chomp
  end
  marker.upcase!
  hash_markers.delete(marker)
  pc_mark = hash_markers.values[0]
  return marker, pc_mark
end

input = "y"
while input =~ /^y$|^yes$/i
  play_tic_tac_toe
  puts "Play again? Y/N: "
  input = gets.chomp
end
# Update victory and defeat condition checks to be based off new information rather than checking everywhere everytime
# Current Version: FUNCTIONAL

#Exercises/Challenges_101
