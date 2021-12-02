lines = File.read('input').split("\n").map { |line| l = line.split; [l[0], l[1].to_i] }

aim        = 0
depth      = 0
horizontal = 0

lines.each do |dir, i|
  case dir
  when 'down'
    aim += i
  when 'up'
    aim -= i
  when 'forward'
    horizontal += i
    depth += aim * i
  end
end

puts depth * horizontal
