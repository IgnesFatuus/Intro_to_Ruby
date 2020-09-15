def create_scale(row_1, row_2, row_3, marker, pc_marker)
  arr = [row_1, row_2, row_3]
  scale = arr.map.with_index do |sub_arr|
    sub_arr.map.with_index do |square|
      case square
      when [marker]
        square = -2
      when [pc_marker]
        square = -1
      when ["-"]
        square = 0
      end
      square
    end
  end
  scale = create_weighted_scale(scale)
end

def create_weighted_scale(scale)
  for r in 0..2 do
    for c in 0..2 do
      case scale[r][c]
      when -1
        #LEFT RIGHT
        scale = horizontal_pressure(scale, r, c, 2.0)
        #UP DOWN
        scale = vertical_pressure(scale, r, c, 2.0)
        #DIAGONAL
        scale = diagonal_pressure(scale, r, c, 2.0)
      when -2
        #LEFT RIGHT
        scale = horizontal_pressure(scale, r, c, 3.0)
        #UP DOWN
        scale = vertical_pressure(scale, r, c, 3.0)
        #DIAGONAL
        scale = diagonal_pressure(scale, r, c, 3.0)
      end
    end
  end
  scale
end

def cpu_mark(scale)
  max_rand, weighted_values = weights(scale)
  loc = cpu_choice(cpu_decision(max_rand, weighted_values, scale), weighted_values, scale)
  loc.flatten!
  loc
end

def weights(scale)
  weight = {}
  scale.each do |row|
    row.each do |value|
      next if value == -2 || value == -1
      if weight.keys.include? (value)
        weight[value] += value
      else
        weight[value] = value
      end
    end
  end
  max_rand = weight.values.reduce(:+)
  return max_rand, weight
end

def cpu_decision(max_rand, weight, scale)
  rand_num = rand(0..max_rand).to_i
  decision = false
  weight = sort_it(weight)
  for i in 0...weight.keys.size
    return weight.keys[-1] if rand_num == 0
    if rand_num < weight[weight.keys[i]]
      return decision = weight.keys[i]
    end
  end
  weight.keys[0]
end

def cpu_choice(decision, weight, scale)
  choices = []
  scale.each_with_index do |sub_arr, r|
    sub_arr.each_with_index do |value, c|
      if value == decision
        choices << [r, c]
      end
    end
  end
  choices.sample(1)
end

def horizontal_pressure(scale, r, c, pressure)
  case c
  when 0
    scale[r][c + 1] += pressure unless scale[r][c + 1] == -2 || scale[r][c + 1] == -1
  when 1
    scale[r][c + 1] += pressure unless scale[r][c + 1] == -2 || scale[r][c + 1] == -1
    scale[r][c - 1] += pressure unless scale[r][c - 1] == -2 || scale[r][c - 1] == -1
  when 2
    scale[r][c - 1] += pressure unless scale[r][c - 1] == -2 || scale[r][c - 1] == -1
  end
  scale
end

def vertical_pressure(scale, r, c, pressure)
  case r
  when 0
    scale[r + 1][c] += pressure unless scale[r + 1][c] == -2 || scale[r + 1][c] == -1
  when 1
    scale[r + 1][c] += pressure unless scale[r + 1][c] == -2 || scale[r + 1][c] == -1
    scale[r - 1][c] += pressure unless scale[r - 1][c] == -2 || scale[r - 1][c] == -1
  when 2
    scale[r - 1][c] += pressure unless scale[r - 1][c] == -2 || scale[r - 1][c] == -1
  end
  scale
end

def diagonal_pressure(scale, r, c, pressure)
  case r
  when 0
    case c
    when 0
      scale[r + 1][c + 1] += pressure unless scale[r + 1][c + 1] == -2 || scale[r + 1][c + 1] == -1
    when 1
      scale[r + 1][c + 1] += (pressure * 0.5) unless scale[r + 1][c + 1] == -2 || scale[r + 1][c + 1] == -1
      scale[r + 1][c - 1] += (pressure * 0.5) unless scale[r + 1][c - 1] == -2 || scale[r + 1][c - 1] == -1
    when 2
      scale[r + 1][c - 1] += pressure unless scale[r + 1][c - 1] == -2 || scale[r + 1][c - 1] == -1
    end
  when 1
    case c
    when 0
      scale[r + 1][c + 1] += (pressure * 0.5) unless scale[r + 1][c + 1] == -2 || scale[r + 1][c + 1] == -1
      scale[r - 1][c + 1] += (pressure * 0.5) unless scale[r - 1][c + 1] == -2 || scale[r - 1][c + 1] == -1
    when 1
      scale[r + 1][c + 1] += pressure unless scale[r + 1][c + 1] == -2 || scale[r + 1][c + 1] == -1
      scale[r + 1][c - 1] += pressure unless scale[r + 1][c - 1] == -2 || scale[r + 1][c - 1] == -1
      scale[r - 1][c + 1] += pressure unless scale[r - 1][c + 1] == -2 || scale[r - 1][c + 1] == -1
      scale[r - 1][c - 1] += pressure unless scale[r - 1][c - 1] == -2 || scale[r - 1][c - 1] == -1
    when 2
      scale[r + 1][c - 1] += (pressure * 0.5) unless scale[r + 1][c - 1] == -2 || scale[r + 1][c - 1] == -1
      scale[r - 1][c - 1] += (pressure * 0.5) unless scale[r - 1][c - 1] == -2 || scale[r - 1][c - 1] == -1
    end
  when 2
    case c
    when 0
      scale[r - 1][c + 1] += pressure unless scale[r - 1][c + 1] == -2 || scale[r - 1][c + 1] == -1
    when 1
      scale[r - 1][c + 1] += (pressure * 0.5) unless scale[r - 1][c + 1] == -2 || scale[r - 1][c + 1] == -1
      scale[r - 1][c - 1] += (pressure * 0.5) unless scale[r - 1][c - 1] == -2 || scale[r - 1][c - 1] == -1
    when 2
      scale[r - 1][c - 1] += pressure unless scale[r - 1][c - 1] == -2 || scale[r - 1][c - 1] == -1
    end
  end
  scale
end

def sort_it(weight)
  w_keys = weight.keys.sort { |k1, k2| k2 <=> k1 }
  i = 0
  sorted_weight = {}
  until i == w_keys.size
    sorted_weight[w_keys[i]] = weight[w_keys[i]]
    i += 1
  end
  sorted_weight
end

#Exercises/Challenges_101
