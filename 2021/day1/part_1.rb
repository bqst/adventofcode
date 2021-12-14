lines = File.read('input').split.map(&:to_i)

n_increases = 0

lines.each_cons(2) do |a, b|
  n_increases += 1 if a < b
end

puts n_increases
