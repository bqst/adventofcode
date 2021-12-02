lines = File.read('input').split("\n").map { |line| l = line.split; [l[0], l[1].to_i] }

depth      = 0
horizontal = 0

lines.each do |dir, i|
  case dir
  when 'forward'
    horizontal += i
  when 'down'
    depth += i
  when 'up'
    depth -= i
  end
end

puts depth * horizontal
