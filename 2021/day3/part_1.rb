lines = File.read('input').split

gamma = lines.map(&:chars).transpose.map do |bits|
  count = bits.select.count { |bit| bit.eql?('0') }
  count > bits.size / 2 ? 0 : 1
end.join

gamma   = gamma.to_i(2)
epsilon = gamma ^ 0b111111111111 # XOR all bits

puts gamma * epsilon
