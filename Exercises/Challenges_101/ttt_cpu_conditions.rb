XX_H = [-2, -2]
XX_C = [-1, -1]

def check_conditions(scale, h_mark, pc_mark, board)
  winning_lines = [[[0, 0], [0, 1], [0, 2]], [[1, 0], [1, 1], [1, 2]], [[2, 0], [2, 1], [2, 2]]] + #rows
                  [[[0, 0], [1, 0], [2, 0]], [[0, 1], [1, 1], [2, 1]], [[0, 2], [1, 2], [2, 2]]] + #columns
                  [[[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]] #diagonal
  i = 0
  for x in 0..7 do
    scale[winning_lines[x][0][0]][winning_lines[x][0][1]], scale[winning_lines[x][1][0]][winning_lines[x][1][1]], scale[winning_lines[x][2][0]][winning_lines[x][2][1]] = detect_lines_col_diag(scale, board, x, winning_lines, h_mark, pc_mark)
  end
  scale
end

def detect_lines_col_diag(scale, board, x, winning_lines, h_mark, pc_mark)
  human_multiplier = 1.5
  computer_multiplier = 2
  line = [scale[winning_lines[x][0][0]][winning_lines[x][0][1]], scale[winning_lines[x][1][0]][winning_lines[x][1][1]], scale[winning_lines[x][2][0]][winning_lines[x][2][1]]]
  
  human_multiplier *= 2 if line[1..2] == XX_H || line[0..1] == XX_H
  computer_multiplier *= 2 if line[1..2] == XX_C || line[0..1] == XX_C

  line.map! { |pressure| pressure *= human_multiplier if pressure != -2
                pressure
              } if line.count(-2) == 2 && line.count(-1) == 0

  line.map! { |pressure| pressure *= computer_multiplier if pressure != -1
                pressure
              } if line.count(-1) == 2 && line.count(-2) == 0

  return line[0], line[1], line[2]
end

#ROW DETECTION STATUS: COMPLETE
#COLUMN DETECTION STATUS: COMPLETE
#DIAGONAL DETECTION STATUS: COMPLETE
#DETECTION STATUS: COMPLETE
#DEFECTS: FIXED WEAK PATTERNS
#TO-DO:

#Exercises/Challenges_101
