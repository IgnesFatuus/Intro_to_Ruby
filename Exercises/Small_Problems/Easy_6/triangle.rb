def triangle(int, case_o="RU")
  int = int.abs
  case case_o
  when "RU"
    int.times { |n| puts ("*" * n).rjust(int) }
  when "RD"
    int.downto(0) { |n| puts ("*" * n).rjust(int) }
  when "LU"
    int.times { |n| puts ("*" * n).ljust(int) }
  when "LD"
    int.downto(0) { |n| puts ("*" * n).ljust(int) }
  end
end

triangle(5)
triangle(5, "RU")
triangle(5, "RD")
triangle(5, "LU")
triangle(5, "LD")
