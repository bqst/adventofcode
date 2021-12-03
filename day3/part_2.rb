lines = File.read('input').split

lines_chars = lines.map(&:chars)

oxy = lines_chars.dup
count = 0
while oxy.length > 1
  bits = oxy.transpose[count].tally
  most_frequent_bit = bits['1'] >= bits['0'] ? '1' : '0'
  oxy.select! { |i| i[count].eql?(most_frequent_bit) }
  count += 1
end

co2 = lines_chars.dup
count = 0
while co2.length > 1
  bits = co2.transpose[count].tally
  lest_frequent_bit = bits['0'] <= bits['1'] ? '0' : '1'
  co2.select! { |i| i[count].eql?(lest_frequent_bit) }
  count += 1
end

oxy = oxy.join.to_i(2)
co2 = co2.join.to_i(2)

puts oxy * co2
