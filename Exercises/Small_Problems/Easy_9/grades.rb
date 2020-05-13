HASH_OF_GRADES = (
  (90..100).each_with_object({}) { |n, h| h[n] = "A" }.merge(
  (80...90).each_with_object({}) { |n, h| h[n] = "B" }).merge(
  (70...80).each_with_object({}) { |n, h| h[n] = "C" }).merge(
  (60...70).each_with_object({}) { |n, h| h[n] = "D" }).merge(
  (0...60).each_with_object({}) { |n, h| h[n] = "F" })
).sort.to_h

def grade(int_1, int_2, int_3)
  avg = (int_1 + int_2 + int_3) / 3
  return "A+" if avg > 100
  HASH_OF_GRADES[avg.to_i]
end

def get_grade(*nums)
  mean   = ( nums.reduce(&:+) / nums.size )
  scores = { "A" => (90..100), "B" => (80..89),
             "C" => (70..79), "D" => (60..69),
             "F" => (0..59) }
  scores.select { |grade, score| score.include?(mean) }.keys.pop
end

#WILL SET THE KEY TO EACH VALUE BETWEEN A..B

get_grade(95, 90, 93) == "A"
puts grade(95, 90, 93) == "A"
puts grade(50, 50, 95) == "D"